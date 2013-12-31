/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import pojo.Product;

/**
 *
 * @author HOANG
 */
public class Other implements ServletRequestAware {

    private HttpServletRequest request;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String execute() throws IOException {
        WebClient webClient = new WebClient();
        webClient.addRequestHeader("Accept-Charset", "utf-8");
        webClient.getOptions().setRedirectEnabled(false);
        webClient.getOptions().setJavaScriptEnabled(false);
        webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
        webClient.getOptions().setThrowExceptionOnScriptError(false);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setUseInsecureSSL(true);
        HtmlPage page = webClient.getPage("http://www.nguyenkim.com/tivi-man-hinh-lcd/?items_per_page=20");
        List<HtmlElement> elements = (List<HtmlElement>) page.getByXPath("//div[@class='block_right_cate2_new_ver2']");
        List<String> links = new ArrayList<String>();
        List<Product> products = new ArrayList<Product>();
        for(HtmlElement element : elements){
            String imageUrl = "http://www.nguyenkim.com" + ((HtmlElement)element.getFirstByXPath(".//div[@class='product-image']/img")).getAttribute("src");
            String name = ((HtmlElement)element.getFirstByXPath(".//a[@class='product-title']")).getAttribute("title");
            String link = "http://www.nguyenkim.com" + ((HtmlElement)element.getFirstByXPath(".//a[@class='product-title']")).getAttribute("href");
            String price = ((HtmlElement)element.getFirstByXPath(".//div[@class='block_price_sp_home_new']")).getTextContent().trim();
            Product product = new Product(null, name, price, null, null, null, imageUrl, null, null);
            links.add(link);
            products.add(product);
        }
        request.setAttribute("products", products);
        request.setAttribute("links", links);
        return "success";
    }

}
