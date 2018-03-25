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
            <c:if test="${investor.id != 0}">
                <c:url var="showUrl" value="/investor/show">
                    <c:param name="id" value="${investor.id}"/>
                </c:url>

                <a href="${showUrl}"><fmt:message key="label.back.to.show"/></a>
            </c:if>

            <form:form action="index" method="post" modelAttribute="investor">
                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.investor.name"/></label>
                    <div class="col-sm-10">
                        <form:input path="name" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <input class="btn btn-default" type="submit" name="_action_save"
                           value="<fmt:message key="label.save.or.update"/>">
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>

</html>

