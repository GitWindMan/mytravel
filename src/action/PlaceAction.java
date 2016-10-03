package action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import model.Place;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.PlaceService;
import util.UploadUtil;

@Action("place")
@Results({
	@Result(name="list",location="/admin/pages/place-list.jsp"),
	@Result(name="update",location="/admin/pages/place-update.jsp"),
})
@SuppressWarnings("serial")
public class PlaceAction extends BaseAction{
	
	private Place place;
	private List<Place> places;
	@Resource
	private PlaceService placeService;
	
	private File photo;		//获取上传文件
    private String photoFileName;	//获取上传文件名称
	
	//获取列表
	public String list(){
		places = placeService.getPlaceList((page-1)*size, size);
		pages = getPages(placeService.getTotal(), size);
		return "list";
	}
	
	//添加
	public String add(){
		if (photo != null) {
			place.setPhoto(UploadUtil.upload(photo, photoFileName, "front/photo/place/").substring("front/".length()));
		}
		placeService.add(place);
		return list();
	}	
	
	//更新页面
	public String updatePage(){
		place = placeService.getPlace(place.getId());
		return "update";
	}
	
	//更新
	public String update(){
		if(photo != null){
			place.setPhoto(UploadUtil.upload(photo, photoFileName, "front/photo/place/").substring("front/".length()));
		}
		placeService.update(place);
		return list();
	}
	
	//删除
	public String delete(){
		placeService.delete(place);
		return list();
	}

	
	
	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public List<Place> getPlaces() {
		return places;
	}

	public void setPlaces(List<Place> places) {
		this.places = places;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}


}
