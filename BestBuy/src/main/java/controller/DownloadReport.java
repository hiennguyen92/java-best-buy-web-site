/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import dao.AccountDAO;
import dao.CartDAO;
import dao.ProductDAO;
import dao.SaleOffDAO;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import pojo.Account;
import pojo.Cart;
import pojo.SaleOff;
import pojo.Product;

/**
 *
 * @author Nguyen Hien
 */

@Controller
@RequestMapping("/download")
public class DownloadReport {
    
    @RequestMapping(value = "/account/pdf", method = RequestMethod.GET)
    public ModelAndView AccountReportPDF(ModelAndView modelAndView){
		
		JRDataSource datasource  = getDataAccount();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("pdfReportAcc", parameterMap);   
		return modelAndView;
	}
    
    @RequestMapping(value = "/account/xls", method = RequestMethod.GET)
    public ModelAndView AccountReportXLS(ModelAndView modelAndView){
		
		JRDataSource datasource  = getDataAccount();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("xlsReportAcc", parameterMap);   
		return modelAndView;
	}
    
    
    @RequestMapping(value = "/product/pdf", method = RequestMethod.GET)
    public ModelAndView ProductReportPDF(ModelAndView modelAndView){
		
		JRDataSource datasource  = getDataProduct();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("pdfReportProduct", parameterMap);   
		return modelAndView;
    }
    
    @RequestMapping(value = "/product/xls", method = RequestMethod.GET)
    public ModelAndView ProductReportXLS(ModelAndView modelAndView){
		
		JRDataSource datasource  = getDataProduct();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("xlsReportProduct", parameterMap);   
		return modelAndView;
	}
    
    
    
    @RequestMapping(value = "/saleoff/pdf", method = RequestMethod.GET)
    public ModelAndView SaleOffReportPDF(ModelAndView modelAndView) throws ParseException{
		
		JRDataSource datasource  = getDataSaleOff();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("pdfReportSaleOff", parameterMap);   
		return modelAndView;
    }
    
    
    @RequestMapping(value = "/saleoff/xls", method = RequestMethod.GET)
    public ModelAndView SaleOffReportXLS(ModelAndView modelAndView) throws ParseException{
		
		JRDataSource datasource  = getDataSaleOff();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("xlsReportSaleOff", parameterMap);   
		return modelAndView;
    }
    
    
    
    @RequestMapping(value = "/cart/pdf", method = RequestMethod.GET)
    public ModelAndView CartReportPDF(ModelAndView modelAndView)throws ParseException{
		
		JRDataSource datasource  = getDataCart();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("pdfReportCart", parameterMap);   
		return modelAndView;
    }
    
    
    @RequestMapping(value = "/cart/xls", method = RequestMethod.GET)
    public ModelAndView CartReportXLS(ModelAndView modelAndView) throws ParseException{
		
		JRDataSource datasource  = getDataCart();
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("datasource", datasource);
		
		modelAndView = new ModelAndView("xlsReportCart", parameterMap);   
		return modelAndView;
    }
    
    
    
    
    
    public JRDataSource getDataCart(){
        List<rpAccount> items = new ArrayList<rpAccount>();
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        CartDAO cartDAO = (CartDAO) context.getBean("cartDAO");
        List<Cart> Data = cartDAO.getList();
        float total = 0;
        for (Cart cart : Data) {
            if (cart.getAccount() != null) {
                total += cart.getTotalPrice();
            }
            
        }
        
        rpAccount item = new rpAccount();
        item.setName("ToTal Price:");
        item.setPhantram(total+"$");
        items.add(item);
        
        
        for (Cart cart : Data) {
            if (cart.getAccount() != null) {
                rpAccount con = new rpAccount();
                con.setName("\t"+cart.getAccount().getUsername());
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                con.setPhantram(cart.getTotalPrice()+"$\t"+formatter.format(cart.getDate()));
                items.add(con);
            }
        }

        JRDataSource ds = new JRBeanCollectionDataSource(items);	
		
	return ds;
    }
    
    
    public JRDataSource getDataSaleOff() throws ParseException{
        List<rpSale> items = new ArrayList<rpSale>();
		
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        SaleOffDAO saleOffDAO = (SaleOffDAO) context.getBean("saleOffDAO");
                
                List<SaleOff> Data = saleOffDAO.getList();

                
                
                for (SaleOff saleOff : Data) {
                    rpSale item = new rpSale();
                    item.setName(saleOff.getName());
                    item.setMota(saleOff.getDescription());
                    item.setPhantram(saleOff.getPercent()+ "%");
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                    item.setTime(formatter.format(saleOff.getFrom()) +" - "+formatter.format(saleOff.getTo()));
                    items.add(item);
                }
	
		// Wrap the collection in a JRBeanCollectionDataSource
		// This is one of the collections that Jasper understands
		JRDataSource ds = new JRBeanCollectionDataSource(items);	
		
		// Return the wrapped collection
		return ds;
    }
    
    
    
