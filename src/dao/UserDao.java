package dao;

import java.util.List;

import model.User;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
@SuppressWarnings("unchecked")
public class UserDao extends BaseDao{


	//�����û�������������û�
	public User getUser(String username, String password) {
		return (User) getSession().createQuery("from User where username=:username and password=:password")
				.setParameter("username", username).setParameter("password", password).uniqueResult();
	}
	
	//�����û��������û�
	public User getUser(String username) {
		return (User) getSession().createQuery("from User where username=:username")
				.setParameter("username", username).uniqueResult();
	}

	//��ȡ�����û���Ϣ
	public List<User> getUserList(int i, int size) {
		return getSession().createQuery("from User").setFirstResult(i).setMaxResults(size).list();
	}

	//����id��ȡ�û���Ϣ
	public User getUser(int id) {
		return (User) getSession().get(User.class, id);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from User").uniqueResult().toString());
	}
}
