package br.ufsc.leb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DataUniformity {

	private static DataUniformity INSTANCE;
	private List<Feature> features;
	private Feature current;

	public static DataUniformity get() {
		if (INSTANCE == null) {
			INSTANCE = new DataUniformity();
		}
		return INSTANCE;
	}

	private DataUniformity() {
		features = new ArrayList<Feature>();
	}

	public void putFeatureOnStream(String uri) {
		if (current == null || !current.getUri().equals(uri)) {
			newFeature(new Feature(uri));
		}
	}

	private void newFeature(Feature feature) {
		features.add(feature);
		current = feature;
	}

	public void addDataOnStream(String data) {
		current.addData(data);
	}

	public List<Pair> getUniformity() {
		List<Pair> pairs = new ArrayList<Pair>();
		for (int i = 0; i < features.size(); i++) {
			for (int j = 0; j < features.size(); j++) {
				if (j != i) {
					pairs.add(new Pair(features.get(i), features.get(j)));
				}
			}
		}
		return pairs;
	}

	public void out() {
		System.out.println("Feature (a)	(b)	RelativeUniformity 	Uniforme	Non-uniforme");
		for (Pair pair : getUniformity()) {
			System.out.println(pair.a.getUri() + "	" + pair.b.getUri() + "	" + pair.uniformidade + "	"
					+ pair.uniformidadeQuantitativa + "	"
					+ (pair.a.getTestData().size() - pair.uniformidadeQuantitativa));
		}
		System.out.println("\nFeature	elements");
		features.forEach(feature -> {
			System.out.println(feature.getUri() + "	" + feature.getTestData().size());
		});

	}

	class Pair {
		private int uniformidadeQuantitativa;
		private float uniformidade;
		private Feature a;
		private Feature b;

		public Pair(Feature a, Feature b) {
			this.a = a;
			this.b = b;
			uniformidadeQuantitativa = (int) a.getTestData().stream().filter(data -> contem(b, data)).count();
			if (a.getTestData().size() > 0) {
				uniformidade = (float) uniformidadeQuantitativa / a.getTestData().size();
			} else {
				uniformidade = 1;
			}
		}

		private boolean contem(Feature b, String data) {
			for (String aData : b.getTestData()) {
				if (aData.contentEquals(data)) {
					return true;
				}
			}
			return false;
		}
	}
}
