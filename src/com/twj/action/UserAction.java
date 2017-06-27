package com.twj.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.sun.net.httpserver.HttpContext;
import com.twj.Enum.CAState;
import com.twj.Enum.UserType;
import com.twj.base.BaseAction;
import com.twj.entity.User;
import com.twj.service.UserService;
@Scope("prototype")
@Component
@Action(value="UserAction",results={
		@Result(name="login", location="/login.jsp"),
		@Result(name="success" ,type="redirectAction",location="CABookAction!selectdef.action"),
		@Result(name="admin" ,type="redirectAction",location="CABookAction!adminQueryNoParams.action")
})
public class UserAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService userService;
	private User user;
	private String UName;
	private String UPsd;
	private String UType;

	private Map<String, Object> session;
	//注册
	public String register(){
		if (UName==null&&UPsd==null&&UType==null) {
			return "register";
		}
		else {
			user=new User();
			user.setUName(UName);
			user.setUPsd(UPsd);
			user.setUType(UType);
			System.out.println("------------------"+UType+UserType.valueOf(1).getDiscribe()+"----------------");
			userService.register(user);
		      User logUser=	userService.login(UName, UPsd);
			session=ActionContext.getContext().getSession();
			if (UType.equals(UserType.valueOf(1).getDiscribe())) {
				session.put("ptUser",logUser);
				return "login";
			}else {
				session.put("admin",logUser);
				return "login";
			}
			
		}
	}
	//登陆
	private User loginuser=new User();
	public String login(){
		System.out.println("--------->>"+UName+UPsd);
		if (UName==null&&UPsd==null) {
			return "login";
		}
		else {
			 loginuser=userService.login(UName, UPsd);
			if (null==loginuser) {
            return  "login";
			}
			session=ActionContext.getContext().getSession();
			if (loginuser.getUType().equals(UserType.valueOf(1).getDiscribe())) {
				session.put("ptUser", loginuser);
				return "success";
			}
			session.put("admin", loginuser);
			return "admin";
		}
	}

	
	public User getLoginuser() {
		return loginuser;
	}

	public void setLoginuser(User loginuser) {
		this.loginuser = loginuser;
	}
	
	public String getUName() {
		return UName;
	}

	public void setUName(String uName) {
		UName = uName;
	}

	public String getUPsd() {
		return UPsd;
	}

	public void setUPsd(String uPsd) {
		UPsd = uPsd;
	}

	public String getUType() {
		return UType;
	}

	public void setUType(String uType) {
		UType = uType;
	}

}
