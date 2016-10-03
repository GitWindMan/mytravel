package dao;

import java.util.List;

import model.News;

import org.springframework.stereotype.Repository;

@Repository//注册spring管理bean
@SuppressWarnings("unchecked")
public class NewsDao extends BaseDao{

	//获取列表
	public List<News> getNewsList(int i, int size) {
		return getSession().createQuery("from News").setFirstResult(i).setMaxResults(size).list();
	}

	//根据id获取
	public News getNews(int id) {
		return (News) getSession().get(News.class, id);
	}

	//我的优惠
	public List<News> getNewsList(int traderid, int i, int size) {
		return getSession().createQuery("from News where trader_id=:tarderid").setInteger("tarderid", traderid).setFirstResult(i).setMaxResults(size).list();
	}

	//获取首页需要数据
	public List<News> getIndexList(int count) {
		return getSession().createQuery("from News").setMaxResults(count).list();
	}

	// 获取记录总数
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from News").uniqueResult().toString());
	}

	// 获取记录总数
	public int getTotalSelf(int traderid) {
		return Integer.parseInt(getSession().createQuery("select count(*) from News where trader_id=:tarderid").setInteger("tarderid", traderid).uniqueResult().toString());
	}
}
