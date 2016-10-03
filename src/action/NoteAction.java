package action;

import java.util.List;

import javax.annotation.Resource;

import model.Note;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import service.NoteService;

@Action("note")
@Results({
	@Result(name="list",location="/admin/pages/note-list.jsp"),
	@Result(name="update",location="/admin/pages/note-update.jsp"),
})
@SuppressWarnings("serial")
public class NoteAction extends BaseAction{
	
	private Note note;
	private List<Note> notes;
	@Resource
	private NoteService noteService;
	
	
	//获取列表
	public String list(){
		notes = noteService.getNoteList((page-1)*size, size);
		pages = getPages(noteService.getTotal(), size);
		return "list";
	}
	
	//添加
	public String add(){
		noteService.add(note);
		return list();
	}	
	
	//更新页面
	public String updatePage(){
		note = noteService.getNote(note.getId());
		return "update";
	}
	
	//更新
	public String update(){
		noteService.update(note);
		return list();
	}
	
	//删除
	public String delete(){
		noteService.delete(note);
		return list();
	}

	
	
	public Note getNote() {
		return note;
	}

	public void setNote(Note note) {
		this.note = note;
	}

	public List<Note> getNotes() {
		return notes;
	}

	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}


}
