/**
 * 
 */
package model.bo;

import java.util.ArrayList;

import model.bean.MFOPM;
import model.dao.MFOPMDAO;

/**
 * AUTMFOPMBO.java
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
public class MFOPMBO {
	MFOPMDAO autMFOPMDAO = new MFOPMDAO();

	/**
	 * Method get list AUTMFOPM
	 * 
	 * @return ArrayList<AUTMFOPM>
	 * @throws Exception
	 */
	public ArrayList<MFOPM> getListAUTMFOPM() throws Exception {
		return autMFOPMDAO.getListAUTMFOPM();
	}
}
