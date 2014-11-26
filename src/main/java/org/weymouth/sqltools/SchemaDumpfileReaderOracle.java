package org.weymouth.sqltools;

import java.io.IOException;

public class SchemaDumpfileReaderOracle extends SchemaDumpfileReader {

	private static final String HEADER_PREFIX = "--  DDL for ";
	
	private static final String TABLE_START1 = "CREATE TABLE";
	private static final String TABLE_START2 = "CREATE GLOBAL TEMPORARY TABLE";
	
	private String capturedSchema = null;

	public SchemaDumpfileReaderOracle(String file) {
		super(file);
	}
	
	@Override
	boolean isHeaderLine(String line) {
		return line.startsWith(HEADER_PREFIX);
	}

	@Override
	Header readHeaderFromInput(String line) {
		String text = line;
		String probe = line.substring(HEADER_PREFIX.length()).trim();
		String[] parts = probe.split(" ");
		String typeString = parts[0];
		String name = parts[1];
		if (parts.length > 2) {
			for (int i = 1; i < (parts.length - 1); i++) {
				typeString += " " + parts[i];
				name = parts[i+1];
			}
		}
		HeaderType type = HeaderType.headerTypeFromString(typeString);
		String schema = null;
		String owner = null;
		Header ret = new Header(text,name,type,schema,owner);
		return ret;
	}

//	"C_VISUALATTRIBUTES" CHAR(3 BYTE), 
//	"C_TOTALNUM" NUMBER(22,0), 
//	"C_BASECODE" VARCHAR2(450 BYTE), 
//	"C_METADATAXML" CLOB, 

	@Override
	TableColumn makeColumnFromLine(String line) throws IOException {
		line = line.trim();
		if (isTableEnd(line)) return null;
		if (line.startsWith("("))
			line = line.substring(1).trim();
		int pos = line.indexOf(" ");		
		String name = stripQuotes(line.substring(0, pos)).trim();
		String type = cleanIt(line.substring(pos).trim()).trim();
		String rest = "";
		if (type.contains(" ")) {
			pos = type.indexOf(" ");
			if (type.contains("(")) {
				pos = type.indexOf(")") + 1;
			}
			rest = type.substring(pos);
			type = type.substring(0, pos);
		}
		return new TableColumn(name,type,rest);
	}

//	  CREATE TABLE "I2B2METADATA"."I2B2_BK" 
//    CREATE GLOBAL TEMPORARY TABLE "I2B2DEMODATA"."TEMP_PDO_INPUTLIST" 
	
	@Override
	String tableNameFromTableStart(String line) {
		line = line.trim();
		if (line.contains(TABLE_START1)) {
			line = line.replace(TABLE_START1, "").trim();
		}
		if (line.contains(TABLE_START2)) {
			line = line.replace(TABLE_START2, "").trim();
		}
		String schemaWithQuotes = line.split("\\.")[0].trim();
		capturedSchema = stripQuotes(schemaWithQuotes);
		String nameWithQuotes = line.split("\\.")[1].trim();
		String name = stripQuotes(nameWithQuotes);
		return name;
	}
	
	private String stripQuotes(String s) {
		s = s.replaceAll("\"","");
		return s.trim();
	}

	@Override
	boolean shouldSkipTableLine(String line) {
		line = line.trim();
		if (line.startsWith("("))
			line = line.replace("(", "").trim();
		return (line.startsWith("CONSTRAINT"));
	}
	
	@Override
	boolean isTableStart(String line) {
		if ((line.contains(TABLE_START1)) || (line.contains(TABLE_START2))) return true;
		return false;
	}

	@Override
	boolean confirmTableEnd(String line) {
		if (isTableEnd(line)) return true;
		return false;
	}

	@Override
	void updateSchemaIfNeeded(Header header, TableDetails details) {
		header.setSchema(capturedSchema);
		capturedSchema = null;
	}

	private boolean isTableEnd(String line) {
		line = line.trim();
		if (line.startsWith(")")) return true;
		return false;
	}

}

