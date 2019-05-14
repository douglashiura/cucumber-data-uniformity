package br.ufsc.leb;

import java.util.ArrayList;
import java.util.List;

public class Feature {

	private List<String> testData;

	public Feature(String name) {
		testData = new ArrayList<String>();
	}

	public void addData(String data) {
		testData.add(data);
	}
}
