package com.tke.servicesight.rules.model;

import java.io.Serializable;

/**
 * The product object hosts the data points for the different types of products
 * such as elevators, lifts, moving walks, and others.
 *
 * @author Sunil Samuel
 * @author Christian Witchger
 *
 */
public class Product implements Serializable {
	private static final long serialVersionUID = -1890450875002330043L;
	private String id;
	private Integer annualCallbacks;
	private String controlType;
	private String usage;
	private String environment;
	private String unitType;
	private String driveType;
	private String productType;
	private String location;
	private boolean foreignEquipment;
	private boolean bipartingPowerDoor;
	private boolean freightDoor;
	private Integer numRearCarDoors;
	private Integer numFrontCarDoors;
	private Boolean cmUnit;

	/********************************************************************
	 * This is a special getter that will sum the rear and front doors are
	 * return the total.
	 * 
	 * @return Sum of numRearCarDoors and numFrontCarDoors
	 */
	public Integer getTotalCarDoors() {
		if (numRearCarDoors == null && numFrontCarDoors == null) {
			return null;
		}
		int total = (numRearCarDoors == null ? 0 : numRearCarDoors) + (numFrontCarDoors == null ? 0 : numFrontCarDoors);
		return total;
	}

	/**
	 * @return the cmUnit
	 */
	public Boolean getCmUnit() {
		return cmUnit;
	}

	/**
	 * @param cmUnit
	 *            the cmUnit to set
	 */
	public void setCmUnit(Boolean cmUnit) {
		this.cmUnit = cmUnit;
	}

	/**
	 * @return the annualCallbacks
	 */
	public Integer getAnnualCallbacks() {
		return this.annualCallbacks;
	}

	/**
	 * @return the controlType
	 */
	public String getControlType() {
		return this.controlType;
	}

	/**
	 * @return the driveType
	 */
	public String getDriveType() {
		return this.driveType;
	}

	/**
	 * @return the environment
	 */
	public String getEnvironment() {
		return this.environment;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return this.id;
	}

	/**
	 * @return the location
	 */
	public String getLocation() {
		return this.location;
	}

	/**
	 * @return the productType
	 */
	public String getProductType() {
		return this.productType;
	}

	/**
	 * @return the unitType
	 */
	public String getUnitType() {
		return this.unitType;
	}

	/**
	 * @return the usage
	 */
	public String getUsage() {
		return this.usage;
	}

	/**
	 * @return the bipartingPowerDoor
	 */
	public boolean isBipartingPowerDoor() {
		return this.bipartingPowerDoor;
	}

	/**
	 * @return the foreignEquipment
	 */
	public boolean isForeignEquipment() {
		return this.foreignEquipment;
	}

	/**
	 * @return the freightDoor
	 */
	public boolean isFreightDoor() {
		return this.freightDoor;
	}

	public Integer getNumRearCarDoors() {
		return numRearCarDoors;
	}

	public void setNumRearCarDoors(Integer numRearCarDoors) {
		this.numRearCarDoors = numRearCarDoors;
	}

	/**
	 * @param annualCallbacks
	 *            the annualCallbacks to set
	 */
	public void setAnnualCallbacks(Integer annualCallbacks) {
		this.annualCallbacks = annualCallbacks;
	}

	/**
	 * @param bipartingPowerDoor
	 *            the bipartingPowerDoor to set
	 */
	public void setBipartingPowerDoor(boolean bipartingPowerDoor) {
		this.bipartingPowerDoor = bipartingPowerDoor;
	}

	/**
	 * @param controlType
	 *            the controlType to set
	 */
	public void setControlType(String controlType) {
		this.controlType = controlType;
	}

	/**
	 * @param driveType
	 *            the driveType to set
	 */
	public void setDriveType(String driveType) {
		this.driveType = driveType;
	}

	/**
	 * @param environment
	 *            the environment to set
	 */
	public void setEnvironment(String environment) {
		this.environment = environment;
	}

	/**
	 * @param foreignEquipment
	 *            the foreignEquipment to set
	 */
	public void setForeignEquipment(boolean foreignEquipment) {
		this.foreignEquipment = foreignEquipment;
	}

