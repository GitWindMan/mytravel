package action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * action���� ��ҳ����
 * @author YJ
 */
public class BaseAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	protected int page = 1;	// ��ǰҳ��
	protected int pages = 1;	// ��ҳ��
	protected int size = 5;	// ÿҳ��¼��
	
	protected int getPages(int total, int size) {
		return total%size==0 ? total/size : total/size+1;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}

}
