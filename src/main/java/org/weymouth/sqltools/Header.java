package org.weymouth.sqltools;

public class Header {

	//-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: weymouth
	
	final private String text;
	final private String name;
	final private HeaderType type;
	private String schema;
	private String owner;
	
	public Header(String text, String name, HeaderType type, String schema,
			String owner) {
		this.text = text;
		this.name = name;
		this.type = type;
		this.schema = schema;
		this.owner = owner;
	}
	
	public String getSchema() {
		return schema;
	}

	public void setSchema(String schema) {
		this.schema = schema;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getText() {
		return text;
	}

	public String getName() {
		return name;
	}

	public HeaderType getType() {
		return type;
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
