/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author HOANG
 */
public class Redirect implements ServletRequestAware {

    private HttpServletRequest request;
    private String previous;

    public void setServletRequest(HttpServletRequest arg0) {
        // TODO Auto-generated method stub
        request = arg0;
    }

    public String getPrevious() {
        return previous;
    }

    public void setPrevious(String previous) {
        this.previous = previous;
    }

    public String execute() {
        String temp =  request.getHeader("Referer");
        previous = temp.substring(temp.lastIndexOf('/') + 1);
        HttpSession session = request.getSession();
        if (request.getParameter("logout") != null) {
            session.invalidate();
        }
        return "success";
    }

}
