package online.incc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import online.incc.model.Certificate;
import online.incc.service.ApprovalInfoService;
import online.incc.service.ApprovalService;
import online.incc.service.BrandService;
import online.incc.service.CertificateService;
import online.incc.service.InspectionInfoService;
import online.incc.service.ManagementService;
import online.incc.service.ProducerService;
import online.incc.service.ProductService;
import online.incc.vo.ProductListVO;
import online.incc.vo.ProductVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class AprovalController {
	@Resource
	private ApprovalService approvalService;
	
    @Resource
    private CertificateService certificateService;
    
    @Resource
    private ProductService productService;
    
    @Resource
    private ApprovalInfoService approvalInfoService;
    
    @Resource
    private ManagementService managementService;
    
    @Resource
    private BrandService brandService;
    
    @Resource
    private ProducerService producerService;
    
    @Resource
    private InspectionInfoService inspectionInfoService;

	@RequestMapping("/approval/products")
	@ResponseBody
	public Map<String, Object> getAll(ProductListVO productList, String draw,
			@RequestParam(required = false, defaultValue = "1") int start,
			@RequestParam(required = false, defaultValue = "10") int length) {
		Map<String, Object> map = new HashMap<>();
		PageInfo<ProductListVO> pageInfo = approvalService.selectProducts(productList, start, length);
		map.put("draw", draw);
		map.put("recordsTotal", pageInfo.getTotal());
		map.put("recordsFiltered", pageInfo.getTotal());
		map.put("data", pageInfo.getList());
		return map;
	}
	
	@RequestMapping("/approval/sure/{proId}")
    public ModelAndView ewmPage(@PathVariable Integer proId){
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("approval/sureApproval");
    	ProductVO product = productService.selectProductInfoByKey(proId);
        mv.addObject("product", product);
        mv.addObject("approvalInfo", approvalInfoService.selectByProId(proId));
        mv.addObject("management", managementService.selectByKey(product.getManangmentId()));
        mv.addObject("brand", brandService.selectByKey(product.getBrandId()));
        mv.addObject("producer", producerService.selectByKey(product.getProduceId()));
        mv.addObject("inspections", inspectionInfoService.selectByProId(proId));
    	return mv;
    }
	
	@PostMapping(value = "/approval/makesure")
	@ResponseBody
	public String add(@RequestBody Certificate cert, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/templates");
		return approvalService.makesure(cert,realPath);
	}
	

}
