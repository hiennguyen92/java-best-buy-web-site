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
                    <td style="width: 25%">Cart</td>
                    <td></td>
                </tr>
                <tr>

                    <td >
                        <c:url value="/Service/download/account/AccountReportPDF" var="AccountReportPDF"/>
                        <a href="${AccountReportPDF}">Download PDF</a>
                        <br>
                        <c:url value="/Service/download/account/AccountReportXLS" var="AccountReportXLS"/>
                        <a href="${AccountReportXLS}">Download EXCEL</a>
                    </td>
                    
                    <td >
                        <c:url value="/Service/download/product/ProductReportPDF" var="ProductReportPDF"/>
                        <a href="${ProductReportPDF}">Download PDF</a>
                        <br>
                        <c:url value="/Service/download/product/ProductReportXLS" var="ProductReportXLS"/>
                        <a href="${ProductReportXLS}">Download EXCEL</a>
                    </td>
                    
                    <td >
                        <c:url value="/Service/download/saleoff/SaleOffReportPDF" var="SaleOffReportPDF"/>
                        <a href="${SaleOffReportPDF}">Download PDF</a>
                        <br>
                        <c:url value="/Service/download/saleoff/SaleOffReportXLS" var="SaleOffReportXLS"/>
                        <a href="${SaleOffReportXLS}">Download EXCEL</a>
                    </td>
                   <td >
                       <c:url value="/Service/download/cart/CartReportPDF" var="CartReportPDF"/>
                        <a href="${CartReportPDF}">Download PDF</a>
                        <br>
                        <c:url value="/Service/download/cart/CartReportXLS" var="CartReportXLS"/>
                        <a href="${CartReportXLS}">Download EXCEL</a>
                    </td>
                    
                </tr>
                
            </tbody>
        </table>
    </div>
</div>