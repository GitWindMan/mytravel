package service;

import javax.annotation.Resource;

import model.Admin;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.AdminDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class AdminService {

	@Resource
	private AdminDao adminDao;

	//ͨ���û����������ȡ
	public Admin getAdmin(String username, String password) {
		return adminDao.getAdmin(username, password);
	}
	
}
