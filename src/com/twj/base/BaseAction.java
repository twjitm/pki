package com.twj.base;

import java.applet.AppletContext;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;


@ParentPackage("default")
@Namespace("/")
@Scope("prototype")
public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 5468737591027540687L;

	/**
	 * 将对象转换成JSON字符串，并响应回前台()
	 * 
	 * @param object
	 * @throws IOException
	 */
	public void writeJson(Object object) {
		try {

			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm");
			ServletActionContext.getRequest().getSession();
			ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");

			ServletActionContext.getResponse().getWriter().write(json);
			ServletActionContext.getResponse().getWriter().flush();
			ServletActionContext.getResponse().getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param object
	 */
	public void writeJsonOut(Object object){
		OutputStream outputStream=null;
		String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm");
		ServletActionContext.getRequest().getSession();
		ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
		HttpServletResponse response = ServletActionContext.getResponse();
		byte[] jsonby;
		try {
			jsonby = json.toString().getBytes("utf-8");
			response.setContentLength(jsonby.length);
			outputStream=response.getOutputStream();
			outputStream.write(jsonby);
			outputStream.flush();
			outputStream.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	/**
	 * 参数是已经封装好的json集合
	 * @param map
	 */
	public void	writeJson(Map<String, Object>map) {
		OutputStream outputStream=null;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpServletResponse response = ServletActionContext.getResponse();
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/json;charset=utf-8");
			request.getSession();
			byte[] jsonby=map.toString().getBytes("utf-8");
			response.setContentLength(jsonby.length);
			outputStream=response.getOutputStream();

			outputStream.write(jsonby);
			outputStream.flush();
			outputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (outputStream!=null) {
				try {
					outputStream.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}


}
