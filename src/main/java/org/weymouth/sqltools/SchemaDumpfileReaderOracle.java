package org.weymouth.sqltools;


public class SchemaDumpfileReaderOracle extends SchemaDumpfileReader {
	
	private static final String TABLE_HEADER_PREFIX = "--  DDL for Table ";
	private static final String FUNCTION_HEADER_PREFIX = "--  DDL for Function ";

	public SchemaDumpfileReaderOracle(String file) {
		super(file);
	}
	
	@Override
	boolean firstLineOfHeader(String line) {
		if (line.startsWith(TABLE_HEADER_PREFIX)) return true;
		if (line.startsWith(FUNCTION_HEADER_PREFIX)) return true;
		return false;
	}

	@Override
	Header readHeaderFromInput(String line) {
		String probe = line.substring(TABLE_HEADER_PREFIX.length()).trim();
		if ((line.startsWith(FUNCTION_HEADER_PREFIX))) 
			probe = line.substring(FUNCTION_HEADER_PREFIX.length()).trim();
		String text = line;
		String name = probe.trim();
		HeaderType type = HeaderType.TABLE;
		if ((line.startsWith(FUNCTION_HEADER_PREFIX))) 
			type = HeaderType.FUNCTION;
		String schema = null;
		String owner = null;
		Header ret = new Header(text,name,type,schema,owner);
		return ret;
	}

}
