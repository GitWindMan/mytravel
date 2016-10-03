package action;

import java.util.List;

import javax.annotation.Resource;

import model.Gbook;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.GbookService;

@Action("gbook")
@Results({
	@Result(name="list",location="/admin/pages/gbook-list.jsp"),
})
public class GbookAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	private Gbook gbook;
	private List<Gbook> gbooks;
	@Resource
	private GbookService gbookService;
	
	
	//获取用户留言列表
	public String userList(){
		gbooks = gbookService.getUserList((page-1)*size, size);
		pages = getPages(gbookService.getUserTotal(), size);
		return "list";
	}
	
	//获取商家留言列表
	public String traderList(){
		gbooks = gbookService.getTraderList((page-1)*size, size);
		pages = getPages(gbookService.getTraderTotal(), size);
		return "list";
	}
	
	//删除
	public String delete(){
		gbookService.delete(gbook);
		if(gbook.getType()==1){
			return userList();
		}else{
			return traderList();
		}
	}

	
	
	public Gbook getGbook() {
		return gbook;
	}
	public void setGbook(Gbook gbook) {
		this.gbook = gbook;
	}
	public List<Gbook> getGbooks() {
		return gbooks;
	}
	public void setGbooks(List<Gbook> gbooks) {
		this.gbooks = gbooks;
	}

}
