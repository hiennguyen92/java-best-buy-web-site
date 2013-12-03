<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content-sidebar">
    <h4>Categories</h4>
    <ul>
        <c:forEach var="category" items="${Categories}">
            <li><a href="#">${category.name}</a></li>
        </c:forEach>
    </ul>
    <h4>Search</h4>
    <form method='get' action='Search'>
        <select name='Price'>
            <option selected='selected' value=''>--Price--</option>
            <option value='option1'>From 0 to 60$</option>
            <option value='option2'>From 61 to 120$</option>
            <option value='option3'>Higher than 120$</option>
        </select>
        <select name='Brand'>
            <option selected='selected' value=''>--Brand--</option>
            <option value='option1'>From 0 to 60$</option>
            <option value='option2'>From 61 to 120$</option>
            <option value='option3'>Higher than 120$</option>
        </select>
        <select name='Rate'>
            <option selected='selected' value=''>--Rate--</option>
            <option value='option1'>From 0 to 60$</option>
            <option value='option2'>From 61 to 120$</option>
            <option value='option3'>Higher than 120$</option>
        </select>
        <div class="search-bar" style='float:none; background-color:transparent'>
            <input type="submit" value="Search" />
        </div>
    </form>
</div>