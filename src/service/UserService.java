package service;

import java.util.List;

import javax.annotation.Resource;

import model.User;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class UserService {

	@Resource
	private UserDao userDao;

	//ͨ���û����������ȡ
	public User getUser(String username, String password) {
		return userDao.getUser(username, password);
	}
	
	//ͨ���û�����ȡ
	public User getUser(String username) {
		return userDao.getUser(username);
	}
	
	//��ȡ����
	public List<User> getUserList(int i, int size) {
		return userDao.getUserList(i, size);
	}

	//����id��ȡ
	public User getUser(int id) {
		return userDao.getUser(id);
	}

	//����
	public boolean update(User user) {
		return userDao.update(user);
	}

	//ɾ��
	public boolean delete(User user) {
		return userDao.delete(user);
	}

	//���
	public boolean add(User user) {
		return userDao.save(user);
	}

	//����
	public void forbid(int userid) {
		User user = userDao.getUser(userid);
		user.setStatus(1);
		userDao.update(user);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return userDao.getTotal();
	}
}
