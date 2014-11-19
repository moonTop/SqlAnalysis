package org.weymouth.sqltools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class HeaderReader {
	
	private static final String HEADER_PREFIX = "-- Name: ";
	private final String filename;
	private File in = null;
	private BufferedReader reader = null;

	public HeaderReader(String filename) {
		this.filename = filename;
	}

	public List<Header> readAllHeaders() throws IOException {
		openReader();
		List<Header> output = new ArrayList<Header>();
		Header header = null;
		while ((header = scanToNextHeader()) != null){
			output.add(header);
		}
		closeReader();
		return output;
	}
	
	private void closeReader() throws IOException {
		in = null;
		BufferedReader r = reader;
		reader = null;
		r.close();
	}

	private Header scanToNextHeader() throws IOException {
		if (!isOpen()) throw new IOException("File not open for input: " + filename);
		String line = null;
		while ((line = readLineFromInput()) != null) {
			if (firstLineOfHeader(line)) {
				return readHeaderFromInput(line);
			}
		}
		return null;
	}

	private Header readHeaderFromInput(String line) {
		Header ret = new Header(line);
		return ret;
	}

	private boolean firstLineOfHeader(String line) {
		return line.startsWith(HEADER_PREFIX);
	}

	private String readLineFromInput() throws IOException {
		return reader.readLine();
	}

	private boolean isOpen() {
		if (in == null) return false;
		if (reader == null) return false;
		return true;
	}

	private void openReader() throws FileNotFoundException {
		in = new File(filename);
		reader = new BufferedReader(new FileReader(in));
	}	
}
