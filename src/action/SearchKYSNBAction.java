package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.AVX4Util;
import form.SearchKYSNBForm;
import model.bean.KYSNB;
import model.bo.KYSNBBO;

/**
 * DanhSachNhaPhanPhoiAction.java
 *
 * Version 3.0
 *
 * Date: 11-08-2017
 *
 * Copyright
 *
 * Modification Logs: 
 * DATE 			AUTHOR 			DESCRIPTION
 * -----------------------------------------------------------------------
 * 09-08-2017 		HuongVTM 		Create
 * 10-08-2017 		HuongVTM 		Modify
 * 11-08-2017 		HuongVTM 		Modify
 */
public class SearchKYSNBAction extends Action {

	/**
	 * Method execute action
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return mapping.findForward()
	 * @throws Exception
	 */
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		SearchKYSNBForm searchKYSNBForm = (SearchKYSNBForm) form;
		int currentPage = 1;
		int recordsPerPage = 10;
		int noOfRecords = 0;
		int noOfPages = 0;
		int indexStart = 0;
		int indexEnd = 0;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ArrayList<Integer> listPage = new ArrayList<Integer>();
		ArrayList<KYSNB> listKYSNB = new ArrayList<KYSNB>();
		KYSNBBO kYSNBBO = new KYSNBBO();
		String kYSNB_SEDT_From = searchKYSNBForm.getkYSNB_SEDT_From();
		String kYSNB_SEDT_To = searchKYSNBForm.getkYSNB_SEDT_To();
		String kYSNB_DEPO = searchKYSNBForm.getkYSNB_DEPO();
		String kYSNB_MKCD = searchKYSNBForm.getkYSNB_MKCD();
		String kYSNB_SSCD = searchKYSNBForm.getkYSNB_SSCD();
		String kYSNB_BHNO = searchKYSNBForm.getkYSNB_BHNO();
		
		if(AVX4Util.isBlankOrNull(kYSNB_SEDT_From)) {
			kYSNB_SEDT_From = "00010101";
		}
		
		if(AVX4Util.isBlankOrNull(kYSNB_SEDT_To)) {
			kYSNB_SEDT_To = "99991231";
		}
		recordsPerPage = searchKYSNBForm.getLimit();
		System.out.println(recordsPerPage);
		indexStart = (currentPage - 1) * recordsPerPage;
		indexEnd = recordsPerPage * currentPage;
			
		try {	
			
			listKYSNB = kYSNBBO.getListKYSNB(kYSNB_SEDT_From, kYSNB_SEDT_To, kYSNB_DEPO, kYSNB_MKCD, kYSNB_SSCD, kYSNB_BHNO, indexStart, indexEnd);
			noOfRecords = kYSNBBO.getNoOfRecords();
			
		} catch (Exception e) {
	
			// Exeption throw -> redirect to Error page
			return mapping.findForward("error");
		}

		noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		for (int i = 1; i <= noOfPages; i++) {
			listPage.add(i);
		}

		try {
			searchKYSNBForm.setListKYSNB(listKYSNB);
			searchKYSNBForm.setListPage(listPage);
			searchKYSNBForm.setCurrentPage(currentPage);
			searchKYSNBForm.setNoOfPages(noOfPages);
		} catch (NullPointerException npe) {

			// Exeption throw -> redirect to Error page
			return mapping.findForward("error");
		}

		return mapping.findForward("listKYSNB");
	}

}
