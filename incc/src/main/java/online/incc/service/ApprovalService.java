package online.incc.service;


import com.github.pagehelper.PageInfo;

import online.incc.model.Certificate;
import online.incc.model.Product;
import online.incc.vo.ProductListVO;

/**
 * 
 * @author Administrator
 *
 */
public interface ApprovalService extends IService<Product> {
	PageInfo<ProductListVO> selectProducts(ProductListVO productList, int start, int length);

	String makesure(Certificate cert, String realPath);
}
