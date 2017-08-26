/**
 * 
 */
package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.AVX4Util;
import model.bean.KYSNB;

/**
 * AUTKYSNDDAO.java
 *
 * Version 1.1
 *
 * Date: 18-05-2017
 *
 * Copyright
 *
 * Modification Logs: 
 * DATE 			AUTHOR		 	DESCRIPTION
 * -----------------------------------------------------------------------
 * 22-05-2017 		DuyenTB 		Create
 */
/**
 * @author admin
 *
 */
/**
 * @author admin
 *
 */
public class KYSNBDAO {
	DataAccess da = new DataAccess();
	Connection connection = null;
	Statement stmt = null;
	PreparedStatement preparedStatementInsert = null;
	CallableStatement cs = null;
	private int noOfRecords = 0;


	
	/**
	 * @param kYSNB_SEDT_From
	 * @param kYSNB_SEDT_To
	 * @param kYSNB_DEPO
	 * @param kYSNB_MKCD
	 * @param kYSNB_SSCD
	 * @param kYSNB_BHNO
	 * @param indexStart
	 * @param indexEnd
	 * @return ArrayList<KYSNB> list
	 * @throws Exception
	 */
	public ArrayList<KYSNB> getListKYSNB(String kYSNB_SEDT_From,String kYSNB_SEDT_To,String kYSNB_DEPO,String kYSNB_MKCD,String kYSNB_SSCD,String kYSNB_BHNO, int indexStart, int indexEnd) throws Exception {
		String sql1 = "SELECT KYSNB_SEDT, KYSNB_SHMS, KYSNB_DEPO, KYSNB_MKCD, KYSNB_SSCD, KYSNB_SEQ, KYSNB_MKKG,KYSNB_FORM,KYSNB_BHNO,KYSNB_SYMD,KYSNB_CHNO,KYSNB_SZSU,KYSNB_BHME,KYSNB_SYCD FROM ( "
				+ " SELECT dt.*, ROW_NUMBER() over (ORDER BY KYSNB_SEDT, KYSNB_SHMS, KYSNB_DEPO, KYSNB_MKCD, KYSNB_SSCD, KYSNB_SEQ ) as ct from  AUTKYSNB dt where 1 = 1 ";
		String sql2 = "";
		String sql3 = " ) sub WHERE ( ct > " + indexStart + " AND ct <= " + indexEnd + " ) ";
		
		if(!AVX4Util.isBlankOrNull(kYSNB_SEDT_From)) {
			sql2 = sql2 + " AND CONVERT(date,KYSNB_SEDT) >= CONVERT(date,'" + kYSNB_SEDT_From + "') ";
		}
		
		if(!AVX4Util.isBlankOrNull(kYSNB_SEDT_To)) {
			sql2 = sql2 + " AND CONVERT(date,KYSNB_SEDT) <= CONVERT(date,'" + kYSNB_SEDT_To + "') ";
		}
		
		if(!AVX4Util.isBlankOrNull(kYSNB_DEPO)) {
			sql2 = sql2 + " AND KYSNB_DEPO LIKE '%" + kYSNB_DEPO + "%' ";
		}
		
		if(!AVX4Util.isBlankOrNull(kYSNB_MKCD)) {
			sql2 = sql2 + " AND KYSNB_MKCD LIKE '%" + kYSNB_MKCD + "%' ";
		}
		
		if(!AVX4Util.isBlankOrNull(kYSNB_SSCD)) {
			sql2 = sql2 + " AND KYSNB_SSCD LIKE '%" + kYSNB_SSCD + "%' ";
		}
		
		if(!AVX4Util.isBlankOrNull(kYSNB_BHNO)) {
			sql2 = sql2 + " AND KYSNB_BHNO LIKE '%" + kYSNB_BHNO + "%' ";
		}
		
		String sql = sql1 + sql2 + sql3;
		System.out.println(sql);
		ArrayList<KYSNB> list = new ArrayList<KYSNB>();
		KYSNB kYSNB = new KYSNB();
		ResultSet rs = null;
		try {
			connection = da.getConnect();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				kYSNB = new KYSNB();
				kYSNB.setkYSNB_SEDT(AVX4Util.convertDateFormat(rs.getString("KYSNB_SEDT")));
				kYSNB.setkYSNB_DEPO(rs.getString("KYSNB_DEPO"));
				kYSNB.setkYSNB_SEQ(rs.getInt("KYSNB_SEQ"));
				kYSNB.setkYSNB_MKCD(rs.getString("KYSNB_MKCD"));
				kYSNB.setkYSNB_SSCD(rs.getString("KYSNB_SSCD"));
				kYSNB.setkYSNB_BHNO(rs.getString("KYSNB_BHNO"));
				kYSNB.setkYSNB_SYMD(AVX4Util.convertDateFormat(rs.getString("KYSNB_SYMD")));
				kYSNB.setkYSNB_BHME(rs.getString("KYSNB_BHME"));
				kYSNB.setkYSNB_CHNO(rs.getString("KYSNB_CHNO"));
				kYSNB.setkYSNB_FORM(rs.getString("KYSNB_FORM"));
				kYSNB.setkYSNB_SHMS(rs.getString("KYSNB_SHMS"));
				kYSNB.setkYSNB_MKKG(rs.getString("KYSNB_MKKG"));
				kYSNB.setkYSNB_SZSU(rs.getInt("KYSNB_SZSU"));
				kYSNB.setkYSNB_SYCD(rs.getString("KYSNB_SYCD"));
				list.add(kYSNB);
			}
			
			rs.close();

			// Get max records in database to paging
			rs = stmt.executeQuery("select count(*) as num from AUTKYSNB Where 1 = 1 " + sql2);
			if (rs.next()) {
				this.noOfRecords = rs.getInt("num");
			}
		} catch (Exception e) {
			throw new Exception("Error occur: " + e.getMessage());
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new SQLException("Error occur: " + e.getMessage());
			}
		}
		return list;
	}


	/**
	 * @return the noOfRecords
	 */
	public int getNoOfRecords() {
		return noOfRecords;
	}


	/**
	 * @param noOfRecords the noOfRecords to set
	 */
	public void setNoOfRecords(int noOfRecords) {
		this.noOfRecords = noOfRecords;
	}


	
}
