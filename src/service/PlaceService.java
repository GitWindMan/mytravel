package service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import model.Place;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.PlaceDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class PlaceService {

	@Resource
	private PlaceDao placeDao;


	//��ȡ����
	public List<Place> getPlaceList(int i, int size) {
		return placeDao.getPlaceList(i, size);
	}

	//����id��ȡ
	public Place getPlace(int id) {
		return placeDao.getPlace(id);
	}

	//����
	public boolean update(Place news) {
		news.setCreatetime(new Date());
		return placeDao.update(news);
	}

	//ɾ��
	public boolean delete(Place news) {
		return placeDao.delete(news);
	}

	//���
	public boolean add(Place news) {
		news.setCreatetime(new Date());
		return placeDao.save(news);
	}

	//��ȡ��ҳ��Ҫ����
	public List<Place> getIndexList(int count) {
		return placeDao.getIndexList(count);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return placeDao.getTotal();
	}

}
