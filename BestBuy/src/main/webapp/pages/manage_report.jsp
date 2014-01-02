<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<link href="<s:url value="/css/cart.css"/>" rel="stylesheet" />
<link href="<s:url value="/css/style1.css"/>" rel="stylesheet" />
<div class="content">
    <div class="content-grids">
        <h4>Manage Reports</h4>
        <table class="productcart"><!--************************ begin productcart ************************-->

            <tbody>
                <tr class="firstrow">
                    <td class="firstcol" style="width: 25%">Account</td>
                    <td style="width: 25%">Product</td>
                    <td style="width: 25%">Sale Off</td>
                    <td style="width: 25%">Card</td>
                    <td></td>
                </tr>
                <tr>

                    <td >
                        <a href="/BestBuy/Service/download/account/pdf">Download PDF</a>
                        <br>
                        <a href="/BestBuy/Service/download/account/xls">Download EXCEL</a>
                    </td>
                    
                    <td >
                        <a href="/BestBuy/Service/download/product/pdf">Download PDF</a>
                        <br>
                        <a href="/BestBuy/Service/download/product/xls">Download EXCEL</a>
                    </td>
                    
                    <td >
                        <a href="/BestBuy/Service/download/saleoff/pdf">Download PDF</a>
                        <br>
                        <a href="/BestBuy/Service/download/saleoff/xls">Download EXCEL</a>
                    </td>
                   <td >
                        <a href="/BestBuy/Service/download/cart/pdf">Download PDF</a>
                        <br>
                        <a href="/BestBuy/Service/download/cart/xls">Download EXCEL</a>
                    </td>
                    
                </tr>
                
            </tbody>
        </table>
    </div>
</div>