package com.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.bean.Schedule;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IScheduleService;
import com.util.JsonDateValueProcessor;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
public class ScheduleManagerAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IScheduleService service;
	private int page;
	private int rows;
	private Schedule schedule;
	public IScheduleService getService() {
		return service;
	}
	public void setService(IScheduleService service) {
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
	public String getSchedules() throws IOException {
		System.out.println("OK");
		List<Schedule> lists = service.getSchedules(schedule);
		System.out.println(lists.size());
		List<Schedule> list = new ArrayList<Schedule>();
		Map<String, Object> map = new HashMap<>();
		int start = (page - 1) * rows;
		Schedule schedule = null;
		int count = ((lists.size() - start) < rows) ? (lists.size() - start) : rows;
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.registerJsonValueProcessor(java.util.Date.class, new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		for (int i = 0; i < count; i++) {
			schedule = lists.get(i + start);
			list.add(schedule);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		System.out.println(list.size());
		JSONObject object = JSONObject.fromObject(map, config);
		writer.println(object);
		writer.flush();
		System.out.println("YES");
		return null;
	}
	public String updateSchedule(){
		service.updateSchedule(schedule);
		return null;	
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
}
