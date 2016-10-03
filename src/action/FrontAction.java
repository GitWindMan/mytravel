package action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import model.Gbook;
import model.News;
import model.Note;
import model.Place;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.GbookService;
import service.NewsService;
import service.NoteService;
import service.PlaceService;
import util.UploadUtil;

@Action("front")
@Results({
	@Result(name="index",location="/front/index.jsp"),
	@Result(name="placeList",location="/front/place.jsp"),
	@Result(name="newsList",location="/front/news.jsp"),
	@Result(name="noteList",location="/front/note.jsp"),
	@Result(name="gbookList",location="/front/gbook.jsp"),
	@Result(name="weatherAndroute",location="/front/weatherAndroute.jsp"),
	@Result(name="placeIntro",location="/front/pages/place-intro.jsp"),
	@Result(name="newsIntro",location="/front/pages/news-intro.jsp"),
	@Result(name="noteIntro",location="/front/pages/note-intro.jsp"),
	@Result(name="placeSelf",location="/front/pages/place-self.jsp"),
	@Result(name="newsSelf",location="/front/pages/news-self.jsp"),
	@Result(name="noteSelf",location="/front/pages/note-self.jsp"),
	@Result(name="leaveSelf",location="/front/pages/leave-self.jsp"),
	@Result(name="placeEdit",location="/front/pages/place-edit.jsp"),
	@Result(name="newsEdit",location="/front/pages/news-edit.jsp"),
	@Result(name="noteEdit",location="/front/pages/note-edit.jsp"),
})
@SuppressWarnings("serial")
public class FrontAction extends BaseAction{
	
	private int userid;
	private Place place;
	private News news;
	private Note note;
	private Gbook gbook;
	private List<Place> places;
	private List<News> newses;
	private List<Note> notes;
	private List<Gbook> gbooks;
	@Resource
	private PlaceService placeService;
	@Resource
	private NewsService newsService;
	@Resource
	private NoteService noteService;
	@Resource
	private GbookService gbookService;
	
	private File photo;		//��ȡ�ϴ��ļ�
    private String photoFileName;	//��ȡ�ϴ��ļ����

    
    // ��ҳ
    public String index(){
    	places = placeService.getIndexList(4);
    	newses = newsService.getIndexList(4);
    	notes = noteService.getIndexList(4);
    	return "index";
    }
    
	// �����б�
	public String placeList(){
		places = placeService.getPlaceList((page-1)*size, size);
		pages = getPages(placeService.getTotal(), size);
		return "placeList";
	}
	
	// �Ż��б�
	public String newsList(){
		newses = newsService.getNewsList((page-1)*size, size);
		pages = getPages(newsService.getTotal(), size);
		return "newsList";
	}
	
	// �μ��б�
	public String noteList(){
		notes = noteService.getNoteList((page-1)*size, size);
		pages = getPages(noteService.getTotal(), size);
		return "noteList";
	}
	
	// �����б�
	public String gbookList(){
		gbooks = gbookService.getList((page-1)*size, size);
		pages = getPages(gbookService.getTotal(), size);
		return "gbookList";
	}
	
	// �������
	public String placeIntro(){
		place = placeService.getPlace(place.getId());
		return "placeIntro";
	}
	
	// �Żݽ���
	public String newsIntro(){
		news = newsService.getNews(news.getId());
		return "newsIntro";
	}
	
	// �μǽ���
	public String noteIntro(){
		note = noteService.getNote(note.getId());
		return "noteIntro";
	}
	
	// �ҵ��Ż�
	public String newsSelf(){
		newses = newsService.getNewsSelf(userid,(page-1)*size, size);
		pages = getPages(newsService.getTotalSelf(userid), size);
		return "newsSelf";
	}
	
	// �ҵ��μ�
	public String noteSelf(){
		notes = noteService.getNoteSelf(userid,(page-1)*size, size);
		pages = getPages(noteService.getTotalSelf(userid), size);
		return "noteSelf";
	}
	
	// ����Ż�
	public String newsAdd(){
		if (photo != null) {
			news.setPhoto(UploadUtil.upload(photo, photoFileName, "front/photo/news/").substring("front/".length()));
		}
		newsService.add(news);
		return newsSelf();
	}
	
	// ����μ�
	public String noteAdd(){
		if (photo != null) {
			note.setPhoto(UploadUtil.upload(photo, photoFileName, "front/photo/note/").substring("front/".length()));
		}
		noteService.add(note);
		return noteSelf();
	}

	// �������
	public String gbookAdd(){
		gbookService.add(gbook);
		return gbookList();
	}

	// ɾ���Ż�
	public String newsDrop(){
		newsService.delete(news);
		return newsSelf();
	}
	
	// ɾ���μ�
	public String noteDrop(){
		noteService.delete(note);
		return noteSelf();
	}
	
	// �༭�Ż�
	public String newsEdit(){
		news = newsService.getNews(news.getId());
		return "newsEdit";
	}
	
	// �༭�μ�
	public String noteEdit(){
		note = noteService.getNote(note.getId());
		return "noteEdit";
	}
	
	// �����Ż�
	public String newsSave(){
		if (photo != null) {
			news.setPhoto(UploadUtil.upload(photo, photoFileName, "front/photo/news/").substring("front/".length()));
		}
		newsService.update(news);
		return newsSelf();
	}
	
	// �����μ�
	public String noteSave(){
		if (photo != null) {
			note.setPhoto(UploadUtil.upload(photo, photoFileName, "front/photo/note/").substring("front/".length()));
		}
		noteService.update(note);
		return noteSelf();
	}
	
	
	public List<News> getNewses() {
		return newses;
	}
	public void setNewses(List<News> newses) {
		this.newses = newses;
	}
	public List<Note> getNotes() {
		return notes;
	}
	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public Note getNote() {
		return note;
	}
	public void setNote(Note note) {
		this.note = note;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	public Gbook getGbook() {
		return gbook;
	}
	public void setGbook(Gbook gbook) {
		this.gbook = gbook;
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
	public List<Gbook> getGbooks() {
		return gbooks;
	}
	public void setGbooks(List<Gbook> gbooks) {
		this.gbooks = gbooks;
	}

}
