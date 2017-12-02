package com.cucumbertojmeter.model;

public class JsonDataObject {
	public String key;

	public String value;

	public JsonDataObject(String key, String value) {
		super();
		this.key = key;
		this.value = value;
	}

	public String getKey() {
		return this.key;
	}

	public String getValue() {
		return this.value;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (this.key == null ? 0 : this.key.hashCode());
		return result;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "JsonDataObject [key=" + this.key + ", value=" + this.value + "]";
	}

}
