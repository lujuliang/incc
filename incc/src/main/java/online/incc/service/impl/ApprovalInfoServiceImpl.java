package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ApprovalInfoMapper;
import online.incc.model.ApprovalInfo;
import online.incc.model.Product;
import online.incc.service.ApprovalInfoService;
import online.incc.vo.ProductVO;
import tk.mybatis.mapper.entity.Example;

@Service("approvalInfoService")
public class ApprovalInfoServiceImpl extends BaseService<ApprovalInfo> implements ApprovalInfoService {
	@Resource
	private ApprovalInfoMapper approvalInfoMapper;

	@Override
	public PageInfo<ApprovalInfo> selectByPage(ApprovalInfo approvalInfo, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();

		PageHelper.startPage(page, length);
		List<ApprovalInfo> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="approvalInfoVO",key="#proId")
	public ApprovalInfo selectByProId(Integer proId) {
		Example example = new Example(ApprovalInfo.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("proId", proId);
		List<ApprovalInfo> list = approvalInfoMapper.selectByExample(example);
		
		if(list.size()>0) {
		   return list.get(0);
		}else {
			return new ApprovalInfo();
		}
	}

}
