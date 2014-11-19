package org.weymouth.sqltools;

public class TableColumn {

	final String name;
	final String type;
	final String remainder;
	
	public TableColumn(String name, String type, String remainder) {
		this.name = name.trim();
		this.type = type.trim();
		this.remainder = remainder.trim();
	}

	public String toString() {
		return name + ": " + type + " (" + remainder + ")"; 
	}
}
