package online.incc.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import freemarker.template.TemplateException;
import online.incc.mapper.NotesMapper;
import online.incc.model.Notes;
import online.incc.model.Product;
import online.incc.service.NotesService;
import online.incc.util.GenerateHtml;
import online.incc.util.RealPath;
import online.incc.vo.NotesVO;
import tk.mybatis.mapper.entity.Example;

@Service("notesService")
public class NotesServiceImpl extends BaseService<Notes> implements NotesService {
	@Resource
	private NotesMapper notesMapper;

	@Override
	@Cacheable(cacheNames="NotesList",key="#start")
	public PageInfo<Notes> selectByPage(Notes notes, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();
		PageHelper.startPage(page, length);
		List<Notes> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="Notes",key="#key")
	public Notes selectByKey(Integer key) {
		return super.selectByKey(key);
	}

	@Override
	@Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public void add(NotesVO NotesVO, String realPath) throws IOException, TemplateException {
		Date d = new Date();
		String dateStr = d.toLocaleString();
		NotesVO.setDate(dateStr);
		Integer userId = userId();
		String realBasePath = RealPath.getRealPath(realPath);
		String NotesPath = realBasePath;
		
		Notes Notes = new Notes();
		Notes.setDate(dateStr);
		Notes.setTitle(NotesVO.getTitle());
		notesMapper.insertUseGeneratedKeys(Notes);
		Notes.setLink(Notes.getId()+".html");
		notesMapper.updateByPrimaryKeySelective(Notes);
		
		
		File htmlPage = new File(NotesPath, Notes.getId()+".html");  
        
        if (!htmlPage.exists()) {     
                    // 生成静态展示页面  
                    String templateName = "news.html";  
                    String htmlName = Notes.getId()+".html";  
                    GenerateHtml.generate(NotesPath,"html/Notes",NotesVO, templateName, htmlName);  
                }     
		
	}

}
