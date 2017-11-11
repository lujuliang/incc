package online.incc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import online.incc.model.SysUser;
import online.incc.model.SysUserRole;
import online.incc.service.UserRoleService;
import online.incc.service.UserService;
import online.incc.util.PasswordHelper;
import online.incc.vo.UserVo;

/**
 * 
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/users")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;

    @RequestMapping
    public Map<String,Object> getAll(SysUser sysUser, String draw,
                                     @RequestParam(required = false, defaultValue = "1") int start,
                                     @RequestParam(required = false, defaultValue = "10") int length){
        Map<String,Object> map = new HashMap<>();
        PageInfo<SysUser> pageInfo = userService.selectByPage(sysUser, start, length);
        System.out.println("pageInfo.getTotal():"+pageInfo.getTotal());
        map.put("draw",draw);
        map.put("recordsTotal",pageInfo.getTotal());
        map.put("recordsFiltered",pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    @RequestMapping("/name/{username}")
    public SysUser getAll(@PathVariable String username){
    	return userService.selectByUsername(username);
    }

    /**
     * 保存用户角色
     * @param sysUserRole 用户角色
     *  	  此处获取的参数的角色id是以 “,” 分隔的字符串
     * @return
     */
    @RequestMapping("/saveUserRoles")
    public String saveUserRoles(SysUserRole sysUserRole){
        if(StringUtils.isEmpty(sysUserRole.getUserid()))
            return "error";
        try {
            userRoleService.addUserRole(sysUserRole);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping(value = "/add")
    public String add(@ModelAttribute UserVo userVo, HttpServletRequest request) {
    	SysUser sysUser = userVo.getUser();
        SysUser u = userService.selectByUsername(sysUser.getUsername());
        if(u != null)
            return "error";
        try {
            sysUser.setEnable(1);
            PasswordHelper passwordHelper = new PasswordHelper();
            passwordHelper.encryptPassword(sysUser);
            userService.save(sysUser);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping(value = "/delete")
    public String delete(Integer id){
      try{
          userService.delUser(id);
          return "success";
      }catch (Exception e){
          e.printStackTrace();
          return "fail";
      }
    }
}
