package org.weymouth.sqltools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SchemaDumpfileReaderPostgres implements SchemaDumpfileReader {
	
	private static final String HEADER_PREFIX = "-- Name: ";
	private static final String TABLE_START1 = "CREATE TABLE";
	private static final String TABLE_START2 = "CREATE UNLOGGED TABLE";
	private static final String TABLE_END = ");";
	private final String filename;
	private File in = null;
	private BufferedReader reader = null;
	private List<Header> headers = new ArrayList<Header>();
	private Map<String,TableDetails> tableMap = new HashMap<String,TableDetails>();

	public SchemaDumpfileReaderPostgres(String filename) {
		this.filename = filename;
	}

	public Database buildDatabaseDescription(String name) throws IOException {
		readAll();
		return new Database(name,headers,tableMap);
	}	

	private void readAll() throws IOException {
		openReader();
		Header header = null;
		while ((header = scanToNextHeader()) != null){
			headers.add(header);
			if (header.type == HeaderType.TABLE) {
				TableDetails details = getTableDetails(header);
				if (details != null) {
					tableMap.put(header.getSchemaWithName(),details);
				}
			}
		}
		closeReader();
	}
	
	private void closeReader() throws IOException {
		in = null;
		BufferedReader r = reader;
		reader = null;
		r.close();
	}

	private Header scanToNextHeader() throws IOException {
		if (!isOpen()) throw new IOException("File not open for input: " + filename);
		String line = null;
		while ((line = readLineFromInput()) != null) {
			if (firstLineOfHeader(line)) {
				return readHeaderFromInput(line);
			}
		}
		return null;
	}

//	CREATE TABLE am_data_uid (
//    am_data_id bigint NOT NULL,
//    unique_id character varying(300) NOT NULL,
//    am_data_type character varying(100) NOT NULL
//);

	private TableDetails getTableDetails(Header header) throws IOException {
		String line;
		boolean readingTable = false;
		TableDetails ret = new TableDetails(header.name);
		while ((line = readLineFromInput()) != null){
			if (readingTable) {
				TableColumn c = makeColumnFromLine(line);
				if (c != null) {
					ret.addColumn(c);
				} else {
					if (confirmTableEnd(line))
						return ret;
					else {
						throw new IOException("Badlyformed table or other parsing problems: " + header.getSchemaWithName());
					}
				}
			} else if (isTableStart(line)) {
				String name = tableNameFromTableStart(line);
				if (!ret.name.equals(name)) return null;
				readingTable = true;
			}
		}
		return null;
	}

//    am_data_id bigint NOT NULL,
//    unique_id character varying(300) NOT NULL,
//    am_data_type character varying(100) NOT NULL

	private TableColumn makeColumnFromLine(String line) throws IOException {
		if (line.contains(TABLE_END)) return null;
		String[] words = line.trim().split(" ");
		if (words.length < 2) {
			throw new IOException("malformed table column line: " + line);
		}
		int index = 0;
		String name = cleanIt(words[index++]);
		String type = cleanIt(words[index++]);
		if (type.contentEquals("character")) {
			if (words.length < 3) {
				throw new IOException("malformed table column line: " + line);
			}
			type += " " + cleanIt(words[index++]);
		}
		String rest = "";
		while (index < words.length) {
			if (rest.isEmpty()) rest += cleanIt(words[index]);
			else rest += " " + cleanIt(words[index]);
			rest = rest.trim();
			index++;
		}
		return new TableColumn(name,type,rest);
	}

	private String cleanIt(String string) {
		String ret = string.trim();
		if (ret.endsWith(",")) {
			ret = ret.replace(",","");
		}
		return ret;
	}

//	CREATE TABLE am_data_uid (
	private String tableNameFromTableStart(String line) {
		int pos = 0;
		if (line.contains(TABLE_START1)) {
			pos = line.indexOf(TABLE_START1);
			pos += TABLE_START1.length();
		}
		if (line.contains(TABLE_START2)) {
			pos = line.indexOf(TABLE_START2);
			pos += TABLE_START2.length();
		}
		while (line.charAt(pos) == ' ') pos++;
		int end = line.indexOf(' ', pos);
		String name = line.substring(pos, end).trim();
		return name;
	}

	private boolean isTableStart(String line) {
		if (line.contains(TABLE_START1)) return true;
		if (line.contains(TABLE_START2)) return true;
		return false;
	}

	private boolean confirmTableEnd(String line) {
		if (line.contains(TABLE_END)) return true;
		return false;
	}

	private Header readHeaderFromInput(String line) {
		Header ret = new Header(line);
		return ret;
	}

	private boolean firstLineOfHeader(String line) {
		return line.startsWith(HEADER_PREFIX);
	}

	private String readLineFromInput() throws IOException {
		String line = reader.readLine();
//		System.out.println(line);
		return line;
	}

	private boolean isOpen() {
		if (in == null) return false;
		if (reader == null) return false;
		return true;
	}

	private void openReader() throws FileNotFoundException {
		in = new File(filename);
		reader = new BufferedReader(new FileReader(in));
	}

}
