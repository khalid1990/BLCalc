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
                <div class="col-sm-10">${investor.name}</div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="row">
                <div class="col-sm-2">
                    <c:url var="editUrl" value="/investor/edit">
                        <c:param name="id" value="${investor.id}"/>
                    </c:url>

                    <a href="${editUrl}" class="btn btn-default">
                        <fmt:message key="label.edit"/>
                    </a>
                </div>

                <div class="col-sm-2">
                    <c:url var="createAccount" value="/investor/createAccount">
                        <c:param name="investorId" value="${investor.id}"/>
                    </c:url>

                    <a href="${createAccount}"><fmt:message key="label.create.account"/></a>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.accounts"/>
        </div>

        <div class="panel-body">

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.order.total.amount"/></label>
                <div class="col-sm-10">
                    ${totalAmount}
                </div>
            </div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <td><fmt:message key="label.account"/></td>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${investor.accounts}" var="account">
                        <tr>
                            <td>
                                <c:url var="showAccount" value="/investor/showAccount">
                                    <c:param name="id" value="${account.id}"/>
                                </c:url>

                                <a href="${showAccount}">${account.name}</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.investment.list"/>
        </div>

        <div class="panel-body">
            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.total.investment"/></label>
                <div class="col-sm-10">
                    ${totalInvestment}
                </div>
            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th><fmt:message key="label.serial.no"/></th>
                        <th><fmt:message key="label.date"/></th>
                        <th><fmt:message key="label.investment.type"/></th>
                        <th><fmt:message key="label.amount"/></th>
                        <th><fmt:message key="label.description"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${investor.investments}" var="investment">
                        <tr>
                            <td>
                                <c:url var="showUrl" value="/investment/show">
                                    <c:param name="id" value="${investment.id}"/>
                                </c:url>
                                <a href="${showUrl}">${investment.id}</a>
                            </td>

                            <td><fmt:formatDate value="${investment.date}" pattern="dd/MM/yyyy"/></td>

                            <td>${investment.investmentType}</td>

                            <td>${investment.amount}</td>

                            <td>${investment.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>

