package servlet;

public class FormatUtil {

	public static String moneyFormat(String s) {
		String result = "";
		int count = 0;
		for (int i = s.indexOf(".") - 1; i >= 0; i--) {
			count++;
			result = s.charAt(i) + result;
			if (count == 3 && i != 0) {
				result = "," + result;
				count = 0;
			}
		}
		return result;
	}

}
