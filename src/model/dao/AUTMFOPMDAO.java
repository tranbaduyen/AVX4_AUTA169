/**
 * 
 */
package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.AUTMFOPM;

/**
 * AUTMFOPMDAO.java
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
public class AUTMFOPMDAO {
	DataAccess da = new DataAccess();
	Connection connection = null;
	Statement stmt = null;
	
	/**
	 * Method get list AUTMFOPM into Select Option
	 * 
	 * @return ArrayList<AUTMFOPM> list
	 * @throws Exception
	 */
	public ArrayList<AUTMFOPM> getListAUTMFOPM() throws Exception{
		String sql = "SELECT MFOPM_TRCD, MFOPM_RYAK, MFOPM_NAME "
				+ "FROM AUTMFOPM ORDER BY (MFOPM_TRCD) ASC ";
		ArrayList<AUTMFOPM> list = new ArrayList<AUTMFOPM>();
		AUTMFOPM autMFOPM;
		ResultSet rs = null;
		try {
			connection = da.getConnect();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				autMFOPM = new AUTMFOPM();
				autMFOPM.setmFOPM_MKCD(rs.getString("MFOPM_TRCD"));
				autMFOPM.setmFOPM_RYAK(rs.getString("MFOPM_RYAK"));
				autMFOPM.setmFOPM_NAME(rs.getString("MFOPM_NAME"));
				list.add(autMFOPM);
			}
		} catch (Exception e) {
			throw new Exception("Error occur: "+ e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				throw new SQLException("Error occur: "+ e.getMessage());
			}
		}
		return list;
	}
	

}
