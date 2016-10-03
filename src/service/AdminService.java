package service;

import javax.annotation.Resource;

import model.Admin;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AdminDao;

@Service	// 注解为spring管理bean
@Transactional	//配置此方法加入事务管理
public class AdminService {

	@Resource
	private AdminDao adminDao;

	//通过用户名和密码获取
	public Admin getAdmin(String username, String password) {
		return adminDao.getAdmin(username, password);
	}
	
}
