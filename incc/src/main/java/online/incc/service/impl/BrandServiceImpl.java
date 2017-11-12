package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.BrandMapper;
import online.incc.model.Brand;
import online.incc.model.Product;
import online.incc.service.BrandService;
import tk.mybatis.mapper.entity.Example;

@Service("brandService")
public class BrandServiceImpl extends BaseService<Brand> implements BrandService {
	@Resource
	private BrandMapper brandMapper;

	@Override
	public PageInfo<Brand> selectByPage(Brand brand, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();

		PageHelper.startPage(page, length);
		List<Brand> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="brand",key="#key")
	public Brand selectByKey(Integer key) {
		return super.selectByKey(key);
	}

}
