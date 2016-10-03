package dao;

import java.util.List;

import model.Place;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
@SuppressWarnings("unchecked")
public class PlaceDao extends BaseDao{

	//��ȡ�б�
	public List<Place> getPlaceList(int i, int size) {
		return getSession().createQuery("from Place").setFirstResult(i).setMaxResults(size).list();
	}

	//����id��ȡ
	public Place getPlace(int id) {
		return (Place) getSession().get(Place.class, id);
	}

	//��ȡ��ҳ��Ҫ����
	public List<Place> getIndexList(int count) {
		return getSession().createQuery("from Place").setMaxResults(count).list();
	}

	// ��ȡ��¼����
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Place").uniqueResult().toString());
	}
	
}
