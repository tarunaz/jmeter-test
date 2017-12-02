package com.tke.servicesight.rules.model;

import java.io.Serializable;

/**
 * The bronze program class that will host all of the elements that defines the
 * bronze program.
 * 
 * @author Sunil Samuel (sunil@redhat.com)
 *
 */
public class Bronze implements Serializable {
	private static final long serialVersionUID = 8023024651770450369L;

	private String id;

	private String coverageType;
	private Boolean frequency;
	private Boolean duration;
	private Integer frequencyValue;
	private Double durationValue;
	private Boolean bronze = false;

	public Bronze() {
		super();
	}

	/**
	 * @param id
	 */
	public Bronze(String id) {
		super();
		this.id = id;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the coverageType
	 */
	public String getCoverageType() {
		return coverageType;
	}

	/**
	 * @param coverageType
	 *            the coverageType to set
	 */
	public void setCoverageType(String coverageType) {
		this.coverageType = coverageType;
	}

	/**
	 * @return the frequency
	 */
	public Boolean getFrequency() {
		return frequency;
	}

	/**
	 * @param frequency
	 *            the frequency to set
	 */
	public void setFrequency(Boolean frequency) {
		this.frequency = frequency;
	}

	/**
	 * @return the duration
	 */
	public Boolean getDuration() {
		return duration;
	}

	/**
	 * @param duration
	 *            the duration to set
	 */
	public void setDuration(Boolean duration) {
		this.duration = duration;
	}

	/**
	 * @return the frequencyValue
	 */
	public Integer getFrequencyValue() {
		return frequencyValue;
	}

	/**
	 * @param frequencyValue
	 *            the frequencyValue to set
	 */
	public void setFrequencyValue(Integer frequencyValue) {
		this.frequencyValue = frequencyValue;
	}

	/**
	 * @return the durationValue
	 */
	public Double getDurationValue() {
		return durationValue;
	}

	/**
	 * @param durationValue
	 *            the durationValue to set
	 */
	public void setDurationValue(Double durationValue) {
		this.durationValue = durationValue;
	}

	/**
	 * @return the isBronze
	 */
	public Boolean getIsBronze() {
		return bronze;
	}

	/**
	 * @param isBronze
	 *            the isBronze to set
	 */
	public void setIsBronze(Boolean bronze) {
		this.bronze = bronze;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bronze == null) ? 0 : bronze.hashCode());
		result = prime * result + ((coverageType == null) ? 0 : coverageType.hashCode());
		result = prime * result + ((duration == null) ? 0 : duration.hashCode());
		result = prime * result + ((durationValue == null) ? 0 : durationValue.hashCode());
		result = prime * result + ((frequency == null) ? 0 : frequency.hashCode());
		result = prime * result + ((frequencyValue == null) ? 0 : frequencyValue.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bronze other = (Bronze) obj;
		if (bronze == null) {
			if (other.bronze != null)
				return false;
		} else if (!bronze.equals(other.bronze))
			return false;
		if (coverageType == null) {
			if (other.coverageType != null)
				return false;
		} else if (!coverageType.equals(other.coverageType))
			return false;
		if (duration == null) {
			if (other.duration != null)
				return false;
		} else if (!duration.equals(other.duration))
			return false;
		if (durationValue == null) {
			if (other.durationValue != null)
				return false;
		} else if (!durationValue.equals(other.durationValue))
			return false;
		if (frequency == null) {
			if (other.frequency != null)
				return false;
		} else if (!frequency.equals(other.frequency))
			return false;
		if (frequencyValue == null) {
			if (other.frequencyValue != null)
				return false;
		} else if (!frequencyValue.equals(other.frequencyValue))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Bronze [id=").append(id).append(", coverageType=").append(coverageType).append(", frequency=")
				.append(frequency).append(", duration=").append(duration).append(", frequencyValue=")
				.append(frequencyValue).append(", durationValue=").append(durationValue).append(", bronze=")
				.append(bronze).append("]");
		return builder.toString();
	}

}
