package action;

import java.util.List;

import javax.annotation.Resource;

import model.Trader;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.TraderService;
import util.MD5Util;

@Action("trader")
@Results({
	@Result(name="list",location="/admin/pages/trader-list.jsp"),
	@Result(name="add",location="/admin/pages/trader-add.jsp"),
	@Result(name="update",location="/admin/pages/trader-update.jsp"),
})
@SuppressWarnings("serial")
public class TraderAction extends BaseAction{
	
	private Trader trader;
	private List<Trader> traders;
	@Resource
	private TraderService traderService;
	
	
	//��ȡ�б�
	public String list(){
		traders = traderService.getTraderList((page-1)*size, size);
		pages = getPages(traderService.getTotal(), size);
		return "list";
	}
	
	//���
	public String add(){
		if (traderService.getTrader(trader.getUsername()) == null) {
			try {
				trader.setPassword(MD5Util.md5Encode(trader.getPassword()));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			traderService.add(trader);
			return list();
		} else {
			addActionError("�û����Ѵ���");
			return "add";
		}
	}	
	
	//����ҳ��
	public String updatePage(){
		trader = traderService.getTrader(trader.getId());
		return "update";
	}
	
	//����
	public String update(){
		traderService.update(trader);
		return list();
	}
	
	//ɾ��
	public String delete(){
		traderService.delete(trader);
		return list();
	}

	//����
	public String forbid(){
		traderService.forbid(trader.getId());
		return list();
	}
	
	//���
	public String check(){
		traderService.check(trader.getId());
		return list();
	}
	
	
	public Trader getTrader() {
		return trader;
	}

	public void setTrader(Trader trader) {
		this.trader = trader;
	}

	public List<Trader> getTraders() {
		return traders;
	}

	public void setTraders(List<Trader> traders) {
		this.traders = traders;
	}


}
