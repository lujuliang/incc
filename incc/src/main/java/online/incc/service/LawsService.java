package online.incc.service;

import java.io.IOException;

import com.github.pagehelper.PageInfo;

import freemarker.template.TemplateException;
import online.incc.model.Laws;
import online.incc.vo.LawsVO;

/**
 * 
 * @author Administrator
 *
 */
public interface LawsService extends IService<Laws> {
	PageInfo<Laws> selectByPage(Laws Laws, int start, int length);
	Laws selectByKey(Integer key);
	void add(LawsVO laws, String realPath) throws IOException, TemplateException;
}
