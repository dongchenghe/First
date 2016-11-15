package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.bean.Job;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IJobService;
import net.sf.json.JSONObject;
public class JobManagerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IJobService service;
	private int page;
	private int rows;
	private Job job;
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


	public IJobService getService() {
		return service;
	}
	public void setService(IJobService service) {
		this.service = service;
	}
	public String getJobs() throws IOException{
		System.out.println(job);
		List<Job> lists=service.getJobs(job);
		List<Job> list=new ArrayList<Job>();
		Map<String, Object> map=new HashMap<>();
		int start=(page-1)*rows;
		Job job=null;
		int count=((lists.size()-start)<rows)?(lists.size()-start):rows;
	
		for(int i=0;i<count;i++){
			job=lists.get(i+start);
			list.add(job);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer=ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		JSONObject object=JSONObject.fromObject(map);
		writer.println(object);
		return null;
	}
	public String addJob(){
		service.addJob(job);
		return null;		
	}
	public String updateJob(){
		service.updateJob(job);
		return null;		
	}
	public String deleteJob(){
		service.deleteJob(job);
		return null;		
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
}
