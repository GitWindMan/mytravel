package dao;

import java.util.List;

import model.Note;

import org.springframework.stereotype.Repository;

@Repository//ע��spring����bean
@SuppressWarnings("unchecked")
public class NoteDao extends BaseDao{

	//��ȡ�б�
	public List<Note> getNoteList(int i, int size) {
		return getSession().createQuery("from Note").setFirstResult(i).setMaxResults(size).list();
	}

	//����id��ȡ
	public Note getNote(int id) {
		return (Note) getSession().get(Note.class, id);
	}

	// �ҵ��μ�
	public List<Note> getNoteList(int userid, int i, int size) {
		return getSession().createQuery("from Note where user_id=:userid").setInteger("userid", userid).setFirstResult(i).setMaxResults(size).list();
	}

	//��ȡ��ҳ��Ҫ����
	public List<Note> getIndexList(int count) {
		return getSession().createQuery("from Note").setMaxResults(count).list();
	}

	// ��ȡ��¼����
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Note").uniqueResult().toString());
	}

	// ��ȡ��¼����
	public int getTotalSelf(int userid) {
		return Integer.parseInt(getSession().createQuery("select count(*) from Note where user_id=:userid").setInteger("userid", userid).uniqueResult().toString());
	}
}
