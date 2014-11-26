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

public abstract class SchemaDumpfileReader {
	
	private String filename;
	private File in = null;
	private BufferedReader reader = null;
	private List<Header> headers = new ArrayList<Header>();
	private Map<String,TableDetails> tableMap = new HashMap<String,TableDetails>();

	public SchemaDumpfileReader(String filename) {
		this.filename = filename;
	}

	public Database buildDatabaseDescription(String name) throws IOException {
		readAll();
		return new Database(name,headers,tableMap);
	}	

	abstract boolean isHeaderLine(String line);
	abstract Header readHeaderFromInput(String line);
	abstract boolean isTableStart(String line);
	abstract boolean confirmTableEnd(String line);
	abstract String tableNameFromTableStart(String line);
	abstract TableColumn makeColumnFromLine(String line) throws IOException;
	abstract boolean shouldSkipTableLine(String line);
	abstract void updateSchemaIfNeeded(Header header, TableDetails details);
	

	private void readAll() throws IOException {
		openReader();
		Header header = null;
		while ((header = scanToNextHeader()) != null){
			headers.add(header);
			if (header.getType() == HeaderType.TABLE) {
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
			if (isHeaderLine(line)) {
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
		TableDetails ret = new TableDetails(header.getName());
		while ((line = readLineFromInput()) != null){
			if (readingTable) {
				if (shouldSkipTableLine(line)) {
					continue;
				}
				TableColumn c = makeColumnFromLine(line);
				if (c != null) {
					ret.addColumn(c);
				} else {
					if (confirmTableEnd(line)){
						updateSchemaIfNeeded(header, ret);
						if (header.getSchema() == null) {
							System.out.println("Null schema in header: " + header);
							System.out.println(header.getText());
						}
						return ret;						
					}
					else {
						throw new IOException("Badlyformed table or other parsing problems: " + header.getSchemaWithName());
					}
				}
			} else if (isTableStart(line)) {
				String name = tableNameFromTableStart(line);
				if (!ret.getName().equals(name)) return null;
				readingTable = true;
			}
		}
		return null;
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

	// utilities used by subclasses
	
	String readLineFromInput() throws IOException {
		String line = reader.readLine();
//		System.out.println(line);
		return line;
	}

	String cleanIt(String string) {
		String ret = string.trim();
		if (ret.endsWith(",")) {
			ret = ret.replace(",","");
		}
		return ret;
	}

	String nullIfEmpty(String s) {
		if (s.isEmpty()) return null;
		if (s.equals("-")) return null;
		return s;
	}

}
