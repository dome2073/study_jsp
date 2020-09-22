<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, java.util.Set, java.util.Map, java.util.Iterator"%>
<%@ page import="org.jsoup.Jsoup, org.jsoup.nodes.Document , org.jsoup.nodes.Element , org.jsoup.select.Elements;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	
	Map<String, String> aMap = new HashMap<>();
	
	String urlquery = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=%EB%9D%A0%EB%B3%84%EC%9A%B4%EC%84%B8";

	Document doc = Jsoup.connect(urlquery).get();
	// System.out.println(doc);
	Elements ele = doc.select(".sign_lst a");

	// 전체 띠
	StringBuffer query_str = new StringBuffer();

	for (int i = 0; i < ele.size(); i++) {

		Element target = ele.get(i);

		query_str.append(target.text());
	}
	String string_query = new String(query_str);
	String str_q = string_query.replace("띠", "띠 ");
	// System.out.println(string_query);

	// 띠 배열 생성
	String[] url_arr = str_q.split(" ");
	// ----------------------
	for (int i = 0; i < url_arr.length; i++) {
//		System.out.println(url_arr[i]);
		String url = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&query=" + url_arr[i];

		Document doc2 = Jsoup.connect(url).get();
		// System.out.println(doc);
		Elements ele2 = doc2.select("#yearFortune div p");

		StringBuffer str2 = new StringBuffer();
		// #yearForturn
		for (int j = 0; j < ele2.size(); j++) {

			Element target = ele2.get(j);

			str2.append(target.text());
			
		}
		String st2 = new String(str2);
		

		
		aMap.put(url_arr[i],st2);
		
	}
		
	System.out.println(aMap.get("소띠"));
	%>
		
	<h1>오늘의 운세</h1>
</body>
</html>