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
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/DataTables/DataTables-1.10.16/css/jquery.dataTables.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/DataTables/DataTables-1.10.16/js/jquery.dataTables.js"/>"></script>
    <script>
        $(document).ready(function() {
            $("#dataTable").dataTable();
        });
    </script>
</head>

<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.invest.list"/>
            </div>

            <div class="panel-body">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <c:forEach items="${investorToInvestment}" var="entry">
                            <div class="row">
                                <label class="col-sm-2">${entry.key}</label>
                                <div class="col-sm-10">${entry.value}</div>
                            </div>
                        </c:forEach>

                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-body">
                        <c:forEach items="${investmentTypeToAmount}" var="entry">
                            <div class="row">
                                <label class="col-sm-2">${entry.key}</label>
                                <div class="col-sm-10">${entry.value}</div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <table class="table table-bordered" id="dataTable">
                    <thead>
                        <tr>
                            <td><fmt:message key="label.date"/></td>
                            <td><fmt:message key="label.investment.investor"/></td>
                            <td><fmt:message key="label.investment.amount"/></td>
                            <td><fmt:message key="label.investment.type"/></td>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${investments}" var="investment">
                            <tr>
                                <td>
                                    <c:url var="showUrl" value="/investment/show">
                                        <c:param name="id" value="${investment.id}"/>
                                    </c:url>

                                    <a href="${showUrl}">
                                        <fmt:formatDate value="${investment.date}" pattern="dd/MM/yyyy"/>
                                    </a>
                                </td>
                                <td>${investment.investor.name}</td>
                                <td>${investment.amount}</td>
                                <td>${investment.investmentType}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
