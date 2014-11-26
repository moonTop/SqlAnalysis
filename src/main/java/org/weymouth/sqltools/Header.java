package org.weymouth.sqltools;

public class Header {

	//-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: weymouth
	
	final String text;
	final String name;
	final HeaderType type;
	final String schema;
	final String owner;
	
	public Header(String text, String name, HeaderType type, String schema,
			String owner) {
		this.text = text;
		this.name = name;
		this.type = type;
		this.schema = schema;
		this.owner = owner;
	}
	
	public String getSchemaWithName() {
		return schema + "." + name;
	}

	@Override
	public String toString() {
		return "Header [name=" + name + ", type=" + type + ", schema=" + schema
				+ ", owner=" + owner + "]";
	}
	
	
}
