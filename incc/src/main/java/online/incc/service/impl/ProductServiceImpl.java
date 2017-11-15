package online.incc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import online.incc.mapper.ProductMapper;
import online.incc.model.Product;
import online.incc.service.ProductService;
import online.incc.vo.ProductListVO;
import online.incc.vo.ProductVO;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

@Service("productService")
public class ProductServiceImpl extends BaseService<Product> implements ProductService {
	@Resource
	private ProductMapper productMapper;

	@Value("${fileupload.productinfo.path}")
	private String productinfoPath;
	
	@Value("${fileupload.ins.path}")
	private String insPath;

	@Override
	public PageInfo<Product> selectByPage(Product product, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(product.getProName())) {
			criteria.andLike("proName", "%" + product.getProName() + "%");
		}
		PageHelper.startPage(page, length);
		List<Product> list = selectByExample(example);
		return new PageInfo<>(list);
	}

	@Override
	@Cacheable(cacheNames="productVO",key="#key")
	public ProductVO selectProductInfoByKey(Integer key) {
		ProductVO product = productMapper.selectProductInfoByKey(key);
		if (product != null) {
			String sedate = product.getStartDt() + " 至 " + product.getEndDt();
			product.setStartDt(sedate);
			String fileName = product.getPicPath();
			product.setPicPath(productinfoPath+fileName);
			String insName = product.getInsPath();
			product.setInsPath(insPath+insName);
		}
		return product;
	}

	@Override
	public Product selectByKey(Integer key) {
		return super.selectByKey(key);
	}

	@Override
	public PageInfo<ProductListVO> selectProducts(ProductListVO productList, int start, int length) {
		int page = start / length + 1;
		Example example = new Example(Product.class);
		Example.Criteria criteria = example.createCriteria();
		if (StringUtil.isNotEmpty(productList.getProName())) {
			criteria.andLike("proName", "%" + productList.getProName() + "%");
		}
		PageHelper.startPage(page, length);
		 Integer userid = (Integer) SecurityUtils.getSubject().getSession().getAttribute("userSessionId");
		List<ProductListVO> list = productMapper.selectProductListVO(userid,productList.getProName());
		return new PageInfo<>(list);
	}

}
