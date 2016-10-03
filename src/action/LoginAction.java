package action;

import javax.annotation.Resource;

import model.Admin;
import model.Trader;
import model.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.AdminService;
import service.TraderService;
import service.UserService;
import util.MD5Util;

import com.opensymphony.xwork2.ActionContext;

@Action("login")
@Results({
	@Result(name="reg",location="/front/reg.jsp"),
	@Result(name="login",location="/front/login.jsp"),
	@Result(name="admin",location="/admin/login.jsp"),
	@Result(name="main",location="/admin/main.jsp"),
	@Result(name="bootStrapMain",location="/admin/bootStrapMain.jsp"),
	@Result(name="userSave",location="/front/self.jsp"),
	@Result(name="index", type="redirect", location="front!index.action"),
})
@SuppressWarnings("serial")
public class LoginAction extends BaseAction{
	
	private String username;
	private String password;
	private String repassword;
	private String phone;
	private String nickname;
	private String company;
	private int type;
	private User user;
	private Trader trader;
	@Resource
	private UserService userService;
	@Resource
	private TraderService traderService;
	@Resource
	private AdminService adminService;
	
	
	// �û���¼
	public String login(){
		//MD5����
		try {
			password = MD5Util.md5Encode(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("MD5����ʱ������������MD5����");
			addActionError("MD5����ʱ������������MD5����");
		}
		switch (type) {
		case 1:
			User user = userService.getUser(username, password);
			if (user == null) {
				addActionError("�û������������");
				return "login";
			}else {
				ActionContext.getContext().getSession().put("user", user);
				ActionContext.getContext().getSession().put("type", type);
				return "index";
			}
		case 2:
			Trader trader = traderService.getTrader(username, password);
			if (trader == null) {
				addActionError("�û������������");
				return "login";
			}else if (trader.getStatus()==2) {
				addActionError("���û���δͨ�����");
				return "login";
			}else {
				ActionContext.getContext().getSession().put("user", trader);
				ActionContext.getContext().getSession().put("type", type);
				return "index";
			}
		case 3:
			Admin admin = adminService.getAdmin(username, password);
			if (admin == null) {
				addActionError("�û������������");
				return "admin";
			}else {
				ActionContext.getContext().getSession().put("user", admin);
				//return "main";
				return "bootStrapMain";
			}
		}
		return null;
	}

	// �û�ע��
	public String reg(){
		if(username.equals("") || password.equals("")){
			addActionError("�û��������벻��Ϊ��");
			return "reg";
		}
		
		repassword = ServletActionContext.getRequest().getParameter("repassword");
//		System.out.println("password----"+password);
//		System.out.println("repassword----"+repassword);
		//�ȶ����������Ƿ���ͬ
		if(!password.equals(repassword)){
			addActionError("�����������벻��ȷ");
			return "reg";
		}
		
		// MD5����
		try {
			password = MD5Util.md5Encode(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("MD5����ʱ������������MD5����");
			addActionError("MD5����ʱ������������MD5����");
		}
		
		switch (type) {
		case 1:
			if (userService.getUser(username) == null) {
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setNickname(nickname);
				user.setPhone(phone);
				userService.add(user);
				addActionError("�û�ע��ɹ�");
				return "login";
			}else {
				addActionMessage("�û����Ѵ���");
				return "reg";
			}
		case 2:
			if (traderService.getTrader(username) == null) {
				Trader trader = new Trader();
				trader.setUsername(username);
				trader.setPassword(password);
				trader.setCompany(company);
				trader.setPhone(phone);
				trader.setStatus(2);
				traderService.add(trader);
				addActionError("�̻�ע��ɹ�");
				return "login";
			}else {
				addActionError("�û����Ѵ���");
				return "reg";
			}
		}
		return null;
	}
	
	/**
	 * �û�ע��
	 * @return
	 */
	public String logout(){
		ActionContext.getContext().getSession().remove("user");
		ActionContext.getContext().getSession().remove("type");
		return "login";
	}
	
	/**
	 * �����û�
	 * @return
	 */
	public String userSave(){
		if(type == 1){
			userService.update(user);
			ActionContext.getContext().getSession().put("user", user);
		}else if (type == 2) {
			traderService.update(trader);
			ActionContext.getContext().getSession().put("user", trader);
		}
		addActionMessage("�޸ĳɹ�");
		return "userSave";
	}
	
	

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Trader getTrader() {
		return trader;
	}
	public void setTrader(Trader trader) {
		this.trader = trader;
	}
	
}
