/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author HOANG
 */
public class Cart implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() {
        if(request.getParameter("remove") != null){
            System.out.println("safs");
        }
        return "success";
    }
    
}
