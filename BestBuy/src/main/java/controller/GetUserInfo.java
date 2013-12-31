package controller;

import dao.AccountDAO;
import javax.ws.rs.WebApplicationException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.AccountService;


/**
 *
 * @author HOANG
 */
@Controller
@RequestMapping("/user/")
public class GetUserInfo {

    @RequestMapping(value="{name}", method = RequestMethod.GET)
    public @ResponseBody AccountService getUser(@PathVariable String name){
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");  
        AccountService account = accountDAO.get(name);
        return account.cloneThis();
    }
}