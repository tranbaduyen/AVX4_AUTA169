/**
 * 
 */
package model.bean;

/**
 * AUTMFOPM.java
 *
 * Version 1.0
 *
 * Date: 18-05-2017
 *
 * Copyright
 *
 * Modification Logs: 
 * DATE 			AUTHOR		 	DESCRIPTION
 * -----------------------------------------------------------------------
 * 18-05-2017 		DuyenTB 		Create
 */
public class MFOPM {
	private String mFOPM_MKCD;
	private String mFOPM_RYAK;
	
	/**
	 * Method constructor
	 * 
	 * @param mFOPM_MKCD
	 * @param mFOPM_NAME
	 */
	public MFOPM() {
		super();
		this.mFOPM_MKCD = "";
		this.mFOPM_RYAK = "";
	}
	
	/**
	 * Method constructor
	 * 
	 * @param mFOPM_MKCD
	 * @param mFOPM_NAME
	 */
	public MFOPM(String mFOPM_MKCD, String mFOPM_RYAK) {
		super();
		this.mFOPM_MKCD = mFOPM_MKCD;
		this.mFOPM_RYAK = mFOPM_RYAK;
	}
	
	/**
	 * @return the mFOPM_MKCD
	 */
	public String getmFOPM_MKCD() {
		return mFOPM_MKCD;
	}
	
	/**
	 * @param mFOPM_MKCD the mFOPM_MKCD to set
	 */
	public void setmFOPM_MKCD(String mFOPM_MKCD) {
		this.mFOPM_MKCD = mFOPM_MKCD;
	}
	
	/**
	 * @return the mFOPM_RYAK
	 */
	public String getmFOPM_RYAK() {
		return mFOPM_RYAK;
	}
	
	/**
	 * @param mFOPM_RYAK the mFOPM_RYAK to set
	 */
	public void setmFOPM_RYAK(String mFOPM_RYAK) {
		this.mFOPM_RYAK = mFOPM_RYAK;
	}
	
	
	
}
