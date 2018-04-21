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
            <fmt:message key="label.account"/>
        </div>

        <div class="panel-body">

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.account.name"/></label>

                <div class="col-sm-10">${account.name}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.total.amount"/></label>

                <div class="col-sm-10">${totalAmount}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.investor"/></label>

                <div class="col-sm-10">
                    ${account.investor.name}
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="row">
                <div class="col-sm-2">
                    <c:url var="backToInvestor" value="/investor/show">
                        <c:param name="id" value="${account.investor.id}"/>
                    </c:url>

                    <a href="${backToInvestor}"><fmt:message key="label.back.to.investor"/></a>
                </div>

                <div class="col-sm-2">
                    <c:url var="addTransaction" value="/investor/addTransaction">
                        <c:param name="accountId" value="${account.id}"/>
                    </c:url>

                    <a href="${addTransaction}">
                        <fmt:message key="label.add.transaction"/>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.transactions"/>
        </div>

        <div class="panel-body">
            <table class="table">
                <thead>
                    <tr>
                        <td><fmt:message key="label.transaction.date"/></td>
                        <td><fmt:message key="label.amount"/></td>
                        <td><fmt:message key="label.transaction.type"/></td>
                        <td><fmt:message key="label.description"/></td>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${transactions}" var="transaction">
                        <tr>
                            <td><fmt:formatDate value="${transaction.transactionDate}" pattern="dd/MM/yyyy"/></td>
                            <td>${transaction.amount}</td>
                            <td>${transaction.transactionType}</td>
                            <td>${transaction.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>

