package online.incc.service;

import com.github.pagehelper.PageInfo;

import online.incc.model.Brand;

/**
 * 
 * @author Administrator
 *
 */
public interface BrandService extends IService<Brand> {
	PageInfo<Brand> selectByPage(Brand brand, int start, int length);
	Brand selectByKey(Integer key);
}
