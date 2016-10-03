package dao;

import java.util.List;

import model.Trader;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
@SuppressWarnings("unchecked")
public class TraderDao extends BaseDao{

	//��ȡ�б�
	public List<Trader> getTraderList(int i, int size) {
		return getSession().createQuery("from Trader").setFirstResult(i).setMaxResults(size).list();
	}

	//����id��ȡ
	public Trader getTrader(int id) {
		return (Trader) getSession().get(Trader.class, id);
	}

	//�����û�����ȡ
	public Trader getTrader(String username) {
		return (Trader) getSession().createQuery("from Trader where username=:username").setString("username", username).uniqueResult();
	}
	
	//�����û����������ȡ
	public Trader getTrader(String username, String password) {
		return (Trader) getSession().createQuery("from Trader where username=:username and password=:password").setString("username", username).setString("password", password).uniqueResult();
	}

	// ��ȡ��¼����
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Trader").uniqueResult().toString());
	}
}
