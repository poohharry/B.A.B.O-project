package common;

public class UtilMgr {
	
	// 어떠한 문자열 str을 받고 그 안에서 pattern을 찾아 replace로 치환하는 함수
	public static String replace(String str, String pattern, String replace) {
		int s = 0, e = 0;
		StringBuffer rs = new StringBuffer();
		
		while((e = str.indexOf(pattern, s)) >= 0) {
			rs.append(str.substring(s,e));
			rs.append(replace);
			s = e + pattern.length();
		}
		rs.append(str.substring(s));
		return rs.toString();
		
		
	}
}
