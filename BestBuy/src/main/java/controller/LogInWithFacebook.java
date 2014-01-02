/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.RoleDAO;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.User;
import facebook4j.auth.AccessToken;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import pojo.Account;
import pojo.Cart;
import pojo.UserRole;

/**
 *
 * @author Jeremy
 */
public class LogInWithFacebook implements ServletRequestAware {

    private HttpServletRequest request;
    private String AccessTokenKey;

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public String getAccessTokenKey() {
        return AccessTokenKey;
    }

    public void setAccessTokenKey(String AccessTokenKey) {
        this.AccessTokenKey = AccessTokenKey;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        try {
            User user = getFacebookUser();

            AccountDAO accountDAO = (AccountDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("accountDAO");
            Account account = accountDAO.get(user.getUsername());

            if (account == null) {
                account = createAccount(user);

                accountDAO.add(account);
            }

            logIn(account);
        } catch (Exception ex) {
            return "error";
        }

        return "success";
    }

    private User getFacebookUser() throws FacebookException {
        Facebook facebook = new FacebookFactory().getInstance();
        facebook.setOAuthAppId("185367794993208", "c5dc7981e60a0196c4f50317ea0fe3ed");
        facebook.setOAuthAccessToken(new AccessToken(AccessTokenKey, null));

        return facebook.getMe();
    }

    private Account createAccount(User user) {
        String imageUrl = "http://graph.facebook.com/"+ user.getId() + "/picture?width=200&height=200";
        Account account = new Account(user.getUsername(), "", user.getName(), "", user.getHometown().getName(), imageUrl, 1);
        UserRole role = new UserRole(account, "ROLE_USER");
        RoleDAO roleDAO = (RoleDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("roleDAO");
        roleDAO.add(role);

        return account;
    }

    private void logIn(Account account) {
        Collection<GrantedAuthority> authoritys = new ArrayList<GrantedAuthority>();

        for (UserRole role : account.getRoles()) {
            authoritys.add(new GrantedAuthorityImpl(role.getAuthority()));
        }
        Authentication authentication = new UsernamePasswordAuthenticationToken(account, "AAAAA", authoritys);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("Cart");
        cart.setAccount(account);
        session.setAttribute("Cart", cart);
        session.setAttribute("User", account);
    }
}
