package com.aop;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.ProceedingJoinPoint;

public class PermissionValidation {


	public Object aroundAction(ProceedingJoinPoint  p) throws Throwable {
		Object object=p.proceed();
		HttpSession session=ServletActionContext.getRequest().getSession();
		System.out.println(session.getId());
		if (session.getAttribute("staff")==null) {
			Date date=new Date();
			System.out.println(date.getTime());
			object="ReLogin";
		}		
		return object;
	}	
}
