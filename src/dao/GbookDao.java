package dao;

import java.util.List;

import model.Gbook;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
@SuppressWarnings("unchecked")
public class GbookDao extends BaseDao{

	//��ȡ�б�
	public List<Gbook> getList(int i, int size) {
		return getSession().createQuery("from Gbook order by id desc").setFirstResult(i).setMaxResults(size).list();
	}
	
	//��ȡ�б�
	public List<Gbook> getUserList(int i, int size) {
		return getSession().createQuery("from Gbook where type=1 order by id desc").setFirstResult(i).setMaxResults(size).list();
	}
	
	//��ȡ�б�
	public List<Gbook> getTraderList(int i, int size) {
		return getSession().createQuery("from Gbook where type=2 order by id desc").setFirstResult(i).setMaxResults(size).list();
	}

	//����id��ȡ
	public Gbook getGbook(int id) {
		return (Gbook) getSession().get(Gbook.class, id);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Gbook").uniqueResult().toString());
	}
	
	// ��ȡ��¼����
	public int getUserTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Gbook where type=1").uniqueResult().toString());
	}
	
	// ��ȡ��¼����
	public int getTraderTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Gbook where type=2").uniqueResult().toString());
	}
}
