package dao;

import java.util.List;

import model.Note;

import org.springframework.stereotype.Repository;

@Repository//注册spring管理bean
@SuppressWarnings("unchecked")
public class NoteDao extends BaseDao{

	//获取列表
	public List<Note> getNoteList(int i, int size) {
		return getSession().createQuery("from Note").setFirstResult(i).setMaxResults(size).list();
	}

	//根据id获取
	public Note getNote(int id) {
		return (Note) getSession().get(Note.class, id);
	}

	// 我的游记
	public List<Note> getNoteList(int userid, int i, int size) {
		return getSession().createQuery("from Note where user_id=:userid").setInteger("userid", userid).setFirstResult(i).setMaxResults(size).list();
	}

	//获取首页需要数据
	public List<Note> getIndexList(int count) {
		return getSession().createQuery("from Note").setMaxResults(count).list();
	}

	// 获取记录总数
	public int getTotal() {
		return Integer.parseInt(getSession().createQuery("select count(*) from Note").uniqueResult().toString());
	}

	// 获取记录总数
	public int getTotalSelf(int userid) {
		return Integer.parseInt(getSession().createQuery("select count(*) from Note where user_id=:userid").setInteger("userid", userid).uniqueResult().toString());
	}
}
