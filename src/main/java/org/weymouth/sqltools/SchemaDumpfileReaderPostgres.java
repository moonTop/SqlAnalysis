package org.weymouth.sqltools;


public class SchemaDumpfileReaderPostgres extends SchemaDumpfileReader {
	
	private static final String HEADER_PREFIX = "-- Name: ";
	
	public SchemaDumpfileReaderPostgres(String file) {
		super(file);
	}

	@Override
	boolean firstLineOfHeader(String line) {
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


}
