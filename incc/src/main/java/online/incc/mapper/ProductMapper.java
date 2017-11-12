package online.incc.mapper;

import org.apache.ibatis.annotations.Param;

import online.incc.model.Product;
import online.incc.util.MyMapper;
import online.incc.vo.ProductVO;

public interface ProductMapper extends MyMapper<Product> {
	ProductVO selectProductInfoByKey(@Param("proId") Integer proId);
}