    public JRDataSource getDataProduct(){
        List<rpAccount> items = new ArrayList<rpAccount>();
        
        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        ProductDAO productDAO = (ProductDAO) context.getBean("productDAO"); 
        List<Product> Data = productDAO.getList();

        rpAccount item0 = new rpAccount();
        item0.setName("Total: ");
        item0.setPhantram(Data.size()+" products");

        int price500 = 0;
        int price2000 = 0;
        int pricehon2000 = 0;
        for (Product pro : Data) {
            if (pro.getPrice() < 500) {
                price500++;
            }else{
                if (pro.getPrice() <2000) {
                   price2000++;
                }else
                    pricehon2000++;
            }
        }
        rpAccount price = new rpAccount();
        price.setName("Price");
        price.setPhantram(" ");

        rpAccount price1 = new rpAccount();
        price1.setName("\tPrice below $150:");
        price1.setPhantram(price500+" products");

        rpAccount price2 = new rpAccount();
        price2.setName("\tPrice from $500 to $2000:");
        price2.setPhantram(price2000+" products");

        rpAccount price3 = new rpAccount();
        price3.setName("\tPrice over $2000:");
        price3.setPhantram(pricehon2000+" products");

        int Accessories = 0;
        int Samsung = 0;
        int LG = 0;
        int Sony = 0;
        int Panasonic = 0;
        int Sharp = 0;
       for (Product pro : Data) {
           if (pro.getBrand() != null) {

            if (pro.getBrand().getBrandId() == 1) {
                Samsung++;
            }
            if (pro.getBrand().getBrandId() == 2) {
               LG++;
            }
            if (pro.getBrand().getBrandId() == 3) {
               Sony++;
           }
            if (pro.getBrand().getBrandId() == 4) {
               Panasonic++;
           }
            if (pro.getBrand().getBrandId() == 5) {
               Sharp++;
           }
        }else{
               Accessories++;
           }
       }

        rpAccount brand = new rpAccount();
        brand.setName("Brand");
        brand.setPhantram(" ");

        rpAccount brand1 = new rpAccount();
        brand1.setName("\tSamsung:");
        brand1.setPhantram(Samsung+" products");

        rpAccount brand2 = new rpAccount();
        brand2.setName("\tLG:");
        brand2.setPhantram(LG+" products");

        rpAccount brand3 = new rpAccount();
        brand3.setName("\tSony:");
        brand3.setPhantram(Sony+" products");

        rpAccount brand4 = new rpAccount();
        brand4.setName("\tPanasonic:");
        brand4.setPhantram(Panasonic+" products");

        rpAccount brand5 = new rpAccount();
        brand5.setName("\tSharp:");
        brand5.setPhantram(Sharp+" products");

        rpAccount accessories = new rpAccount();
        accessories.setName("\tAccessories:");
        accessories.setPhantram(Accessories+" products");

        int rate5 = 0;
        int rate4 = 0;
        int rate3 = 0;
        int rate2 = 0;
        int rate1 = 0;


        for (Product pro : Data) {
            if (pro.getRating() < 1) {
                rate1++;
            }else{
                    if (pro.getRating() < 2) {
                        rate2++;
                    }
                    else{
                        if (pro.getRating() < 3) {
                            rate3++;
                        }else{
                            if (pro.getRating() < 4) {
                                rate4++;
                            }else
                                rate5++;
                        }
                    }
            }
       }

        rpAccount rate = new rpAccount();
        rate.setName("Rating");
        rate.setPhantram(" ");

        rpAccount rate5s = new rpAccount();
        rate5s.setName("\tStarts 4-5:");
        rate5s.setPhantram(rate5+"");

        rpAccount rate4s = new rpAccount();
        rate4s.setName("\tStarts 3-4:");
        rate4s.setPhantram(rate4+"");

        rpAccount rate3s = new rpAccount();
        rate3s.setName("\tStarts 2-3:");
        rate3s.setPhantram(rate3+"");

        rpAccount rate2s = new rpAccount();
        rate2s.setName("\tStarts 1-2:");
        rate2s.setPhantram(rate2+"");

        rpAccount rate1s = new rpAccount();
        rate1s.setName("\tBelow 1:");
        rate1s.setPhantram(rate1+"");		
        // Add to list
        items.add(item0);
        items.add(brand);
        items.add(brand1);
        items.add(brand2);
        items.add(brand3);
        items.add(brand4);
        items.add(brand5);
        items.add(accessories);

        items.add(price);
        items.add(price1);
        items.add(price2);
        items.add(price3);

        items.add(rate);
        items.add(rate5s);
        items.add(rate4s);
        items.add(rate3s);
        items.add(rate2s);
        items.add(rate1s);	
        JRDataSource ds = new JRBeanCollectionDataSource(items);	

        return ds;
    }
    
    
    
    
    
    
    
    
    public  JRDataSource getDataAccount() {
		// Create an array list of Sales 
		List<rpAccount> items = new ArrayList<rpAccount>();
		
                AccountDAO provider = (AccountDAO) new ClassPathXmlApplicationContext("hibernate.xml").getBean("accountDAO");
                
                List<Account> Data = provider.getList();

                rpAccount item0 = new rpAccount();
		item0.setName("Account: ");
		item0.setPhantram(""+Data.size());
                
                int NonActive = 0;
                for (Account acc : Data) {
                    if (acc.getEnable() == 0) {
                        NonActive++;
                    }
                }

		// Create first item
		rpAccount item1 = new rpAccount();
		item1.setName("Account Active:");
		item1.setPhantram((Data.size()-NonActive) + "(" +((Data.size()-NonActive)/Data.size())*100 +"%)");
		// Create second item
		rpAccount item2 = new rpAccount();
		item2.setName("Account Non-Active:");
		item2.setPhantram(NonActive + "(" +(NonActive/Data.size())*100 +"%)");
		
		// Add to list
                items.add(item0);
		items.add(item1);
		items.add(item2);
		
		// Wrap the collection in a JRBeanCollectionDataSource
		// This is one of the collections that Jasper understands
		JRDataSource ds = new JRBeanCollectionDataSource(items);	
		
		// Return the wrapped collection
		return ds;
	}

    
    public class rpSale{
        private String name;
        private String mota;
        private String phantram;
        private String time;

        /**
         * @return the name
         */
        public String getName() {
            return name;
        }

        /**
         * @param name the name to set
         */
        public void setName(String name) {
            this.name = name;
        }

        /**
         * @return the mota
         */
        public String getMota() {
            return mota;
        }

        /**
         * @param mota the mota to set
         */
        public void setMota(String mota) {
            this.mota = mota;
        }

        /**
         * @return the phantram
         */
        public String getPhantram() {
            return phantram;
        }

        /**
         * @param phantram the phantram to set
         */
        public void setPhantram(String phantram) {
            this.phantram = phantram;
        }

        /**
         * @return the time
         */
        public String getTime() {
            return time;
        }

        /**
         * @param time the time to set
         */
        public void setTime(String time) {
            this.time = time;
        }
    }
    
    
    
    public static class rpAccount {
	private String name;
	private String phantram;

        /**
         * @return the name
         */
        public String getName() {
            return name;
        }

        /**
         * @param name the name to set
         */
        public void setName(String name) {
            this.name = name;
        }

        /**
         * @return the phantram
         */
        public String getPhantram() {
            return phantram;
        }

        /**
         * @param phantram the phantram to set
         */
        public void setPhantram(String phantram) {
            this.phantram = phantram;
        }

	

	
}
    
}
