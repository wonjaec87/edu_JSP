package com.example.libs;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyContent extends TagSupport{
	@Override
	public int doStartTag() throws JspException{
		JspWriter out = pageContext.getOut();
		Calendar cal = Calendar.getInstance();
		String greeting = null;
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		if(hour < 12) greeting = "Good Morning";
		else if(hour >= 12 && hour < 18) greeting = "Good Afternoon";
		else greeting = "Good Evening";
		try {
			out.println("<div style='color:blue;font-style:italics'>");
			out.println(greeting);
		} catch (IOException e) {
			System.out.println(e);
		}
		return this.EVAL_BODY_INCLUDE;
	}
	@Override
	public int doEndTag() throws JspException{
		String str = "님! 반갑습니다.</div>";
		try {
			pageContext.getOut().println(str);
		}catch (IOException e) {
			System.out.println(e);
		}
		return this.EVAL_PAGE;
	}
}
