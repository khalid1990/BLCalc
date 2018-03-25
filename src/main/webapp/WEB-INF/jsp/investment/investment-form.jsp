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
    <script type="text/javascript">
        $( function() {
            $( ".date-field" ).datepicker();
        } );
    </script>
</head>

<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.investment"/>
        </div>

        <div class="panel-body">
            <c:if test="${investment.id != 0}">
                <c:url var="showUrl" value="/investment/show">
                    <c:param name="id" value="${investment.id}"/>
                </c:url>

                <a href="${showUrl}"><fmt:message key="label.back.to.show"/></a>
            </c:if>

            <form:form action="index" method="post" modelAttribute="investment">
                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.investment.investor"/></label>
                    <div class="col-sm-10">
                        <form:select path="investor" cssClass="form-control">
                            <form:options items="${investors}" itemValue="id" itemLabel="name"/>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.investment.type"/></label>
                    <div class="col-sm-10">
                        <form:select path="investmentType" cssClass="form-control">
                            <form:options items="${investmentTypes}"/>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.investment.amount"/></label>
                    <div class="col-sm-10">
                        <form:input path="amount" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.date"/></label>
                    <div class="col-sm-10">
                        <form:input path="date" cssClass="form-control date-field"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.description"/></label>
                    <div class="col-sm-10">
                        <form:textarea path="description" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <input type="submit" class="btn btn-default" name="_action_save"
                           value="<fmt:message key="label.save.or.update"/>">
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>

</html>

