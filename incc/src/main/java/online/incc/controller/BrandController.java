package online.incc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import online.incc.model.Brand;
import online.incc.model.Certificate;
import online.incc.service.BrandService;
import online.incc.service.ProductService;
import online.incc.vo.ProductAddVO;
import online.incc.vo.ProductListVO;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class BrandController {
	@Resource
	private BrandService brandService;

//	@RequestMapping("/brand/brands")
//	@ResponseBody
//	public Map<String, Object> getAll(ProductListVO productList, String draw,
//			@RequestParam(required = false, defaultValue = "1") int start,
//			@RequestParam(required = false, defaultValue = "10") int length) {
//		Map<String, Object> map = new HashMap<>();
//		PageInfo<ProductListVO> pageInfo = brandService.selectProducts(productList, start, length);
//		map.put("draw", draw);
//		map.put("recordsTotal", pageInfo.getTotal());
//		map.put("recordsFiltered", pageInfo.getTotal());
//		map.put("data", pageInfo.getList());
//		return map;
//	}

	@RequestMapping("/brand/brands")
	@ResponseBody
	public List<Brand> getBrands() {
		Example example = new Example(Brand.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("userId", (Integer) SecurityUtils.getSubject().getSession().getAttribute("userSessionId"));
		return brandService.selectByExample(example);
	}
}
