package common;

/**
 * ValidateData.java
 *
 * Version 1.0
 *
 * Date: 22-05-2017
 *
 * Copyright
 *
 * Modification Logs: 
 * DATE 			AUTHOR		 	DESCRIPTION
 * -----------------------------------------------------------------------
 * 22-05-2017 		DuyenTB 		Create
 */
public class ValidateData {

	/**
	 * Ham chuan hoa chuoi string Method format String
	 * 
	 * @param str
	 * @return str
	 */
	public static String chuanHoa(String str) {
		if(str == null) {
			str = "";
		}
		str = str.trim();
		str = str.replaceAll("'", "");
		str = str.replaceAll("\\s+", " ");
		return str;
	}

	private static boolean isNamNhuan(int year) {
		return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
	}
	
	/**
	 * Ham kiem tra gia tri hop le kieu date 
	 * Method check valid date value 
	 * 
	 * @param date
	 * @return true || false
	 */
	public static boolean isValidDateValue(String date) {
		if(AVX4Util.isBlankOrNull(date)) {
			return true;
		}
		chuanHoa(date);
		int year = Integer.parseInt(date.substring(0, 4));
		int month = Integer.parseInt(date.substring(5, 7));
		int day = Integer.parseInt(date.substring(8, 10));

		if(year <1 || month<1 || month>12 || day<1)
			return false;
		else
		{
			switch (month)
			{
			case 1: case 3: case 5: case 7: case 8: case 10: case 12:
				if(day>31)
					return false;
				else
					return true;
			case 4: case 6: case 9: case 11:
				if(day>30)
					return false;
				else
					return true;
			case 2:
				if(isNamNhuan(year))
				{
					if(day>29)
						return false;
				}
				else
					if(day>28)
						return false;
				break;
			}
		}
		return true;
	}

	/**
	 * Ham kiem tra format hop le kieu date
	 * Method check valid date format (10 characters: yyyy/MM/dd )
	 * 
	 * @param date
	 * @return true || false
	 */
	public static boolean isInvalidDateFormat(String date) {
		date = chuanHoa(date);
		if(AVX4Util.isBlankOrNull(date)) {
			return false;
		}
		String regex = "^(\\d{4})/(0?[1-9]|1[012])/(0?[1-9]|[12][0-9]|3‌​[01])$";
		return !(date.matches(regex)) && date.length() != 10;
	}
	
	/**
	 * Checking full-width character is included in string. If full-width
	 * character is included in string, it will return true. If is not, it will
	 * return false.
	 * 
	 * @param cmdl
	 * @return true || false
	 */
	public static boolean isContainFullSize(String cmdl) {
		if(AVX4Util.isBlankOrNull(cmdl))
			return false;
		boolean isFullSize = false;
		for (char c : cmdl.toCharArray()) {
			if (!isHalfSize(c)) {
				isFullSize = true;
				break;
			}
		}
		return isFullSize;
	}

	/**
	 * Checking character is half-width or not. Unicode value of half-width
	 * range: '\u0000' - '\u00FF' '\uFF61' - '\uFFDC' '\uFFE8' - '\uFFEE' If
	 * unicode value of character is within this range, it will be half-width
	 * character.
	 * 
	 * @param c
	 * @return true || false
	 */
	public static boolean isHalfSize(char c) {
		return '\u0000' <= c && c <= '\u00FF' || '\uFF61' <= c && c <= '\uFFDC' || '\uFFE8' <= c && c <= '\uFFEE';
	}
}
