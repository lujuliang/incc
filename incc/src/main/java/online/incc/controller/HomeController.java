package online.incc.controller;

import online.incc.model.SysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class HomeController {
    @RequestMapping(value="/login",method= RequestMethod.GET)
    public String login(){
        return "login2";
    }
    
    @RequestMapping(value="/logout",method= RequestMethod.GET)
    public String logout(){
    	 Session session = SecurityUtils.getSubject().getSession();
         session.setAttribute("userSession", null);
         session.setAttribute("userSessionId", null);
        return "index";
    }
    
    @RequestMapping(value="/register",method= RequestMethod.GET)
    public String register(){
        return "register";
    }

    @RequestMapping(value="/login",method=RequestMethod.POST)
    public String login(HttpServletRequest request, SysUser sysUser, Model model){
        if (StringUtils.isEmpty(sysUser.getUsername()) || StringUtils.isEmpty(sysUser.getPassword())) {
            request.setAttribute("msg", "用户名或密码不能为空！");
            return "login2";
        }
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token=new UsernamePasswordToken(sysUser.getUsername(),sysUser.getPassword());
        try {
            subject.login(token);
            return "redirect:/main";
        }catch (LockedAccountException lae) {
            token.clear();
            request.setAttribute("msg", "用户已经被锁定不能登录，请与管理员联系！");
            return "login2";
        } catch (AuthenticationException e) {
            token.clear();
            request.setAttribute("msg", "用户或密码不正确！");
            return "login2";
        }
    }

    @RequestMapping("/usersPage")
    public String usersPage(){
        return "user/users";
    }

    @RequestMapping("/rolesPage")
    public String rolesPage(){
        return "role/roles";
    }

    @RequestMapping("/resourcesPage")
    public String resourcesPage(){
        return "resources/resources";
    }

    @RequestMapping("/403")
    public String forbidden(){
        return "403";
    }
    
    @RequestMapping("/users/addUserPage")
    public String usersPage0(){
        return "user/add";
    }


    @RequestMapping("/certificatePage")
    public String certificate(){
        return "certificate/certificatePage";
    }
    
    @RequestMapping("/main")
    public String main(){
        return "main";
    }
    @RequestMapping("/")
    public String main0(){

    	return "index";
    }
    
    @RequestMapping("/noroles")
    public String noroles(){

    	return "noroles";
    }
    
    @RequestMapping("/productPage")
    public String productPage(){
        return "product/products";
    }
    @RequestMapping("/product/addPage")
    public String addProduct(){
        return "product/addPro";
    }
    @RequestMapping("/approvalPage")
    public String approvalPage(){
        return "approval/approval";
    }
}
