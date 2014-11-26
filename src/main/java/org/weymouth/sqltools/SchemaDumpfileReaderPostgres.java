package org.weymouth.sqltools;

import java.io.IOException;

public class SchemaDumpfileReaderPostgres extends SchemaDumpfileReader {
	
	private static final String HEADER_PREFIX = "-- Name: ";
	
	private static final String TABLE_START1 = "CREATE TABLE";
	private static final String TABLE_START2 = "CREATE UNLOGGED TABLE";
	private static final String TABLE_END = ");";

	public SchemaDumpfileReaderPostgres(String file) {
		super(file);
	}

	@Override
	boolean isHeaderLine(String line) {
		return line.startsWith(HEADER_PREFIX);
	}

	@Override
	Header readHeaderFromInput(String line) {
		String probe = line.substring("-- ".length()).trim();
		if (probe.endsWith(":")) probe += " ";
		String text = line;
		String[] parts = text.split("; ");
		String name = super.nullIfEmpty(parts[0].split(":")[1].trim());
		HeaderType type = HeaderType.headerTypeFromString(super.nullIfEmpty(parts[1].split(":")[1].trim()));
		String schema = super.nullIfEmpty(parts[2].split(":")[1].trim());
		String owner = super.nullIfEmpty(parts[3].split(":")[1].trim());
		Header ret = new Header(text,name,type,schema,owner);
		return ret;
	}

//  am_data_id bigint NOT NULL,
//  unique_id character varying(300) NOT NULL,
//  am_data_type character varying(100) NOT NULL

	@Override
	TableColumn makeColumnFromLine(String line) throws IOException {
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

//	CREATE TABLE am_data_uid (
	
	@Override
	String tableNameFromTableStart(String line) {
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
	
	@Override
	boolean isTableStart(String line) {
		if (line.contains(TABLE_START1)) return true;
		if (line.contains(TABLE_START2)) return true;
		return false;
	}

	@Override
	boolean confirmTableEnd(String line) {
		if (line.contains(TABLE_END)) return true;
		return false;
	}

	@Override
	void updateSchemaIfNeeded(Header header, TableDetails details) {
		details.setSchema(header.getSchema());
	}

	@Override
	boolean shouldSkipTableLine(String line) {
		return false;
	}

}
