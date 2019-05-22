package br.ufsc.leb;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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

	public void out() throws IOException {
		FileOutputStream file = new FileOutputStream("uniformity.txt");
		file.write(("Feature (a)	(b)	RelativeUniformity 	Uniforme	Non-uniforme\n").getBytes());
		for (Pair pair : getUniformity()) {
			file.write((pair.a.getUri() + "	" + pair.b.getUri() + "	" + pair.uniformidade + "	"
					+ pair.uniformidadeQuantitativa + "	"
					+ (pair.a.getTestData().size() - pair.uniformidadeQuantitativa) + "\n").getBytes());
		}
		file.write(("\nFeature	elements\n").getBytes());
		features.forEach(feature -> {
			try {
				file.write((feature.getUri() + "	" + feature.getTestData().size() + "\n").getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		file.close();
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
