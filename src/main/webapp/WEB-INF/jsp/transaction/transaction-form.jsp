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
    <form:form action="saveTransaction" method="post" modelAttribute="transaction">
        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.transaction"/>
            </div>

            <div class="panel-body">
                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.transaction.date"/></label>
                    <div class="col-sm-10">
                        <form:input path="transactionDate" cssClass="form-control date-field"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.transaction.type"/></label>
                    <div class="col-sm-10">
                        <form:select path="transactionType" cssClass="form-control">
                            <form:options items="${transactions}"/>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.amount"/></label>
                    <div class="col-sm-10">
                        <form:input path="amount" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.description"/></label>
                    <div class="col-sm-6">
                        <form:textarea path="description" cssClass="form-control"/>
                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="row">
                    <div class="col-sm-2">
                        <input class="btn btn-default" type="submit" name="_action_add_transaction"
                               value="<fmt:message key="label.save.or.update"/>">
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</div>
</body>

</html>

