package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import common.AVX4Util;
import common.ValidateData;
import form.SearchKYSNBForm;
import model.bean.KYSNB;
import model.bean.MFOPM;
import model.bo.KYSNBBO;
import model.bo.MFOPMBO;

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
		
		//get list ArrayList<MFOPM> listMFOPM for select option 
		MFOPMBO mFOPMBO = new MFOPMBO();
		ArrayList<MFOPM> listMFOPM = mFOPMBO.getListAUTMFOPM();
		searchKYSNBForm.setListMFOPM(listMFOPM);
		
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
		
		ActionErrors actionErrors = new ActionErrors();
		searchKYSNBForm.setErrorFirst(0);
		
		if (ValidateData.isInvalidDateFormat(kYSNB_SEDT_From)) {
			actionErrors.add("kYSNB_SEDT_FromError", new ActionMessage("error.sedtFrom.dateFormat"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(1);
			}
		} else if (!ValidateData.isValidDateValue(kYSNB_SEDT_From)) {
			actionErrors.add("kYSNB_SEDT_FromError", new ActionMessage("error.sedtFrom.dateFormat"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(1);
			}
		}
		
		if (ValidateData.isInvalidDateFormat(kYSNB_SEDT_To)) {
			actionErrors.add("kYSNB_SEDT_ToError", new ActionMessage("error.sedtTo.dateFormat"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(2);
			}
		} else if (!ValidateData.isValidDateValue(kYSNB_SEDT_To)) {
			actionErrors.add("kYSNB_SEDT_ToError", new ActionMessage("error.sedtTo.dateFormat"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(2);
			}
		} else if (AVX4Util.compareDate(kYSNB_SEDT_From, kYSNB_SEDT_To)) {
			actionErrors.add("kYSNB_SEDT_FromToError", new ActionMessage("error.sedtFromTo.dateValue"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(1);
			}

		}
		
		// check kYSNB_SSCD is not halfsize
		if (ValidateData.isContainFullSize(kYSNB_SSCD)) {
			actionErrors.add("kYSNB_SSCDError", new ActionMessage("error.sscd.halfsize"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(3);
			}

		}

		// check kYSNB_DEPO is not halfsize
		if (ValidateData.isContainFullSize(kYSNB_DEPO)) {
			actionErrors.add("kYSNB_DEPOError", new ActionMessage("error.depo.halfsize"));
			if (searchKYSNBForm.getErrorFirst() == 0) {
				searchKYSNBForm.setErrorFirst(4);
			}
			
		}
		
		saveErrors(request, actionErrors);
		if (actionErrors.size() > 0) {
			return mapping.findForward("searchError");
		}
		
		if(AVX4Util.isBlankOrNull(kYSNB_SEDT_From)) {
			kYSNB_SEDT_From = "00010101";
		}
		
		if(AVX4Util.isBlankOrNull(kYSNB_SEDT_To)) {
			kYSNB_SEDT_To = "99991231";
		}
		
		recordsPerPage = searchKYSNBForm.getLimit();
		indexStart = (currentPage - 1) * recordsPerPage;
		indexEnd = recordsPerPage * currentPage;
			
		try {	
			
			listKYSNB = kYSNBBO.getListKYSNB(kYSNB_SEDT_From, kYSNB_SEDT_To, kYSNB_DEPO, kYSNB_MKCD, kYSNB_SSCD, kYSNB_BHNO, indexStart, indexEnd);
			noOfRecords = kYSNBBO.getNoOfRecords();
			actionErrors = new ActionErrors();
			if(listKYSNB == null || listKYSNB.size() == 0){
				actionErrors.add("kYSNB_SearchError", new ActionMessage("error.search.noData"));
				saveErrors(request, actionErrors);
				if (searchKYSNBForm.getErrorFirst() == 0) {
					searchKYSNBForm.setErrorFirst(1);
				}
			}
			
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
