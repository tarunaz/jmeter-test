package com.tke.servicesight.rules.model;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * The maintenance object that will host the maintenance hours for each
 * category.<br>
 * <br>
 * NOTE: This must implement a "reset()" method that removes all of the values
 * for everything. This way, the rule can create an 'imSla' for bronze programs.
 *
 * @author Sunil Samuel
 * @author Christian Witchger
 *
 */
public class Maintenance implements Serializable {

	private static final long serialVersionUID = -3325678014366276203L;
	private String id;

	private Integer pm;
	private Integer pmd;
	private Integer im;
	private Integer pt;
	private Integer pmMmr;
	private Integer cat1;
	private Integer cleanDown;
	private Integer st;
	private Integer imSla;
	private Integer imL;
	private Integer pmH;

	/**
	 * The following method returns a sum of all of the visit types. This is
	 * used to assure that non-bronze with frequency set to true satisfies the
	 * total number to frequencyVisits.
	 */
	@JsonIgnore
	public Integer getTotal() {
		return (pm == null ? 0 : pm) + (pmd == null ? 0 : pmd) + (im == null ? 0 : im) + (pt == null ? 0 : pt)
				+ (pmMmr == null ? 0 : pmMmr) + (cat1 == null ? 0 : cat1) + (cleanDown == null ? 0 : cleanDown)
				+ (st == null ? 0 : st) + (imSla == null ? 0 : imSla) + (imL == null ? 0 : imL)
				+ (pmH == null ? 0 : pmH);
	}

	public Maintenance() {

	}

	public Maintenance(String id) {
		this.id = id;
	}

	public void reset() {
		pm = pmd = im = pt = pmMmr = cat1 = cleanDown = st = imSla = imL = pmH = null;
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
	 * @return the pm
	 */
	public Integer getPm() {
		return pm;
	}

	/**
	 * @param pm
	 *            the pm to set
	 */
	public void setPm(Integer pm) {
		this.pm = pm;
	}

	/**
	 * @return the pmd
	 */
	public Integer getPmd() {
		return pmd;
	}

	/**
	 * @param pmd
	 *            the pmd to set
	 */
	public void setPmd(Integer pmd) {
		this.pmd = pmd;
	}

	/**
	 * @return the im
	 */
	public Integer getIm() {
		return im;
	}

	/**
	 * @param im
	 *            the im to set
	 */
	public void setIm(Integer im) {
		this.im = im;
	}

	/**
	 * @return the pt
	 */
	public Integer getPt() {
		return pt;
	}

	/**
	 * @param pt
	 *            the pt to set
	 */
	public void setPt(Integer pt) {
		this.pt = pt;
	}

	/**
	 * @return the pmMmr
	 */
	public Integer getPmMmr() {
		return pmMmr;
	}

	/**
	 * @param pmMmr
	 *            the pmMmr to set
	 */
	public void setPmMmr(Integer pmMmr) {
		this.pmMmr = pmMmr;
	}

	/**
	 * @return the cat1
	 */
	public Integer getCat1() {
		return cat1;
	}

	/**
	 * @param cat1
	 *            the cat1 to set
	 */
	public void setCat1(Integer cat1) {
		this.cat1 = cat1;
	}

	/**
	 * @return the cleanDown
	 */
	public Integer getCleanDown() {
		return cleanDown;
	}

	/**
	 * @param cleanDown
	 *            the cleanDown to set
	 */
	public void setCleanDown(Integer cleanDown) {
		this.cleanDown = cleanDown;
	}

	/**
	 * @return the st
	 */
	public Integer getSt() {
		return st;
	}

	/**
	 * @param st
	 *            the st to set
	 */
	public void setSt(Integer st) {
		this.st = st;
	}

	/**
	 * @return the imSla
	 */
	public Integer getImSla() {
		return imSla;
	}

	/**
	 * @param imSla
	 *            the imSla to set
	 */
	public void setImSla(Integer imSla) {
		this.imSla = imSla;
	}

	/**
	 * @return the imL
	 */
	public Integer getImL() {
		return imL;
	}

	/**
	 * @param imL
	 *            the imL to set
	 */
	public void setImL(Integer imL) {
		this.imL = imL;
	}

	/**
	 * @return the pmH
	 */
	public Integer getPmH() {
		return pmH;
	}

	/**
	 * @param pmH
	 *            the pmH to set
	 */
	public void setPmH(Integer pmH) {
		this.pmH = pmH;
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
		result = prime * result + ((cat1 == null) ? 0 : cat1.hashCode());
		result = prime * result + ((cleanDown == null) ? 0 : cleanDown.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((im == null) ? 0 : im.hashCode());
		result = prime * result + ((imL == null) ? 0 : imL.hashCode());
		result = prime * result + ((imSla == null) ? 0 : imSla.hashCode());
		result = prime * result + ((pm == null) ? 0 : pm.hashCode());
		result = prime * result + ((pmH == null) ? 0 : pmH.hashCode());
		result = prime * result + ((pmMmr == null) ? 0 : pmMmr.hashCode());
		result = prime * result + ((pmd == null) ? 0 : pmd.hashCode());
		result = prime * result + ((pt == null) ? 0 : pt.hashCode());
		result = prime * result + ((st == null) ? 0 : st.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Maintenance other = (Maintenance) obj;
		if (cat1 == null) {
			if (other.cat1 != null)
				return false;
		} else if (!cat1.equals(other.cat1))
			return false;
		if (cleanDown == null) {
			if (other.cleanDown != null)
				return false;
		} else if (!cleanDown.equals(other.cleanDown))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (im == null) {
			if (other.im != null)
				return false;
		} else if (!im.equals(other.im))
			return false;
		if (imL == null) {
			if (other.imL != null)
				return false;
		} else if (!imL.equals(other.imL))
			return false;
		if (imSla == null) {
			if (other.imSla != null)
				return false;
		} else if (!imSla.equals(other.imSla))
			return false;
		if (pm == null) {
			if (other.pm != null)
				return false;
		} else if (!pm.equals(other.pm))
			return false;
		if (pmH == null) {
			if (other.pmH != null)
				return false;
		} else if (!pmH.equals(other.pmH))
			return false;
		if (pmMmr == null) {
			if (other.pmMmr != null)
				return false;
		} else if (!pmMmr.equals(other.pmMmr))
			return false;
		if (pmd == null) {
			if (other.pmd != null)
				return false;
		} else if (!pmd.equals(other.pmd))
			return false;
		if (pt == null) {
			if (other.pt != null)
				return false;
		} else if (!pt.equals(other.pt))
			return false;
		if (st == null) {
			if (other.st != null)
				return false;
		} else if (!st.equals(other.st))
			return false;
		return true;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Maintenance [id=").append(id).append(", pm=").append(pm).append(", pmd=").append(pmd)
				.append(", im=").append(im).append(", pt=").append(pt).append(", pmMmr=").append(pmMmr)
				.append(", cat1=").append(cat1).append(", cleanDown=").append(cleanDown).append(", st=").append(st)
				.append(", imSla=").append(imSla).append(", imL=").append(imL).append(", pmH=").append(pmH).append("]");
		return builder.toString();
	}

}
