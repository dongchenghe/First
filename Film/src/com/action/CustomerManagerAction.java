package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.bean.Customer;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ICustomerService;

import net.sf.json.JSONObject;


public class CustomerManagerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ICustomerService service;
	private int page;
	private int rows;
	private Customer customer;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public ICustomerService getService() {
		return service;
	}
	public void setService(ICustomerService service) {
		this.service = service;
	}
	public String getCustomers() throws IOException{
		List<Customer> lists=service.getCustomers(customer);
		List<Customer> list=new ArrayList<Customer>();
		Map<String, Object> map=new HashMap<>();
		int start=(page-1)*rows;
		Customer customer=null;
		int count=((lists.size()-start)<rows)?(lists.size()-start):rows;
	
		for(int i=0;i<count;i++){
			customer=lists.get(i+start);
			list.add(customer);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer=ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		JSONObject object=JSONObject.fromObject(map);
		writer.println(object);
		return null;
	}
	public String addCustomer(){
		service.addCustomer(customer);
		return null;		
	}
	public String updateCustomer(){
		service.updateCustomer(customer);
		return null;		
	}
	public String deleteCustomer(){
		service.deleteCustomer(customer);
		return null;		
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
}

