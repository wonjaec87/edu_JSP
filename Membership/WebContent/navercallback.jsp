<%@ page contentType="text/html;charset=utf-8" language="java" 
	pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONObject" %>

<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "62jVBf0Hf3myB2SQGcaB";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "6Y7nGZdbSy";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = getAccessToken(apiURL);
    //String result = 
    		getResult(access_token);
    
    //String email = ;
    //String username = ;
    //out.println("사용자 이름 = " + username + "<br />");
    //out.println("사용자 이메일주소 = " + email + "<br />");
  %>
  </body>
</html>
<%!
	private void getResult(String token) throws Exception{
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(token);
		String access_token = (String)obj.get("access_token");
		String str = "Bearer " + access_token;  //주의 : 반드시 Bearer 한칸 띄울 것
		String myurl = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(myurl);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", str);
		int responseCode = conn.getResponseCode();
		BufferedReader br = null;
		if(responseCode == 200){
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		System.out.println(res.toString());
	}

	private String getURI() throws Exception{
		return URLEncoder.encode("http://localhost:8080/Membership/navercallback.jsp", "UTF-8");
	}
	private String getAccessToken(String myurl) throws Exception{
		URL url = new URL(myurl);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		return res.toString();
	}
%>