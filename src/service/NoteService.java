package service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import model.Note;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.NoteDao;

@Service	// ע��Ϊspring����bean
@Transactional	//���ô˷��������������
public class NoteService {

	@Resource
	private NoteDao noteDao;


	//��ȡ����
	public List<Note> getNoteList(int i, int size) {
		return noteDao.getNoteList(i, size);
	}

	//����id��ȡ
	public Note getNote(int id) {
		return noteDao.getNote(id);
	}

	//����
	public boolean update(Note note) {
		note.setCreatetime(new Date());
		return noteDao.update(note);
	}

	//ɾ��
	public boolean delete(Note note) {
		return noteDao.delete(note);
	}

	//���
	public boolean add(Note note) {
		note.setCreatetime(new Date());
		return noteDao.save(note);
	}

	// �ҵ��μ�
	public List<Note> getNoteSelf(int userid, int i, int size) {
		return noteDao.getNoteList(userid, i, size);
	}

	//��ȡ��ҳ��Ҫ����
	public List<Note> getIndexList(int count) {
		return noteDao.getIndexList(count);
	}

	// ��ȡ��¼����
	public int getTotal() {
		return noteDao.getTotal();
	}
	
	// ��ȡ��¼����
	public int getTotalSelf(int userid) {
		return noteDao.getTotalSelf(userid);
	}
}
