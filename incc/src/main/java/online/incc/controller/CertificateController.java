package online.incc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import online.incc.model.Certificate;
import online.incc.service.CertificateService;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class CertificateController {
    @Resource
    private CertificateService certificateService;
    
	@RequestMapping("/certificate/certificates")
	@ResponseBody
    public Map<String,Object> getAll(Certificate Certificate, String draw,
                                     @RequestParam(required = false, defaultValue = "1") int start,
                                     @RequestParam(required = false, defaultValue = "10") int length){
        Map<String,Object> map = new HashMap<>();
        PageInfo<Certificate> pageInfo = certificateService.selectByPage(Certificate, start, length);
        System.out.println("pageInfo.getTotal():"+pageInfo.getTotal());
        map.put("draw",draw);
        map.put("recordsTotal",pageInfo.getTotal());
        map.put("recordsFiltered",pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }
	
    @RequestMapping("/certificate/{proId}")
    public ModelAndView certificateInfo(@PathVariable Integer proId){
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("certificate/certificate");
        mv.addObject("certificate", certificateService.selectByKey(proId));
    	return mv;
    }
	
}
