package online.incc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import online.incc.model.Certificate;
import online.incc.service.ProductService;
import online.incc.vo.ProductListVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class ProductController {
    @Resource
    private ProductService productService;
    
	@RequestMapping("/product/products")
	@ResponseBody
    public Map<String,Object> getAll(ProductListVO productList, String draw,
                                     @RequestParam(required = false, defaultValue = "1") int start,
                                     @RequestParam(required = false, defaultValue = "10") int length){
        Map<String,Object> map = new HashMap<>();
        PageInfo<ProductListVO> pageInfo = productService.selectProducts(productList, start, length);
        map.put("draw",draw);
        map.put("recordsTotal",pageInfo.getTotal());
        map.put("recordsFiltered",pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }
	
	
}
