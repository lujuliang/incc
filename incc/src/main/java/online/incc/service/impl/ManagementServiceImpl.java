package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ManagementMapper;
import online.incc.model.Management;
import online.incc.model.Product;
import online.incc.service.ManagementService;
import tk.mybatis.mapper.entity.Example;

@Service("managementfoService")
public class ManagementServiceImpl extends BaseService<Management> implements ManagementService {
	@Resource
	private ManagementMapper managementMapper;

	@Value("${online.incc.base}")
	private String inccBase;
	
	@Value("${fileupload.license.path}")
	private String licensePath;
	
	@Override
	public PageInfo<Management> selectByPage(Management management, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();

		PageHelper.startPage(page, length);
		List<Management> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="management",key="#key")
	public Management selectByKey(Integer key) {
		Management management = super.selectByKey(key);
		if(management != null) {
			String start = management.getStartDt();
			String end = management.getEndDt();
			management.setStartDt(start+"至"+end); 
			String picPath = management.getLicensePic();
			if(picPath != null) {
				management.setLicensePic(inccBase+licensePath+picPath);
			}
		}
		return management;
	}

}
