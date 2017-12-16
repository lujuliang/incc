package online.incc.service;

import java.io.IOException;

import com.github.pagehelper.PageInfo;

import freemarker.template.TemplateException;
import online.incc.model.News;
import online.incc.vo.NewsVO;

/**
 * 
 * @author Administrator
 *
 */
public interface NewsService extends IService<News> {
	PageInfo<News> selectByPage(News news, int start, int length);
	News selectByKey(Integer key);
	void add(NewsVO news, String realPath) throws IOException, TemplateException;
}
