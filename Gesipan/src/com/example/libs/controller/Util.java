package com.example.libs.controller;

public class Util {
	public static String getExtension(String filename) {
		String extension = null;
		if(filename.endsWith(".ppt") || filename.endsWith(".pptx")) extension = "ppt";
		else if(filename.endsWith(".doc") || filename.endsWith(".docx")) extension="doc";
		else if(filename.endsWith(".xls") || filename.endsWith(".xlsx")) extension="xls";
		else if(filename.endsWith(".zip") || filename.endsWith(".gz")) extension = "zip";
		else if(filename.endsWith(".jar")) extension = "jar";
		else if(filename.endsWith(".pdf")) extension = "pdf";
		else extension = "file";
		return extension;
	}
	public static String concat(String original) {
		String result = "\r\n\r\n\r\n\r\n-------------------------------------------------";
		result += "\r\n>>";
		result += original.replace("\r\n", "\r\n>>");
		return result;
	}
	public static String reconvert(String original, boolean flag) {
		String result = null;
		result = original.replace("&lt;", "<");
		result = result.replace("&gt;", ">");
		result = result.replace("''", "'");
		if(flag) {
			result = result.replace("<br />", "\r\n");
		}
		return result;
	}
	//flag 가 true이면 contents다. 
	public static String convert(String original, boolean flag) {
		String result = null;
		result = original.replace("<", "&lt;");
		result = result.replace(">", "&gt;");
		result = result.replace("'", "''");
		if(flag) {
			result = result.replace("\r\n", "<br />");
		}
		return result;
	}
}
