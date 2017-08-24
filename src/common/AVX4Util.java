package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	public static boolean compareDate(String startDate, String endDate) {
		if(AVX4Util.isBlankOrNull(startDate) || AVX4Util.isBlankOrNull(endDate)) {
			return false;
		}
		try {
			Date start = new SimpleDateFormat("yyyy/MM/dd", Locale.ENGLISH).parse(startDate);
			Date end = new SimpleDateFormat("yyyy/MM/dd", Locale.ENGLISH).parse(endDate);
			System.out.println(start);
			System.out.println(end);
			return start.compareTo(end) > 0;
		} catch (ParseException e) {
			return false;
		}
	}
}
