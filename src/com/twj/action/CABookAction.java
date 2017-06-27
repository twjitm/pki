package com.twj.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.twj.Enum.CAState;
import com.twj.base.BaseAction;
import com.twj.entity.Cabook;
import com.twj.entity.User;
import com.twj.service.CABookService;
import com.twj.service.UserService;
@Scope("prototype")
@Component
@Action(value="CABookAction",results={
		@Result(name="login", location="/login.jsp"),
		@Result(name="success" ,type="redirectAction" ,location="CABookAction!select.action"),
		@Result(name="select" ,location="/ptuserselectcabook.jsp"),
		@Result(name="adminselect" ,location="/adminselect.jsp"),
		@Result(name="cainfo" ,location="/cabookinfo.jsp"),
		@Result(name="getbookcar" ,type="redirectAction",location="CABookAction!adminQueryNoParams.action")
})
public class CABookAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private CABookService cABookService;
	@Autowired 
	private UserService userService;
	private Cabook cabook;
	private String caCn;
	private String caOu;
	private String caO;
	private String caL;
	private String caSt;
	private String caC;
	private String caStorepass;
	private String caKeypass;
	private String caUrl;
	private Integer UId;
	private String caStart;
	private List<Cabook> list=new ArrayList<Cabook>();
	private User user=new User();
	//-------该写证书的啦
	//普通用户申请证书
	public String apply(){
		user=(User) ActionContext.getContext().getSession().get("ptUser");
		if (null==user) {
			System.out.println("--------------null---------");
			return "login";
		}else {
			cabook=new Cabook();
			cabook.setCaC(caC);
			cabook.setCaCn(caCn);
			cabook.setUId(user.getUId());
			cabook.setCaKeypass(caKeypass);
			cabook.setCaL(caL);
			cabook.setCaO(caO);
			cabook.setCaOu(caOu);
			cabook.setCaSt(caSt);
			cabook.setCaStart(CAState.NOPASS.getDiscribe());
			cabook.setCaStorepass(caStorepass);
			Date d=new Date();
			SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
			String url=f.format(d);
			caUrl="d:/"+user.getUName()+url+".keystore";
			cabook.setCaUrl(caUrl);
			cABookService.Save(cabook);
			genkey();
			return "success";	
		}
	}

	//普通用户默认查询
	public String selectdef(){
		user=(User) ActionContext.getContext().getSession().get("ptUser");
		list.clear();
		list=cABookService.getBooKById(user.getUId());
		return "select";
	} 
	private String caselecttype;
	//普通用户按状态查询
	public String select(){
		user=(User) ActionContext.getContext().getSession().get("ptUser");
		list.clear();
		list=cABookService.getBookByUId(user.getUId(),caselecttype);
		return "select";
	} 
	private Integer downCaBookId;

	//---------------admin操作
	private  String adcaState;
	private List<Cabook>adcabooklist=new ArrayList<Cabook>();

	//管理员条件查询证书
	public void adminquery(){
		user=(User) ActionContext.getContext().getSession().get("admin");
		if (null==user) {
		//	return "login";
		}else {
			list.clear();
			list= cABookService.getBookByStart(adcaState);
		  	 writeJson(list);
		
			//return"adminselect";
		}
	}
	//管理员默认查询所有证书
	public String adminQueryNoParams(){
		user=(User) ActionContext.getContext().getSession().get("admin");
		if (null==user) {
			return "login";
		}else {
			list.clear();
			list= cABookService.getBookByStart();
			return"adminselect";
		}
	}
	//管理员查看证书详细信息
	public String adminselectCaInfor(){
		user=(User) ActionContext.getContext().getSession().get("admin");
		if (null==user) {
			return "login";
		}else {	
			cabook= cABookService.getCaBookById(caBookId);
			return"cainfo";
		}		
	}

	private Integer caBookId;
	//管理员签发证书
	public String adminsetCAbook(){
		user=(User) ActionContext.getContext().getSession().get("admin");
		if (null==user) {
			return "login";
		}else {	

			Cabook cabook= cABookService.getCaBookById(caBookId);
			System.out.println("------------>>"+cabook.getCaCn());

			export(cabook);
			return"getbookcar";
		}
	}
	//管理员删除证书
	public String deleteca(){
		Cabook cabook=cABookService.getCaBookById(caBookId);
		java.io.File file=new java.io.File(cabook.getCaUrl());
		cABookService.delete(cabook);
		if (file.exists())
			file.delete();
		return "getbookcar";

	}

	public String downloadFile(){
		return SUCCESS;
	}

	//--------------证书下载
	public String getDownloadFile() {
		Cabook car=cABookService.getCaBookById(downCaBookId);
		String inputPath=car.getCaUrl();
		if(inputPath!=null&&!"".equals(inputPath)){
			HttpServletResponse response = ServletActionContext.getResponse();		
			response.setHeader("content-disposition", "attachment;filename=certificate" +car.getCaC()+inputPath.substring(inputPath.indexOf("."),inputPath.length()));
			byte[] buf = new byte[1000];
			FileInputStream fos = null;
			try {
				String file=car.getCaUrl();
				fos = new FileInputStream(file); 
				ServletOutputStream out = response.getOutputStream();
				while (fos.read(buf) != -1) {
					out.write(buf);
				}
				response.flushBuffer();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fos.close();
				} catch (Exception f) {
				}
			}
		}else{
			HttpServletResponse response = (HttpServletResponse) ActionContext
					.getContext().get(
							org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
			try {
				String message="还没有上传文件";
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.write(message);
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	//--------------------
	/** 
	 * 生成密钥 
	 */  
	public void genkey() {  
		String[] arstringCommand = new String[] {  
				"cmd ", "/k",  
				"start", // cmd Shell命令  
				"G:\\java\\jdk1.8.0_91\\bin\\keytool",  
				"-genkey", // -genkey表示生成密钥  
				"-validity", // -validity指定证书有效期(单位：天)，这里是36500天  
				"36500",  
				"-keysize",//     指定密钥长度  
				"1024",  
				"-alias", // -alias指定别名，这里是ss  
				"ss",  
				"-keyalg", // -keyalg 指定密钥的算法 (如 RSA DSA（如果不指定默认采用DSA）)  
				"RSA",  
				"-keystore", // -keystore指定存储位置，这里是d:/demo.keystore  
				caUrl,  
				"-dname",// CN=(名字与姓氏), OU=(组织单位名称), O=(组织名称), L=(城市或区域名称),  
				// ST=(州或省份名称), C=(单位的两字母国家代码)"  
				"CN=("+caCn+"), OU=("+caOu+"), O=("+caO+"), L=("+caL+"),ST=("+caSt+"), C=("+caC+")",  
				"-storepass", // 指定密钥库的密码(获取keystore信息所需的密码)  
				"123456",   
				"-keypass",// 指定别名条目的密码(私钥的密码)  
				caKeypass,   
				"-v"// -v 显示密钥库中的证书详细信息  
		};  

		execCommand(arstringCommand);  
	}  

	/** 
	 * 管理员 导出证书文件 
	 */  
	public void export(Cabook cabook) {  
		User user= userService.getUserById(cabook.getUId());
		String url="d:/"+user.getUName()+cabook.getCaId()+".cer";
		String[] arstringCommand = new String[] {  

				"cmd ", "/k",  
				"start", // cmd Shell命令  
				"G:\\java\\jdk1.8.0_91\\bin\\keytool",  
				"-export", // - export指定为导出操作   
				"-keystore", // -keystore指定keystore文件，这里是d:/demo.keystore  
				cabook.getCaUrl(),  
				"-alias", // -alias指定别名，这里是ss  
				"ss",  
				"-file",//-file指向导出路径  
				"d:/"+user.getUName()+cabook.getCaId()+".cer",  
				"-storepass",// 指定密钥库的密码  
				"123456"  
		};  
		execCommand(arstringCommand);  
		cabook.setCaStart(CAState.PASS.getDiscribe());
		cabook.setCaUrl(url);
		cABookService.updata(cabook);

	}  

	public void execCommand(String[] arstringCommand) { 
		for (int i = 0; i < arstringCommand.length; i++) {  
			System.out.print(arstringCommand[i] + " ");  
		}  
		try {  
			Runtime.getRuntime().exec(arstringCommand);  

		} catch (Exception e) {  
			System.out.println(e.getMessage());  
		}  
	}  

	public void execCommand(String arstringCommand) {  
		try {  
			Runtime.getRuntime().exec(arstringCommand);  

		} catch (Exception e) {  
			System.out.println(e.getMessage());  
		}  
	}  



	public String getCaselecttype() {
		return caselecttype;
	}

	public void setCaselecttype(String caselecttype) {
		this.caselecttype = caselecttype;
	}

	public List<Cabook> getAdcabooklist() {
		return adcabooklist;
	}

	public void setAdcabooklist(List<Cabook> adcabooklist) {
		this.adcabooklist = adcabooklist;
	}

	public String getAdcaState() {
		return adcaState;
	}

	public void setAdcaState(String adcaState) {
		this.adcaState = adcaState;
	}
	public String getCaCn() {
		return caCn;
	}
	public void setCaCn(String caCn) {
		this.caCn = caCn;
	}

	public String getCaOu() {
		return caOu;
	}
	public void setCaOu(String caOu) {
		this.caOu = caOu;
	}


	public String getCaO() {
		return caO;
	}

	public void setCaO(String caO) {
		this.caO = caO;
	}
	public String getCaL() {
		return caL;
	}
	public void setCaL(String caL) {
		this.caL = caL;
	}

	public String getCaSt() {
		return caSt;
	}
	public void setCaSt(String caSt) {
		this.caSt = caSt;
	}
	public String getCaC() {
		return caC;
	}

	public void setCaC(String caC) {
		this.caC = caC;
	}
	public Integer getCaBookId() {
		return caBookId;
	}

	public void setCaBookId(Integer caBookId) {
		this.caBookId = caBookId;
	}
	public String getCaStorepass() {
		return caStorepass;
	}
	public void setCaStorepass(String caStorepass) {
		this.caStorepass = caStorepass;
	}
	public String getCaKeypass() {
		return caKeypass;
	}
	public void setCaKeypass(String caKeypass) {
		this.caKeypass = caKeypass;
	}

	public String getCaUrl() {
		return caUrl;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setCaUrl(String caUrl) {
		this.caUrl = caUrl;
	}
	public Integer getUId() {
		return UId;
	}
	public void setUId(Integer uId) {
		UId = uId;
	}
	public String getCaStart() {
		return caStart;
	}
	public void setCaStart(String caStart) {
		this.caStart = caStart;
	}
	public List<Cabook> getList() {
		return list;
	}
	public void setList(List<Cabook> list) {
		this.list = list;
	}
	public Integer getDownCaBookId() {
		return downCaBookId;
	}

	public void setDownCaBookId(Integer downCaBookId) {
		this.downCaBookId = downCaBookId;
	}
	public Cabook getCabook() {
		return cabook;
	}
	public void setCabook(Cabook cabook) {
		this.cabook = cabook;
	}
}
