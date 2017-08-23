package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.KYSNB;

public class SearchKYSNBForm extends ActionForm{
	
	private static final long serialVersionUID = 1L;
	private ArrayList<KYSNB> listKYSNB;
	private int noOfPages;
	private int currentPage;
	private String submit;
	private String action;
	private ArrayList<Integer> listPage;
	private String kYSNB_SEDT_From;
	private String kYSNB_SEDT_To;
	private String kYSNB_DEPO;
	private String kYSNB_MKCD;
	private String kYSNB_SSCD;
	private String kYSNB_BHNO;
	private int limit = 10;
	

	/**
	 * @return the limit
	 */
	public int getLimit() {
		return limit;
	}

	/**
	 * @param limit the limit to set
	 */
	public void setLimit(int limit) {
		this.limit = limit;
	}

	/**
	 * @return the listKYSNB
	 */
	public ArrayList<KYSNB> getListKYSNB() {
		return listKYSNB;
	}
	
	/**
	 * @param listKYSNB the listKYSNB to set
	 */
	public void setListKYSNB(ArrayList<KYSNB> listKYSNB) {
		this.listKYSNB = listKYSNB;
	}
	
	/**
	 * @return the noOfPages
	 */
	public int getNoOfPages() {
		return noOfPages;
	}
	
	/**
	 * @param noOfPages the noOfPages to set
	 */
	public void setNoOfPages(int noOfPages) {
		this.noOfPages = noOfPages;
	}
	
	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}
	
	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	/**
	 * @return the submit
	 */
	public String getSubmit() {
		return submit;
	}
	
	/**
	 * @param submit the submit to set
	 */
	public void setSubmit(String submit) {
		this.submit = submit;
	}
	
	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}
	
	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}
	
	/**
	 * @return the listPage
	 */
	public ArrayList<Integer> getListPage() {
		return listPage;
	}
	
	/**
	 * @param listPage the listPage to set
	 */
	public void setListPage(ArrayList<Integer> listPage) {
		this.listPage = listPage;
	}
	
	/**
	 * @return the kYSNB_SEDT_From
	 */
	public String getkYSNB_SEDT_From() {
		return kYSNB_SEDT_From;
	}
	
	/**
	 * @param kYSNB_SEDT_From the kYSNB_SEDT_From to set
	 */
	public void setkYSNB_SEDT_From(String kYSNB_SEDT_From) {
		this.kYSNB_SEDT_From = kYSNB_SEDT_From;
	}
	
	/**
	 * @return the kYSNB_SEDT_To
	 */
	public String getkYSNB_SEDT_To() {
		return kYSNB_SEDT_To;
	}
	
	/**
	 * @param kYSNB_SEDT_To the kYSNB_SEDT_To to set
	 */
	public void setkYSNB_SEDT_To(String kYSNB_SEDT_To) {
		this.kYSNB_SEDT_To = kYSNB_SEDT_To;
	}
	
	/**
	 * @return the kYSNB_DEPO
	 */
	public String getkYSNB_DEPO() {
		return kYSNB_DEPO;
	}
	
	/**
	 * @param kYSNB_DEPO the kYSNB_DEPO to set
	 */
	public void setkYSNB_DEPO(String kYSNB_DEPO) {
		this.kYSNB_DEPO = kYSNB_DEPO;
	}
	
	/**
	 * @return the kYSNB_MKCD
	 */
	public String getkYSNB_MKCD() {
		return kYSNB_MKCD;
	}
	
	/**
	 * @param kYSNB_MKCD the kYSNB_MKCD to set
	 */
	public void setkYSNB_MKCD(String kYSNB_MKCD) {
		this.kYSNB_MKCD = kYSNB_MKCD;
	}
	
	/**
	 * @return the kYSNB_SSCD
	 */
	public String getkYSNB_SSCD() {
		return kYSNB_SSCD;
	}
	
	/**
	 * @param kYSNB_SSCD the kYSNB_SSCD to set
	 */
	public void setkYSNB_SSCD(String kYSNB_SSCD) {
		this.kYSNB_SSCD = kYSNB_SSCD;
	}
	
	/**
	 * @return the kYSNB_BHNO
	 */
	public String getkYSNB_BHNO() {
		return kYSNB_BHNO;
	}
	
	/**
	 * @param kYSNB_BHNO the kYSNB_BHNO to set
	 */
	public void setkYSNB_BHNO(String kYSNB_BHNO) {
		this.kYSNB_BHNO = kYSNB_BHNO;
	}
	
	
	
}
