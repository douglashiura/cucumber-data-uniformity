package br.ufsc.leb;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexTestPatternMatcher {
	public static final String EXAMPLE_TEST = "This is my small `examp2+-/le` <ag2ua> string which I'<{mm44%ala>' or \"Mala\" going to use for pattern matching.";

	public static void main(String[] args) {
		Pattern pattern = Pattern.compile("('<?\\{?\\w+>?\\>?\\}?')|(\"<?\\{?\\w+>?\\>?\\}?\")|(`<?\\{?\\w+>?\\>?\\}?`)|(<\\w+>)");
		// in case you would like to ignore case sensitivity,
		// you could use this statement:
		// Pattern pattern = Pattern.compile("\\s+", Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(EXAMPLE_TEST);
		// check all occurance
		while (matcher.find()) {
			System.out.print("Start index: " + matcher.start());
			System.out.print(" End index: " + matcher.end() + " ");
			System.out.println(matcher.group());
		}
		// now create a new pattern and matcher to replace whitespace with tabs
		Pattern replace = Pattern.compile("\\s+");
		Matcher matcher2 = replace.matcher(EXAMPLE_TEST);
		System.out.println(matcher2.replaceAll("\t"));
	}
}