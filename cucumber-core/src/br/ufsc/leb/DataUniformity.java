package br.ufsc.leb;

import java.util.ArrayList;
import java.util.List;

public class DataUniformity {

	private List<Feature> features;
	private Feature current;

	public DataUniformity() {
		features = new ArrayList<Feature>();
	}

	public void newFeature(Feature feature) {
		features.add(feature);
		current = feature;
	}

	public void addDataOnStream(String data) {
		current.addData(data);
	}

}
