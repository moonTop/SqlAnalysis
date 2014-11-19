package org.weymouth.sqltools;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Database {
	
	private final String name;
	private final Map<String, Map<HeaderType,Map<String,Header>>> headersBySchemaAndType = new HashMap<String, Map<HeaderType,Map<String,Header>>>();
	private final Map<String, TableDetails> tableMap;
	
	public Database(String name, List<Header> headers, Map<String, TableDetails> tableMap) {
		this.name = name;
		this.tableMap = tableMap;
		for (Header h: headers) {
			addHeader(h);
		}
	}

	public String getName() {
		return name;
	}
	
	public Set<String> schemaSet() {
		return headersBySchemaAndType.keySet();
	}
	
	public Map<String,Header> getHeaderMapBySchemaAndType(String schema, HeaderType type) {
		Map<HeaderType,Map<String,Header>> headersByType = headersBySchemaAndType.get(schema);
		if (headersByType == null) return null;
		Map<String,Header> nameMap = headersByType.get(type);
		return nameMap;
	}
	
	public TableDetails lookUpTableDetails(Header h) {
		return tableMap.get(h.getSchemaWithName());
	}

	private void addHeader(Header h) {
		// for the time being, we only care able tables and functions
		if (!tableOrFunction(h)) return;
		String schema = h.schema;
		HeaderType type = h.type;
		Map<HeaderType,Map<String,Header>> headersByType = headersBySchemaAndType.get(schema);
		if (headersByType == null) {
			headersByType = new HashMap<HeaderType,Map<String,Header>>();
			headersBySchemaAndType.put(schema,headersByType);
		}
		Map<String,Header> nameMap = headersByType.get(type) ;
		if (nameMap == null) {
			nameMap = new HashMap<String,Header>();
			headersByType.put(type, nameMap);
		}
		Header probe = nameMap.get(h.name);
		if (probe != null){
			System.out.println("Name collission: " + probe + " collides with " + h);
		} else {
			nameMap.put(h.name,h);
		}
	}
	
	private boolean tableOrFunction(Header h) {
		if (h.type.equals(HeaderType.TABLE)) return true;
		if (h.type.equals(HeaderType.FUNCTION)) return true;
		return false;
	}
	
}
