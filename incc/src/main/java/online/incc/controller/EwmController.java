package online.incc.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import online.incc.service.ApprovalInfoService;
import online.incc.service.BrandService;
import online.incc.service.CertificateService;
import online.incc.service.InspectionInfoService;
import online.incc.service.ManagementService;
import online.incc.service.ProducerService;
import online.incc.service.ProductService;
import online.incc.vo.ProductVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/ewm")
public class EwmController {
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
 
    @RequestMapping("/{proId}")
    public ModelAndView ewmPage(@PathVariable Integer proId){
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("certificate/ewmInfo");
    	ProductVO product = productService.selectProductInfoByKey(proId);
        mv.addObject("product", product);
        mv.addObject("approvalInfo", approvalInfoService.selectByProId(proId));
        mv.addObject("management", managementService.selectByKey(product.getManangmentId()));
        mv.addObject("brand", brandService.selectByKey(product.getBrandId()));
        mv.addObject("producer", producerService.selectByKey(product.getProduceId()));
        mv.addObject("inspections", inspectionInfoService.selectByProId(proId));
        mv.addObject("awardDt", product.getAwardDt());
    	return mv;
    }
	
}
