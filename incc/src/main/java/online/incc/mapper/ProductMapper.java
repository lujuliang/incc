package online.incc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import online.incc.model.Product;
import online.incc.util.MyMapper;
import online.incc.vo.ProductListVO;
import online.incc.vo.ProductVO;

public interface ProductMapper extends MyMapper<Product> {
	ProductVO selectProductInfoByKey(@Param("proId") Integer proId);

	List<ProductListVO> selectProductListVO(@Param("userid") Integer userid, @Param("proName") String proName);
}