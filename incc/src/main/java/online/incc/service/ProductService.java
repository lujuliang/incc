package online.incc.service;

import com.github.pagehelper.PageInfo;

import online.incc.model.Product;
import online.incc.vo.ProductListVO;
import online.incc.vo.ProductVO;

/**
 * 
 * @author Administrator
 *
 */
public interface ProductService extends IService<Product> {
	PageInfo<Product> selectByPage(Product product, int start, int length);
	Product selectByKey(Integer key);
	
	ProductVO selectProductInfoByKey(Integer key);
	
	PageInfo<ProductListVO> selectProducts(ProductListVO productList, int start, int length);
}
