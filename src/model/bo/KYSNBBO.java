/**
 * 
 */
package model.bo;

import java.util.ArrayList;

import model.bean.KYSNB;
import model.dao.KYSNBDAO;

/**
 * AUTKYSNDBO.java
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
public class KYSNBBO {
	
	KYSNBDAO kYSNBDAO = new KYSNBDAO();

	/**
	 * Method get a List KYSNB from database
	 * 
	 * @param listAUTKYSND
	 * @return true || false
	 * @throws Exception
	 */
	public ArrayList<KYSNB> getListKYSNB(String kYSNB_SEDT_From,String kYSNB_SEDT_To,String kYSNB_DEPO,String kYSNB_MKCD,String kYSNB_SSCD,String kYSNB_BHNO, int indexStart, int indexEnd) throws Exception {
		return kYSNBDAO.getListKYSNB(kYSNB_SEDT_From, kYSNB_SEDT_To, kYSNB_DEPO, kYSNB_MKCD, kYSNB_SSCD, kYSNB_BHNO, indexStart, indexEnd);
	}

	/**
	 * Ham lay noOfRecords
	 * 
	 * @return kYSNBDAO.getNoOfRecords()
	 */
	public int getNoOfRecords() {
		return kYSNBDAO.getNoOfRecords();
	}

	
	
}
