package org.weymouth.sqltools;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class TableDetails {
	
	private final String name;
	private String schema;
	private Map<String,TableColumn> columnMap = new HashMap<String,TableColumn>();

	public TableDetails(String name) {
		this.name = name;
	}
	
	public String getSchema() {
		return schema;
	}

	public void setSchema(String schema) {
		this.schema = schema;
	}

	public String getName() {
		return name;
	}

	public void addColumn(TableColumn column) {
		columnMap.put(column.name, column);
	}

	public Set<String> getColumnNames() {
		return columnMap.keySet();
	}

	public TableColumn getColumn(String name) {
		return columnMap.get(name);
	}
	
	public String toString() {
		String list = null;
		for (String s: columnMap.keySet()) {
			if (list == null) list = s;
			else list += ',' + s;
		}
		return "Table(" + name + "): [" + list + "]";
	}
}
