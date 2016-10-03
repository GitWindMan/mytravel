package dao;

import java.util.List;

import model.News;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
@SuppressWarnings("unchecked")
public class NewsDao extends BaseDao{

	//��ȡ�б�
	public List<News> getNewsList(int i, int size) {
		return getSession().createQuery("from News").setFirstResult(i).setMaxResults(size).list();
	}

	//����id��ȡ
	public News getNews(int id) {
		return (News) getSession().get(News.class, id);
	}

	//�ҵ��Ż�
	public List<News> getNewsList(int traderid, int i, int size) {
		return getSession().createQuery("from News where trader_id=:tarderid").setInteger("tarderid", traderid).setFirstResult(i).setMaxResults(size).list();
	}

	//��ȡ��ҳ��Ҫ����
	public List<News> getIndexList(int count) {
		return getSession().createQuery("from News").setMaxResults(count).list();
	}

	// ��ȡ��¼����
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from News").uniqueResult().toString());
	}

	// ��ȡ��¼����
	public int getTotalSelf(int traderid) {
		return Integer.parseInt(getSession().createQuery("select count(*) from News where trader_id=:tarderid").setInteger("tarderid", traderid).uniqueResult().toString());
	}
}
