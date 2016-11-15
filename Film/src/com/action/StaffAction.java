package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.bean.Job;
import com.bean.Staff;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IStaffService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class StaffAction {
	private IStaffService service;
	//用来接受easyui datagrid分页传过来的参数
	private int page;
	private int rows;
	//用来获取ajax传过来的参数
	private String staffId;
	private Staff staff;
	/**
	 * 查询职工信息
	 * @return null
	 * @throws IOException
	 */
	public String getStaffs() throws IOException{System.out.println(staff);
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		List<Staff> staffs=service.getStaffs(staff);
		List<Staff> list=new ArrayList<>();
		Map<String,Object> map=new HashMap<>();
		int start=(page-1)*rows;
		Staff staff=null;
		int count=0;
		if((staffs.size()-start)<rows){
			count =staffs.size()-start;
		}else{
			count =rows;
		}
		for(int i=0;i<count;i++){
			staff=staffs.get(start+i);
			list.add(staff);		
		}   
		PrintWriter out =ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", staffs.size());
		JSONObject jsonObject =JSONObject.fromObject(map);
		out.println(jsonObject);
		out.flush();
		
		return null;
	};
	
	/**
	 * 删除职工信息
	 * @return null
	 */
	public String deleteStaff(){
		if("".equals(staff.getStaffId())){
			return null;
		}
		service.deleteStaff(staff);
		return null;
	}
	
	
	
	/**
	 * 修改职工信息
	 * @return	null
	 */
	public String updateStaff(){
		if("".equals(staff.getStaffId())){
			return null;
		}
		service.updateStaff(staff);
		return null;
	}
	/**
	 * 增加一名职工信息
	 * @return null
	 */
	public String addStaff(){
		service.addStaff(staff);	
		return null;
	}
	/**
	 * 获取全部的job信息
	 * @return null
	 * @throws IOException
	 */
	public String getJobs() throws IOException {
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		List<Job> jobs=service.getJobs();
		PrintWriter out =ServletActionContext.getResponse().getWriter();
		JSONArray jsonArray =JSONArray.fromObject(jobs);
		out.println(jsonArray);
		out.flush();
		return null;
	}
	
	public IStaffService getService() {
		return service;
	}

	public void setService(IStaffService service) {
		this.service = service;
	}

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


	public String getStaffId() {
		return staffId;
	}


	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}


	public Staff getStaff() {
		return staff;
	}


	public void setStaff(Staff staff) {
		this.staff = staff;
	}


	


	
	

	
	
}
