package org.weymouth.sqltools;

public class Header {

	//-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: weymouth
	
	final String text;
	final String name;
	final HeaderType type;
	final String schema;
	final String owner;
	
	public Header(String line) {
		String probe = line.substring("-- ".length()).trim();
		if (probe.endsWith(":")) probe += " ";
		text = probe;
		String[] parts = text.split("; ");
		name = nullIfEmpty(parts[0].split(":")[1].trim());
		type = HeaderType.headerTypeFromString(nullIfEmpty(parts[1].split(":")[1].trim()));
		schema = nullIfEmpty(parts[2].split(":")[1].trim());
		owner = nullIfEmpty(parts[3].split(":")[1].trim());
	}
	
	public String getSchemaWithName() {
		return schema + "." + name;
	}

	private String nullIfEmpty(String s) {
		if (s.isEmpty()) return null;
		if (s.equals("-")) return null;
		return s;
	}

	@Override
	public String toString() {
		return "Header [name=" + name + ", type=" + type + ", schema=" + schema
				+ ", owner=" + owner + "]";
	}
	
	
}
