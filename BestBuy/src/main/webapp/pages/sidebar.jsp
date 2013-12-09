<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content-sidebar">
    <h4>Categories</h4>
    <ul>
        <c:forEach var="category" items="${Categories}">
            <li><a href="Store?Type=${category.categoryId}">${category.name}</a></li>
        </c:forEach>
    </ul>
    <h4>Search</h4>
    <form method='get' action='Store' class="contact-form">
        <select name='Price'>
            <option selected='selected' value=''>--Price--</option>
            <option value='1'>$149.99 and under</option>
            <option value='2'>$150-$249.99</option>
            <option value='3'>$250-$349.99</option>
            <option value='4'>$350 and up</option>
        </select>
        <select name='Brand'>
            <option selected='selected' value=''>--Brand--</option>
            <c:forEach var="brand" items="${Brands}">
                <option value="${brand.brandId}">${brand.name}</option>
            </c:forEach>
        </select>
        <select name='Type'>
            <option selected='selected' value=''>--TV Type--</option>
            <c:forEach var="category" items="${Categories}">
                <option value="${category.categoryId}">${category.name}</option>
            </c:forEach>
        </select>
        <select name='Rate'>
            <option selected='selected' value=''>--Rate--</option>
            <option value='1'>5 stars</option>
            <option value='2'>4 or more stars</option>
            <option value='3'>3 or more stars</option>
            <option value='4'>2 or more stars</option>
            <option value='5'>1 or more stars</option>
        </select>
        <select name='Size'>
            <option selected='selected' value=''>--Screen Size--</option>
            <option value='1'>29" and under</option>
            <option value='2'>30"-39"</option>
            <option value='3'>40"-49"</option>
            <option value='3'>50"-59"</option>
            <option value='4'>60" and up</option>
        </select>
        <div class="search-bar" style='float:none; background-color:transparent'>
            <input type="submit" value="Search" />
        </div>
    </form>
</div>