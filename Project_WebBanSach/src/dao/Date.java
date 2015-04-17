package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Date {
	public static String dateToString(int year, int month, int day) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf_yyyyMMdd = new SimpleDateFormat("yyyy/MM/dd");
		cal.set(year, month - 1, day);
		return sdf_yyyyMMdd.format(cal.getTime());
	}

	public static void main(String[] args) throws ParseException {
		Date d = new Date();
		System.out.println(d.dateToString(1994, 07, 14));
	}

}
