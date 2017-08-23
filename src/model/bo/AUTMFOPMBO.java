/**
 * 
 */
package model.bo;

import java.util.ArrayList;

import model.bean.AUTMFOPM;
import model.dao.AUTMFOPMDAO;

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
public class AUTMFOPMBO {
	AUTMFOPMDAO autMFOPMDAO = new AUTMFOPMDAO();

	/**
	 * Method get list AUTMFOPM
	 * 
	 * @return ArrayList<AUTMFOPM>
	 * @throws Exception
	 */
	public ArrayList<AUTMFOPM> getListAUTMFOPM() throws Exception {
		return autMFOPMDAO.getListAUTMFOPM();
	}
}
