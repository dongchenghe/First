package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import org.apache.struts2.ServletActionContext;
import com.bean.Staff;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IStaffService;
import net.sf.json.JSONObject;
public class StaffLoginAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  IStaffService  service;
	private  Staff staff;
	public IStaffService getService() {
		return service;
	}
	public void setService(IStaffService service) {
		this.service = service;
	}
	public String execute() {
		return SUCCESS;
	}
	public String login(){
		Staff staff_1=service.getStaff(staff);
		if(staff_1==null){
			PrintWriter writer=null;
			staff.setPwd(null);
			JSONObject jsonObject=new JSONObject();
			ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
			try {
				writer=ServletActionContext.getResponse().getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}			
			if(service.getStaff(staff)==null){
				jsonObject.put("msg", "用户名不存在");				
				writer.println(jsonObject);				
			}else{
				jsonObject.put("msg", "密码错误");
				writer.println(jsonObject);
			}
			writer.flush();
			writer.close();	
			return ERROR;	
		}		
		ServletActionContext.getRequest().getSession().setAttribute("staff", staff_1);
		return LOGIN;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}	
}
