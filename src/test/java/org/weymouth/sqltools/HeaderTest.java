package org.weymouth.sqltools;

import org.junit.Assert;
import org.junit.Test;

public class HeaderTest {

	static final String HEADER_LINE1 = "-- Name: i2b2demodata; Type: SCHEMA; Schema: -; Owner: weymouth";

	@Test
	public void test() {
		Header header = new Header(HEADER_LINE1);
		System.out.println(header);
		Assert.assertNotNull(header.name);
		Assert.assertNotNull(header.type);
		Assert.assertNull(header.schema);
		Assert.assertNotNull(header.owner);
		Assert.assertEquals(HeaderType.SCHEMA, header.type);
		Assert.assertEquals("i2b2demodata",header.name);
		Assert.assertEquals("weymouth",header.owner);
	}

}
