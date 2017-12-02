package com.tke.servicesight.rules.model;

import java.io.Serializable;

/**
 * The response object that will host the calculated score, serviceLevel,
 * elevator type and the id associated with the request.
 *
 * @author Justin Goldsmith
 * @author Christian Witchger
 * @auther Sunil Samuel
 *
 */
public class Score implements Serializable {

	private static final long serialVersionUID = 7343929783190182133L;
	private Integer score=0;
	private Integer serviceLevel;
	private Integer openings;
	private String id;

	public Score() {

	}

	public Score(String id) {
		this.id = id;
		this.score = new Integer(0);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Score other = (Score) obj;
		if (this.id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!this.id.equals(other.id)) {
			return false;
		}
		if (this.openings == null) {
			if (other.openings != null) {
				return false;
			}
		} else if (!this.openings.equals(other.openings)) {
			return false;
		}
		if (this.score == null) {
			if (other.score != null) {
				return false;
			}
		} else if (!this.score.equals(other.score)) {
			return false;
		}
		if (this.serviceLevel == null) {
			if (other.serviceLevel != null) {
				return false;
			}
		} else if (!this.serviceLevel.equals(other.serviceLevel)) {
			return false;
		}
		return true;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return this.id;
	}

	/**
	 * @return the openings
	 */
	public Integer getOpenings() {
		return this.openings;
	}

	/**
	 * @return the score
	 */
	public Integer getScore() {
		return this.score;
	}

	/**
	 * @return the serviceLevel
	 */
	public Integer getServiceLevel() {
		return this.serviceLevel;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (this.id == null ? 0 : this.id.hashCode());
		result = prime * result + (this.openings == null ? 0 : this.openings.hashCode());
		result = prime * result + (this.score == null ? 0 : this.score.hashCode());
		result = prime * result + (this.serviceLevel == null ? 0 : this.serviceLevel.hashCode());
		return result;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @param openings the openings to set
	 */
	public void setOpenings(Integer openings) {
		this.openings = openings;
	}

	/**
	 * @param score the score to set
	 */
	public void setScore(Integer score) {
		this.score = score;
	}

	/**
	 * @param serviceLevel the serviceLevel to set
	 */
	public void setServiceLevel(Integer serviceLevel) {
		this.serviceLevel = serviceLevel;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Score [score=").append(this.score).append(", serviceLevel=").append(this.serviceLevel)
				.append(", openings=").append(this.openings).append(", id=").append(this.id).append("]");
		return builder.toString();
	}

}