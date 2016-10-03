package dao;

import model.Admin;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
public class AdminDao extends BaseDao{

	//�����û�������������û�
	public Admin getAdmin(String username, String password) {
		return (Admin) getSession().createQuery("from Admin where username=:username and password=:password")
				.setParameter("username", username).setParameter("password", password).uniqueResult();
	}
	
	
}
