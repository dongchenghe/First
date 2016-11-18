package com.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class TimeShowTag extends TagSupport{
	private String time;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		JspWriter out = pageContext.getOut();
		SimpleDateFormat sim = new SimpleDateFormat("MM月dd日");
		Calendar c = Calendar.getInstance();
		int nowday = c.get(Calendar.DAY_OF_MONTH);
		try {
			if(time.equals("day3")){
				c.set(Calendar.DATE, nowday+2);
				out.print(sim.format(c.getTime()));
			}
			else if(time.equals("day2")){
				c.set(Calendar.DATE, nowday+1);
				out.print(sim.format(c.getTime()));
			}else{
				out.print(sim.format(c.getTime()));
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	public static void main(String[] args) {
		Calendar c = Calendar.getInstance();
		int nowday = c.get(Calendar.DAY_OF_MONTH);
		SimpleDateFormat sim = new SimpleDateFormat("MM月dd日");
		System.out.println(sim.format(c.getTime()));
	}
}
