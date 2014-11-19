package org.weymouth.sqltools;

public class TableColumn {

	final String name;
	final String type;
	final String remainder;
	
	public TableColumn(String name, String type, String remainder) {
		this.name = name;
		this.type = type;
		this.remainder = remainder;
	}

}
