package action;

import java.util.List;

import javax.annotation.Resource;

import model.User;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.UserService;
import util.MD5Util;

@Action("user")
@Results({
	@Result(name="list",location="/admin/pages/user-list.jsp"),
	@Result(name="add",location="/admin/pages/user-add.jsp"),
	@Result(name="update",location="/admin/pages/user-update.jsp"),
})
@SuppressWarnings("serial")
public class UserAction extends BaseAction{
	
	private User user;
	private List<User> users;
	@Resource
	private UserService userService;
	
	
	//获取列表
	public String list(){
		users = userService.getUserList((page-1)*size, size);
		pages = getPages(userService.getTotal(), size);
		return "list";
	}

	//添加
	public String add(){
		if (userService.getUser(user.getUsername()) == null) {
			try {
				user.setPassword(MD5Util.md5Encode(user.getPassword()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("添加用户转换密文时出错");
			}
			userService.add(user);
			return list();
		} else {
			addActionError("用户名已存在");
			return "add";
		}
	}	
	
	//更新页面
	public String updatePage(){
		user = userService.getUser(user.getId());
		return "update";
	}
	
	//更新
	public String update(){
		userService.update(user);
		return list();
	}
	
	//删除
	public String delete(){
		userService.delete(user);
		return list();
	}

	//禁言
	public String forbid(){
		userService.forbid(user.getId());
		return list();
	}
	

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}
