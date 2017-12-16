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
import online.incc.mapper.LawsMapper;
import online.incc.model.Laws;
import online.incc.model.Product;
import online.incc.service.LawsService;
import online.incc.util.GenerateHtml;
import online.incc.util.RealPath;
import online.incc.vo.LawsVO;
import tk.mybatis.mapper.entity.Example;

@Service("lawsService")
public class LawsServiceImpl extends BaseService<Laws> implements LawsService {
	@Resource
	private LawsMapper lawsMapper;

	@Override
	@Cacheable(cacheNames="LawsList",key="#start")
	public PageInfo<Laws> selectByPage(Laws laws, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();
		PageHelper.startPage(page, length);
		List<Laws> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="Laws",key="#key")
	public Laws selectByKey(Integer key) {
		return super.selectByKey(key);
	}

	@Override
	@Transactional(propagation= Propagation.REQUIRED,readOnly=false,rollbackFor={Exception.class})
	public void add(LawsVO lawsVO, String realPath) throws IOException, TemplateException {
		Date d = new Date();
		String dateStr = d.toLocaleString();
		lawsVO.setDate(dateStr);
		Integer userId = userId();
		String realBasePath = RealPath.getRealPath(realPath);
		String LawsPath = realBasePath;
		
		Laws laws = new Laws();
		laws.setDate(dateStr);
		laws.setTitle(lawsVO.getTitle());
		lawsMapper.insertUseGeneratedKeys(laws);
		laws.setLink(laws.getId()+".html");
		lawsMapper.updateByPrimaryKeySelective(laws);
		
		
		File htmlPage = new File(LawsPath, laws.getId()+".html");  
        
        if (!htmlPage.exists()) {     
                    // 生成静态展示页面  
                    String templateName = "news.html";  
                    String htmlName = laws.getId()+".html";  
                    GenerateHtml.generate(LawsPath,"html/laws",lawsVO, templateName, htmlName);  
                }     
		
	}

}