	/**
	 * @param freightDoor
	 *            the freightDoor to set
	 */
	public void setFreightDoor(boolean freightDoor) {
		this.freightDoor = freightDoor;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @param location
	 *            the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @param productType
	 *            the productType to set
	 */
	public void setProductType(String productType) {
		this.productType = productType;
	}

	/**
	 * @param unitType
	 *            the unitType to set
	 */
	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	/**
	 * @param usage
	 *            the usage to set
	 */
	public void setUsage(String usage) {
		this.usage = usage;
	}

	public Integer getNumFrontCarDoors() {
		return numFrontCarDoors;
	}

	public void setNumFrontCarDoors(Integer numFrontCarDoors) {
		this.numFrontCarDoors = numFrontCarDoors;
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
		result = prime * result + ((annualCallbacks == null) ? 0 : annualCallbacks.hashCode());
		result = prime * result + (bipartingPowerDoor ? 1231 : 1237);
		result = prime * result + ((cmUnit == null) ? 0 : cmUnit.hashCode());
		result = prime * result + ((controlType == null) ? 0 : controlType.hashCode());
		result = prime * result + ((driveType == null) ? 0 : driveType.hashCode());
		result = prime * result + ((environment == null) ? 0 : environment.hashCode());
		result = prime * result + (foreignEquipment ? 1231 : 1237);
		result = prime * result + (freightDoor ? 1231 : 1237);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((numFrontCarDoors == null) ? 0 : numFrontCarDoors.hashCode());
		result = prime * result + ((numRearCarDoors == null) ? 0 : numRearCarDoors.hashCode());
		result = prime * result + ((productType == null) ? 0 : productType.hashCode());
		result = prime * result + ((unitType == null) ? 0 : unitType.hashCode());
		result = prime * result + ((usage == null) ? 0 : usage.hashCode());
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
		Product other = (Product) obj;
		if (annualCallbacks == null) {
			if (other.annualCallbacks != null)
				return false;
		} else if (!annualCallbacks.equals(other.annualCallbacks))
			return false;
		if (bipartingPowerDoor != other.bipartingPowerDoor)
			return false;
		if (cmUnit == null) {
			if (other.cmUnit != null)
				return false;
		} else if (!cmUnit.equals(other.cmUnit))
			return false;
		if (controlType == null) {
			if (other.controlType != null)
				return false;
		} else if (!controlType.equals(other.controlType))
			return false;
		if (driveType == null) {
			if (other.driveType != null)
				return false;
		} else if (!driveType.equals(other.driveType))
			return false;
		if (environment == null) {
			if (other.environment != null)
				return false;
		} else if (!environment.equals(other.environment))
			return false;
		if (foreignEquipment != other.foreignEquipment)
			return false;
		if (freightDoor != other.freightDoor)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (numFrontCarDoors == null) {
			if (other.numFrontCarDoors != null)
				return false;
		} else if (!numFrontCarDoors.equals(other.numFrontCarDoors))
			return false;
		if (numRearCarDoors == null) {
			if (other.numRearCarDoors != null)
				return false;
		} else if (!numRearCarDoors.equals(other.numRearCarDoors))
			return false;
		if (productType == null) {
			if (other.productType != null)
				return false;
		} else if (!productType.equals(other.productType))
			return false;
		if (unitType == null) {
			if (other.unitType != null)
				return false;
		} else if (!unitType.equals(other.unitType))
			return false;
		if (usage == null) {
			if (other.usage != null)
				return false;
		} else if (!usage.equals(other.usage))
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
		builder.append("Product [id=").append(id).append(", annualCallbacks=").append(annualCallbacks)
				.append(", controlType=").append(controlType).append(", usage=").append(usage).append(", environment=")
				.append(environment).append(", unitType=").append(unitType).append(", driveType=").append(driveType)
				.append(", productType=").append(productType).append(", location=").append(location)
				.append(", foreignEquipment=").append(foreignEquipment).append(", bipartingPowerDoor=")
				.append(bipartingPowerDoor).append(", freightDoor=").append(freightDoor).append(", numRearCarDoors=")
				.append(numRearCarDoors).append(", numFrontCarDoors=").append(numFrontCarDoors).append(", cmUnit=")
				.append(cmUnit).append("]");
		return builder.toString();
	}
}
