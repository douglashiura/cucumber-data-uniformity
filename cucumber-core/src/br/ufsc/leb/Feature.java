package br.ufsc.leb;

import java.util.ArrayList;
import java.util.List;

public class Feature {

	private List<String> testData;
	private String uri;

	public Feature(String uri) {
		this.uri = uri;
		testData = new ArrayList<String>();
	}

	public void addData(String data) {
		testData.add(data);
	}

	public String getUri() {
		return uri;
	}
	
	public List<String> getTestData() {
		return testData;
	}
}
