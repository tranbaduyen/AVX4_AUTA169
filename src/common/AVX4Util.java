package common;

public class AVX4Util {
	
	public static boolean isBlankOrNull(String string) {
		
		return (string == null || string.length() == 0 || "".equals(string) || "0".equals(string));
	}
	
	public static String convertDateFormat(String dateString) {
		String date = "";
		String day = "";
		String month = "";
		String year = "";
		if(dateString == null || dateString.length() == 0 || "".equals(dateString)) {
			date = "";
		}
		else {
			year = dateString.substring(0,4);
			month = dateString.substring(4,6);
			day = dateString.substring(6,8);
			date = year + "/" + month + "/" + day ;
		}
		return date;
	}
	
}
