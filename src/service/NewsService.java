package service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import model.News;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.NewsDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class NewsService {

	@Resource
	private NewsDao newsDao;


	//��ȡ����
	public List<News> getNewsList(int i, int size) {
		return newsDao.getNewsList(i, size);
	}

	//����id��ȡ
	public News getNews(int id) {
		return newsDao.getNews(id);
	}

	//����
	public boolean update(News news) {
		news.setCreatetime(new Date());
		return newsDao.update(news);
	}

	//ɾ��
	public boolean delete(News news) {
		return newsDao.delete(news);
	}

	//���
	public boolean add(News news) {
		news.setCreatetime(new Date());
		return newsDao.save(news);
	}

	//�ҵ��Ż�
	public List<News> getNewsSelf(int traderid, int i, int size) {
		return newsDao.getNewsList(traderid, i, size);
	}

	//��ȡ��ҳ��Ҫ����
	public List<News> getIndexList(int count) {
		return newsDao.getIndexList(count);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return newsDao.getTotal();
	}
	
	// ��ȡ��¼����
	public int getTotalSelf(int traderid) {
		return newsDao.getTotalSelf(traderid);
	}
}
