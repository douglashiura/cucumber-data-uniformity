package br.ufsc.leb;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

public class StepTest {
	public static final String EXAMPLE_TEST = "This is my small `ex33~ dsample` <agua> string which I'<{mss ssmala>' "
			+ "or \"Mala\" going to use for pattern matching.";

	@Test
	public void test() {
		List<String> arguments = Patterns.getArguments(EXAMPLE_TEST);
		assertEquals(4, arguments.size());
		assertEquals("`ex33~ dsample`", arguments.get(0));
		assertEquals("<agua>", arguments.get(1));
		assertEquals("'<{mss ssmala>'", arguments.get(2));
		assertEquals("\"Mala\"", arguments.get(3));
	}

}
