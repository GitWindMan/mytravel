package service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import model.Gbook;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.GbookDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class GbookService {

	@Resource
	private GbookDao gbookDao;


	//��ȡ�б�
	public List<Gbook> getList(int i, int size) {
		return gbookDao.getList(i, size);
	}
	
	//��ȡ�����û�����
	public List<Gbook> getUserList(int i, int size) {
		return gbookDao.getUserList(i, size);
	}
	
	//��ȡ�����̼�����
	public List<Gbook> getTraderList(int i, int size) {
		return gbookDao.getTraderList(i, size);
	}

	//����id��ȡ
	public Gbook getGbook(int id) {
		return gbookDao.getGbook(id);
	}

	//����
	public boolean update(Gbook gbook) {
		gbook.setCreatetime(new Date());
		return gbookDao.update(gbook);
	}

	//ɾ��
	public boolean delete(Gbook gbook) {
		return gbookDao.delete(gbook);
	}

	//���
	public boolean add(Gbook gbook) {
		gbook.setCreatetime(new Date());
		return gbookDao.save(gbook);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return gbookDao.getTotal();
	}
	
	// ��ȡ��¼����
	public int getUserTotal() {
		return gbookDao.getUserTotal();
	}
	
	// ��ȡ��¼����
	public int getTraderTotal() {
		return gbookDao.getTraderTotal();
	}
	
}
