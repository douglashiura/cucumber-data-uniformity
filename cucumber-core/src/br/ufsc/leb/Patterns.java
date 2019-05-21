package br.ufsc.leb;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Patterns {

	private static final Pattern ARGUMENTS = Pattern
			.compile("('<?\\{?(\\w|\\W)+>?\\>?\\}?')|(\"<?\\{?(\\w|\\W)+>?\\>?\\}?\")|(`<?\\{?(\\w|\\W)+>?\\>?\\}?`)|(<\\w+>)");

	public static List<String> getArguments(String step) {
		List<String> arguments = new ArrayList<String>();
		Matcher matcher = ARGUMENTS.matcher(step);
		while (matcher.find()) {
			arguments.add(matcher.group());
		}
		return arguments;
	}

}
