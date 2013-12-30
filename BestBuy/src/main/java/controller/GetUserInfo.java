package controller;

import dao.AccountDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Account;


/**
 *
 * @author HOANG
 */
@Controller
@RequestMapping("/user/")
public class GetUserInfo {

    @RequestMapping(value="{name}", method = RequestMethod.GET)
    public @ResponseBody Account getUser(@PathVariable String name){
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        AccountDAO accountDAO = (AccountDAO) context.getBean("accountDAO");  
        Account account = accountDAO.get(name);
        if(account != null){
            account.setCarts(null);
            account.setWishList(null);
            account.setRoles(null);
            account.setComments(null);
        }
        return account;
    }
}