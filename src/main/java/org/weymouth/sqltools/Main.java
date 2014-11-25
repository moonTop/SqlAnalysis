package org.weymouth.sqltools;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Main {

	private static final DatabaseType DATABASE_TYPE = DatabaseType.POSTGRESQL;
	private static final String DATABASE_NAME_TRANSMART = "transmart";
	private static final String DATABASE_NAME_I2B2 = "i2b2";
	private static final String FILE_FOR_TRANSMART_POSTGRES = "src/main/resources/postgres-transmart-schema.sql";
	private static final String FILE_FOR_I2B2_POSTGRES = "src/main/resources/postgres-i2b2-schema.sql";
	private static final String FILE_FOR_TRANSMART_ORACLE = "src/main/resources/oracle_tm_schema.sql";
	private static final String FILE_FOR_I2B2_ORACLE = "src/main/resources/oracle_i2b2_pm_meta_demo.sql";

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
				if (tableStructureCongruent(h)) {
					System.out.println("  " + h.getSchemaWithName() + " are identical");
				} else {
					System.out.println("  " + h.getSchemaWithName() + " differ");
					reportTableDifferances(h);
				}
			}
		}		
	}

	private void reportTableDifferances(Header h) {
		TableDetails tableFromTransmart = transmart.lookUpTableDetails(h);
		TableDetails tableFromI2b2 = i2b2.lookUpTableDetails(h);
		if (tableFromTransmart == null) {
			System.out.println("    The table details in transmart reported null - probably an error");
			return;
		}
		if (tableFromI2b2 == null) {
			System.out.println("    The table details in i2b2 reported null - probably an error");
			return;
		}
//		System.out.println("    transmart: " + tableFromTransmart);
//		System.out.println("    i2b2:      " + tableFromI2b2);		
		Set<String> columnNamesInTransmart = tableFromTransmart.getColumnNames();
		Set<String> columnNamesInI2b2 = tableFromI2b2.getColumnNames();
		Set<String> combinedNames = new HashSet<String>();
		combinedNames.addAll(columnNamesInTransmart);
		combinedNames.addAll(columnNamesInI2b2);
		for (String name: combinedNames) {
			TableColumn ct = tableFromTransmart.getColumn(name);
			TableColumn ci = tableFromI2b2.getColumn(name);
//			System.out.println("      in transmart: " + ct);
//			System.out.println("      in i2b2:      " + ci);
			if (ct == null) System.out.println("      there is no column in the transmart table: " + name); 
			else if (ci == null) System.out.println("      there is no column in the i2b2 table: " + name);
			else if (!ct.type.equals(ci.type)) {
				System.out.println("      the columns differ in type for: " +  name);
				System.out.println("        in transmart " + ct.type);
				System.out.println("        in i2b2      " + ci.type);
			}
			else {
//				System.out.println("      there is no differance in column names and types");
			}
					
		}
	}

	private boolean tableStructureCongruent(Header h) {
		TableDetails tableFromTransmart = transmart.lookUpTableDetails(h);
		TableDetails tableFromI2b2 = i2b2.lookUpTableDetails(h);
		if ((tableFromTransmart == null) && (tableFromI2b2 == null)) return true;
		if (tableFromTransmart == null) return false;
		if (tableFromI2b2 == null) return false;
		Set<String> columnNamesInTransmart = tableFromTransmart.getColumnNames();
		Set<String> columnNamesInI2b2 = tableFromI2b2.getColumnNames();
		for (String n: columnNamesInTransmart) {
			if (!columnNamesInI2b2.contains(n)) return false;
			String type1 = tableFromTransmart.getColumn(n).type;
			String type2 = tableFromI2b2.getColumn(n).type;
			if (!type1.equals(type2)) return false;
		}
		for (String n: columnNamesInI2b2) {
			if (!columnNamesInTransmart.contains(n)) return false;
		}
		return true;
	}

	private Database buildTransmart() throws IOException {
		switch (DATABASE_TYPE) {
			case POSTGRESQL:
				return buildFromDump(DATABASE_NAME_TRANSMART, new SchemaDumpfileReaderPostgres(FILE_FOR_TRANSMART_POSTGRES));
			case ORACLE:
				return buildFromDump(DATABASE_NAME_TRANSMART, new SchemaDumpfileReaderOracle(FILE_FOR_TRANSMART_ORACLE));
		}
		return null;
	}
	
	private Database buildI2b2() throws IOException {
		switch (DATABASE_TYPE) {
			case POSTGRESQL:
				return buildFromDump(DATABASE_NAME_I2B2, new SchemaDumpfileReaderPostgres(FILE_FOR_I2B2_POSTGRES));
			case ORACLE:
				return buildFromDump(DATABASE_NAME_I2B2, new SchemaDumpfileReaderOracle(FILE_FOR_I2B2_ORACLE));
		}
		return null;
	}

	private Database buildFromDump(String name,SchemaDumpfileReader reader) throws IOException {
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
