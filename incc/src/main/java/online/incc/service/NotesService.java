package online.incc.service;

import java.io.IOException;

import com.github.pagehelper.PageInfo;

import freemarker.template.TemplateException;
import online.incc.model.Notes;
import online.incc.vo.NotesVO;

/**
 * 
 * @author Administrator
 *
 */
public interface NotesService extends IService<Notes> {
	PageInfo<Notes> selectByPage(Notes Laws, int start, int length);
	Notes selectByKey(Integer key);
	void add(NotesVO laws, String realPath) throws IOException, TemplateException;
}
