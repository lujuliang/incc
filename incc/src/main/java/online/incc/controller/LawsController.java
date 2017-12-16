package online.incc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import freemarker.template.TemplateException;
import online.incc.model.Laws;
import online.incc.service.LawsService;
import online.incc.vo.LawsVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class LawsController {
	@Resource
	private LawsService lawsService;
	
	@Value("${online.incc.base}")
	private String inccBase;

	@RequestMapping(value="/laws/laws",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getAll(Laws Laws, String draw,
			@RequestParam(required = false, defaultValue = "1") int start,
			@RequestParam(required = false, defaultValue = "10") int length) {
		Map<String, Object> map = new HashMap<>();
		PageInfo<Laws> pageInfo = lawsService.selectByPage(Laws, start, length);
		List<Laws> Lawss = pageInfo.getList();
		
		if(Lawss != null && Lawss.size()>0) {
			for(Laws n:Lawss) {
				String link = inccBase + "/fileupload/html/Laws/" + n.getLink();
				n.setLink(link);
			}
		}
		
		map.put("draw", draw);
		map.put("recordsTotal", pageInfo.getTotal());
		map.put("recordsFiltered", pageInfo.getTotal());
		map.put("data", pageInfo.getList());
		return map;
	}
	
	@RequestMapping("/laws/save")
	@ResponseBody
	public String add(@RequestBody LawsVO Laws, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF");
		try {
			lawsService.add(Laws, realPath);
		} catch (IOException e) {
			return "error";
		} catch (TemplateException e) {
			return "error";
		}
		return "success";
	}
	
	@CacheEvict(cacheNames="laws", allEntries=true)
    @RequestMapping(value = "/laws/delete")
	@ResponseBody
    public String delete(Integer id){
        try{
            lawsService.delete(id);
            //更新权限
            return "success";
        }catch (Exception e){
            return "fail";
        }
    }

}
