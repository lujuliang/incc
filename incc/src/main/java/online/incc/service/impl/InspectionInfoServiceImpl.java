package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.InspectionInfoMapper;
import online.incc.model.InspectionInfo;
import online.incc.model.Product;
import online.incc.service.InspectionInfoService;
import tk.mybatis.mapper.entity.Example;

@Service("inspectionInfoService")
public class InspectionInfoServiceImpl extends BaseService<InspectionInfo> implements InspectionInfoService {
	@Resource
	private InspectionInfoMapper inspectionInfoMapper;

	@Override
	public PageInfo<InspectionInfo> selectByPage(InspectionInfo InspectionInfo, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();

		PageHelper.startPage(page, length);
		List<InspectionInfo> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="inspectionInfoVO",key="#proId")
	public List<InspectionInfo> selectByProId(Integer proId) {
		Example example = new Example(InspectionInfo.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("proId", proId);
		return selectByExample(example);
	}

}
