<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.3.1.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.7-dist/js/bootstrap.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.12.1/jquery-ui.js"/> "></script>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.12.1/jquery-ui.css"/> "/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.7-dist/css/bootstrap.css"/> "/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/site.css"/> "/>
</head>

<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.investor"/>
        </div>

        <div class="panel-body">
            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.investor.name"/></label>
                <div class="col-sm-10">
                    ${investor.name}
                </div>
            </div>

            <div class="row">
                <c:url var="editUrl" value="/investor/edit">
                    <c:param name="id" value="${investor.id}"/>
                </c:url>

                <a href="${editUrl}" class="btn btn-default">
                    <fmt:message key="label.edit"/>
                </a>
                <input class="btn btn-default" type="submit" name="_action_save"
                       value="<fmt:message key="label.save.or.update"/>">
            </div>
        </div>
    </div>
</div>
</body>

</html>

