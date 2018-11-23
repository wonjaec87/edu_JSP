<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder"%> 
<%
		request.setCharacterEncoding("utf-8");
		String query = request.getParameter("query");
		String clientId = "7UJPnJeylfo3I7wiQTn9";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "zULaomMPzn";//애플리케이션 클라이언트 시크릿값";
        try {
            String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + query;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode== 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer result = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                result.append(inputLine);
            }
            br.close();
            out.println(result.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
%> 