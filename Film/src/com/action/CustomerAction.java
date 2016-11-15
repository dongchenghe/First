package com.action;

import com.bean.Customer;
import com.dao.ICustomerDao;
import com.opensymphony.xwork2.ActionContext;
import com.service.ICustomerService;

public class CustomerAction {
	private Customer cus;
	private ICustomerService service;
	private String tip;
	public String execute(){
		tip=null;
		return "success";
	}
	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		Customer ccus = service.getCustomerByPhone(cus.getPhone());
		if(ccus==null){
			tip="此手机号码未注册";
			return "error";
		}else{
			if(!ccus.getPwd().equals(cus.getPwd())){
				tip="密码错误";
				return "error";
			}
		}
		ActionContext.getContext().getSession().put("user", cus);
		return "success";
	}
	/**
	 * ajax判断电话号码是否存在
	 * @return
	 */
	public String isPhoneExit(){
		tip ="{'result':'ok'}";
		Customer ccus = service.getCustomerByPhone(cus.getPhone());
		if(ccus!=null){
			tip="{'result':'no'}";
		}
		return "success";
	}
	
	public String register(){
		Customer ccus = service.getCustomerByPhone(cus.getPhone());
		if(ccus!=null||cus.getPwd()==null){
			tip="手机号码已经注册了";
			return "error";
		}
		service.addCustomer(cus);
		ActionContext.getContext().getSession().put("user", cus);
		tip=null;
		return "success";
	}
	public String logout(){
		ActionContext.getContext().getSession().remove("user");
		return "success";
	}
	
	
	public Customer getCus() {
		return cus;
	}
	public void setCus(Customer cus) {
		this.cus = cus;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public ICustomerService getService() {
		return service;
	}
	public void setService(ICustomerService service) {
		this.service = service;
	}
	
	
}
