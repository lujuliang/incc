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
import online.incc.model.Notes;
import online.incc.service.NotesService;
import online.incc.vo.NotesVO;

/**
 * 
 * @author Administrator
 *
 */
@Controller
public class NotesController {
	@Resource
	private NotesService notesService;
	
	@Value("${online.incc.base}")
	private String inccBase;

	@RequestMapping(value="/notes/notes",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getAll(Notes notes, String draw,
			@RequestParam(required = false, defaultValue = "1") int start,
			@RequestParam(required = false, defaultValue = "10") int length) {
		Map<String, Object> map = new HashMap<>();
		PageInfo<Notes> pageInfo = notesService.selectByPage(notes, start, length);
		List<Notes> notess = pageInfo.getList();
		
		if(notess != null && notess.size()>0) {
			for(Notes n:notess) {
				String link = inccBase + "/fileupload/html/notes/" + n.getLink();
				n.setLink(link);
			}
		}
		
		map.put("draw", draw);
		map.put("recordsTotal", pageInfo.getTotal());
		map.put("recordsFiltered", pageInfo.getTotal());
		map.put("data", pageInfo.getList());
		return map;
	}
	
	@RequestMapping("/notes/save")
	@ResponseBody
	public String add(@RequestBody NotesVO notes, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF");
		try {
			notesService.add(notes, realPath);
		} catch (IOException e) {
			return "error";
		} catch (TemplateException e) {
			return "error";
		}
		return "success";
	}
	
	@CacheEvict(cacheNames="notes", allEntries=true)
    @RequestMapping(value = "/notes/delete")
	@ResponseBody
    public String delete(Integer id){
        try{
            notesService.delete(id);
            //更新权限
            return "success";
        }catch (Exception e){
            return "fail";
        }
    }

}
