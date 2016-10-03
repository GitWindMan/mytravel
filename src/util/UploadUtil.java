package util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * �ļ��ϴ�������
 * @author YJ
 */
public class UploadUtil extends ActionSupport{

	/**
	 * ���ϴ�ʱ����������ļ�
	 * @param file	��Ҫ�ϴ����ļ�����
	 * @param fileName	ԭ�ļ���
	 * @param path	�ļ�����·�� �������Ŀ��Ŀ¼
	 * @return	�ļ�����·�� �������Ŀ��Ŀ¼
	 */
	public static String upload(File file, String fileName, String path){
		if(file==null || fileName == null) return null;		// ���Ҫ�ϴ����ļ����ļ�������򷵻�null
		String filePath = ServletActionContext.getServletContext().getRealPath(path);			// �ļ��洢·��
		String type = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());	// ��ȡ��ǰ�ļ�����
		String time = new SimpleDateFormat("yyMMddssSSS").format(new Date());			// ��ȡ��ǰϵͳʱ���ַ�
		String newFileName = time+"."+type;					// �������ļ���
		File savefile = new File(filePath,newFileName);	// ��ָ��·���������ļ�
		if (!savefile.getParentFile().exists()){	// �������ļ����ļ��в������򴴽�
			savefile.getParentFile().mkdirs();
		}
		try {	//���ϴ��ļ������ݸ��Ƶ��½��ļ���
			FileUtils.copyFile(file, savefile);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return path+newFileName;	// ����ͼƬ����·��
	}
	
}
