package service;

import java.util.List;

import javax.annotation.Resource;

import model.Trader;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.TraderDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class TraderService {

	@Resource
	private TraderDao traderDao;


	//��ȡ����
	public List<Trader> getTraderList(int i, int size) {
		return traderDao.getTraderList(i, size);
	}

	// ͨ���û�����ȡ
	public Trader getTrader(String username) {
		return traderDao.getTrader(username);
	}
	
	// ͨ���û����������ȡ
	public Trader getTrader(String username, String password) {
		return traderDao.getTrader(username,password);
	}
	
	//����id��ȡ
	public Trader getTrader(int id) {
		return traderDao.getTrader(id);
	}

	//����
	public boolean update(Trader trader) {
		return traderDao.update(trader);
	}

	//ɾ��
	public boolean delete(Trader trader) {
		return traderDao.delete(trader);
	}

	//���
	public boolean add(Trader trader) {
		return traderDao.save(trader);
	}

	//����
	public void forbid(int traderid) {
		Trader trader = traderDao.getTrader(traderid);
		trader.setStatus(1);
		traderDao.update(trader);
	}

	// ���
	public void check(int traderid) {
		Trader trader = traderDao.getTrader(traderid);
		trader.setStatus(0);
		traderDao.update(trader);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return traderDao.getTotal();
	}
}
