package org.weymouth.sqltools;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Main {
	
	private Database transmart;
	private Database i2b2;
	
	public static void main(String[] args) {
		try {
			(new Main()).exec();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void exec() throws IOException {
		transmart = buildTransmart();
		i2b2 = buildI2b2();
		printReport();
	}
	
	private void printReport() {
		Set<String> commonSchemas = intersectionOfSchemaSets();
		System.out.println("Common functions: ");
		for (String schema: commonSchemas){
			Set<Header> commonTables = intersectionHeadersByName(schema,HeaderType.FUNCTION); 
			for (Header h: commonTables) {
				System.out.println("  " + h.getSchemaWithName());
			}
		}
		System.out.println("Common Tables: ");
		for (String schema: commonSchemas){
			Set<Header> commonTables = intersectionHeadersByName(schema,HeaderType.TABLE); 
			for (Header h: commonTables) {
				System.out.println("  " + h.getSchemaWithName());
				if (!tableStructureCongruent(h)) {
					reportTableDifferances(h);
				}
			}
		}		
	}

	private void reportTableDifferances(Header h) {
		reprotTableDetails(transmart.lookUpTableDetails(h));
		reprotTableDetails(i2b2.lookUpTableDetails(h));
	}

	private void reprotTableDetails(TableDetails details) {
		System.out.println("Table Detais: " + details.name);
		for (String columnName: details.getColumnNames()){
			TableColumn column = details.getColumn(columnName);
			System.out.println("  " + column.name + ": " + column.type + "(" + column.remainder + ")");
		}
	}

	private boolean tableStructureCongruent(Header h) {
		TableDetails tableFromTransmart = transmart.lookUpTableDetails(h);
		TableDetails tableFromI2b2 = i2b2.lookUpTableDetails(h);
		System.out.println(tableFromTransmart);
		System.out.println(tableFromI2b2);
		if ((tableFromTransmart == null) && (tableFromI2b2 == null)) return true;
		if (tableFromTransmart == null) return false;
		if (tableFromI2b2 == null) return false;
		return false;
	}

	private Database buildTransmart() throws IOException {
		return buildFromDump("transmart", "src/main/resources/transmart-schema.sql");
	}
	
	private Database buildI2b2() throws IOException {
		return buildFromDump("i2b2", "src/main/resources/i2b2-schema.sql");
	}

	private Database buildFromDump(String name, String path) throws IOException {
		SchemaDumpfileReader reader = new SchemaDumpfileReader(path);
		Database db = reader.buildDatabaseDescription(name);
		return db;
	}

	private Set<String> intersectionOfSchemaSets() {
		Set<String> transmartSchemeSet = transmart.schemaSet();
		Set<String> i2b2SchemaSet = i2b2.schemaSet();
		HashSet<String> iSet = new HashSet<String>();
		for (String s: transmartSchemeSet) {
			if ((s != null) && (i2b2SchemaSet.contains(s))) iSet.add(s);
		}
		return iSet;
	}

	private Set<Header> intersectionHeadersByName(String schema, HeaderType type) {
		HashSet<Header> iSet = new HashSet<Header>();
		Map<String,Header> fromTransmart = transmart.getHeaderMapBySchemaAndType(schema,type);
		if (fromTransmart == null) return iSet;
		Map<String,Header> fromI2b2 = i2b2.getHeaderMapBySchemaAndType(schema,type);
		if (fromI2b2 == null) return iSet;
		for (String key: fromTransmart.keySet()) {
			if (fromI2b2.keySet().contains(key)) {
				iSet.add(fromTransmart.get(key));
			}
		}
		return iSet;
	}

}
