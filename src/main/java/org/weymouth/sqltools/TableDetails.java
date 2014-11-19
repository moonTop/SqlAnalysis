package org.weymouth.sqltools;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class TableDetails {
	
	final String name;
	private Map<String,TableColumn> columnMap = new HashMap<String,TableColumn>();

	public TableDetails(String name) {
		this.name = name;
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
