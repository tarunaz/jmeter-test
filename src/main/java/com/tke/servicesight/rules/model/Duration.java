package com.tke.servicesight.rules.model;

import java.io.Serializable;

/**
 * The duration object that will host the duration hours for each category.<br>
 * <br>
 * NOTE: This must implement a "reset()" method that removes all of the values
 * for everything. This way, the rule can create an 'imSla' for bronze programs.
 *
 * @author Sunil Samuel
 * @author Christian Witchger
 *
 */
public class Duration implements Serializable {

	private static final long serialVersionUID = 503560067989564315L;
	private String id;

	private Double pm;
	private Double pmd;
	private Double im;
	private Double pt;
	private Double pmMmr;
	private Double cat1;
	private Double cleanDown;
	private Double st;
	private Double imSla;
	private Double imL;
	private Double pmH;

	public Duration() {

	}

	public Duration(String id) {
		this.id = id;
	}

	public void reset() {
		pm = pmd = im = pt = pmMmr = cat1 = cleanDown = st = imSla = imL = pmH = null;
	}

	public void addImL(double imL) {
		if (this.imL == null) {
			setImL(imL);
		} else {
			this.imL += imL;
		}
	}

	public void addPmH(double pmH) {
		if (this.pmH == null) {
			setPmH(pmH);
		} else {
			this.pmH += pmH;
		}
	}

	public void addCat1(double cat1) {
		if (this.cat1 == null) {
			setCat1(cat1);
		} else {
			this.cat1 += cat1;
		}
	}

	public void addCleanDown(double cleanDown) {
		if (this.cleanDown == null) {
			setCleanDown(cleanDown);
		} else {
			this.cleanDown += cleanDown;
		}
	}

	public void addIm(double im) {
		if (this.im == null) {
			setIm(im);
		} else {
			this.im += im;
		}
	}

	public void addPm(double pm) {
		if (this.pm == null) {
			setPm(pm);
		} else {
			this.pm += pm;
		}
	}

	public void addPmd(double pmd) {
		if (this.pmd == null) {
			setPmd(pmd);
		} else {
			this.pmd += pmd;
		}
	}

	public void addPmMmr(double pmMmr) {
		if (this.pmMmr == null) {
			setPmMmr(pmMmr);
		} else {
			this.pmMmr += pmMmr;
		}
	}

	public void addPt(double pt) {
		if (this.pt == null) {
			setPt(pt);
		} else {
			this.pt += pt;
		}
	}

	public void addSt(double st) {
		if (this.st == null) {
			setSt(st);
		} else {
			this.st += st;
		}
	}

	/**
	 * @return the cat1
	 */
	public Double getCat1() {
		return this.cat1;
	}

	/**
	 * @return the cleanDown
	 */
	public Double getCleanDown() {
		return this.cleanDown;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return this.id;
	}

	/**
	 * @return the im
	 */
	public Double getIm() {
		return this.im;
	}

	/**
	 * @return the pm
	 */
	public Double getPm() {
		return this.pm;
	}

	/**
	 * @return the pmd
	 */
	public Double getPmd() {
		return this.pmd;
	}

	/**
	 * @return the pmMmr
	 */
	public Double getPmMmr() {
		return this.pmMmr;
	}

	/**
	 * @return the pt
	 */
	public Double getPt() {
		return this.pt;
	}

	/**
	 * @return the st
	 */
	public Double getSt() {
		return this.st;
	}

	/**
	 * @param cat1
	 *            the cat1 to set
	 */
	public void setCat1(Double cat1) {
		this.cat1 = cat1;
	}

	/**
	 * @param cleanDown
	 *            the cleanDown to set
	 */
	public void setCleanDown(Double cleanDown) {
		this.cleanDown = cleanDown;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @param im
	 *            the im to set
	 */
	public void setIm(Double im) {
		this.im = im;
	}

	/**
	 * @param pm
	 *            the pm to set
	 */
	public void setPm(Double pm) {
		this.pm = pm;
	}

	/**
	 * @param pmd
	 *            the pmd to set
	 */
	public void setPmd(Double pmd) {
		this.pmd = pmd;
	}

	/**
	 * @param pmMmr
	 *            the pmMmr to set
	 */
	public void setPmMmr(Double pmMmr) {
		this.pmMmr = pmMmr;
	}

	/**
	 * @param pt
	 *            the pt to set
	 */
	public void setPt(Double pt) {
		this.pt = pt;
	}

	/**
	 * @param st
	 *            the st to set
	 */
	public void setSt(Double st) {
		this.st = st;
	}

	/**
	 * @return the imSla
	 */
	public Double getImSla() {
		return imSla;
	}

	/**
	 * @param imSla
	 *            the imSla to set
	 */
	public void setImSla(Double imSla) {
		this.imSla = imSla;
	}

	/**
	 * @return the imL
	 */
	public Double getImL() {
		return imL;
	}

	/**
	 * @param imL
	 *            the imL to set
	 */
	public void setImL(Double imL) {
		this.imL = imL;
	}

	/**
	 * @return the pmH
	 */
	public Double getPmH() {
		return pmH;
	}

	/**
	 * @param pmH
	 *            the pmH to set
	 */
	public void setPmH(Double pmH) {
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
		Duration other = (Duration) obj;
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
		builder.append("Duration [id=").append(id).append(", pm=").append(pm).append(", pmd=").append(pmd)
				.append(", im=").append(im).append(", pt=").append(pt).append(", pmMmr=").append(pmMmr)
				.append(", cat1=").append(cat1).append(", cleanDown=").append(cleanDown).append(", st=").append(st)
				.append(", imSla=").append(imSla).append(", imL=").append(imL).append(", pmH=").append(pmH).append("]");
		return builder.toString();
	}

}
