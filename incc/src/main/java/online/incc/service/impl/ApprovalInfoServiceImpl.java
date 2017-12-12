package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ApprovalInfoMapper;
import online.incc.mapper.ProductMapper;
import online.incc.model.ApprovalInfo;
import online.incc.model.Product;
import online.incc.service.ApprovalInfoService;
import tk.mybatis.mapper.entity.Example;

@Service("approvalInfoService")
public class ApprovalInfoServiceImpl extends BaseService<ApprovalInfo> implements ApprovalInfoService {
	@Resource
	private ApprovalInfoMapper approvalInfoMapper;
	
	@Resource
	private ProductMapper productMapper;
	
	@Value("${online.incc.base}")
	private String inccBase;
	
	@Value("${fileupload.approval.path}")
	private String approvalPath;

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
		
		Example example1 = new Example(Product.class);
		Example.Criteria criteria1 = example1.createCriteria();
		criteria1.andEqualTo("id", proId);
		List<Product> list1 = productMapper.selectByExample(example1);
		if(list1.isEmpty()) {
			return new ApprovalInfo();
		}else {
			Example example = new Example(ApprovalInfo.class);
			Example.Criteria criteria = example.createCriteria();
			criteria.andEqualTo("userId", list1.get(0).getUserId());
			List<ApprovalInfo> list = approvalInfoMapper.selectByExample(example);
			
			if(list.size()>0) {
				ApprovalInfo info = list.get(0);
				String picName = info.getPicPath();
				info.setPicPath(inccBase+approvalPath+picName);
			   return info;
			}else {
				return new ApprovalInfo();
			}
		}	
	}

}
