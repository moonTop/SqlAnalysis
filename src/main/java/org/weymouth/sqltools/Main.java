package org.weymouth.sqltools;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
	
	public static void main(String[] args) {
		try {
			(new Main()).exec();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void exec() throws IOException {
		HeaderReader reader = new HeaderReader("src/main/resources/transmart-schema.sql");
		List<Header> headers = reader.readAllHeaders();
		Set<HeaderType> types = new HashSet<HeaderType>();
		for (Header h: headers) {
			types.add(h.type);
			if (h.type == null) {
				System.out.println("Null Type: " + h.text);
			}
			if (h.type == HeaderType.UNDEFINED) {
				System.out.println("Undefinedd Type: " + h.text);
			}
		}
		for (HeaderType type: types){
			System.out.println(type);
		}
	}

}
