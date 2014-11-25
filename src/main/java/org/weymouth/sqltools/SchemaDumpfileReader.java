package org.weymouth.sqltools;

import java.io.IOException;

public interface SchemaDumpfileReader {

	public Database buildDatabaseDescription(String name) throws IOException;
	
}
