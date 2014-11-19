package org.weymouth.sqltools;

public enum HeaderType {
	
	FUNCTION("FUNCTION"),INDEX("INDEX"),SEQUENCE_OWNED_BY("SEQUENCE OWNED BY"),
	SEQUENCE("SEQUENCE"),TABLE("TABLE"),SCHEMA("SCHEMA"), COMMENT("COMMENT"),
	AGGREGATE("AGGREGATE"), VIEW("VIEW"), TRIGGER("TRIGGER"),
	CONSTRAINT("CONSTRAINT"), ACL("ACL"), DEFAULT_ACL("DEFAULT ACL"),EXTENSION("EXTENSION"), 
	FK_CONSTRAINT("FK CONSTRAINT"), DEFAULT("DEFAULT"),UNDEFINED("UNDEFINED");

	private final String printString;
	
	private HeaderType(String printString){
		this.printString = printString;
	}
	
	public static HeaderType headerTypeFromString(String probe) {
		if (probe == null) return null;
		for (HeaderType type: HeaderType.values()) {
			if (probe.equals(type.printString)) return type;
		}
		return HeaderType.UNDEFINED;
	}
	
	public String toString(){
		return printString;
	}
}
