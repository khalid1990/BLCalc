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
    <h2><fmt:message key="label.dashboard"/></h2>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.inventory"/>
        </div>

        <div class="panel-body">
            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.product.in.amount"/></label>
                <div class="col-sm-10">${totalProductsInAmount}</div>
            </div>

            <div class="row">
                <div class="col-sm-2">
                    <c:url var="productList" value="/product/list"/>

                    <a href="${productList}">
                        <fmt:message key="label.product.list"/>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.asset.in.cash"/>
        </div>

        <div class="panel-body">
            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.total.cash.in.hand"/></label>
                <div class="col-sm-10">${totalCashInHand}</div>
            </div>

            <table class="table">
                <c:forEach items="${investorToCashMap}" var="entry">
                    <tr>
                        <td>
                            <c:url var="investorUrl" value="/investor/show">
                                <c:param name="id" value="${entry.key.id}"/>
                            </c:url>
                            <a href="${investorUrl}">${entry.key.name}</a>
                        </td>
                        <td>${entry.value}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.total.due.bill.amount"/>
        </div>

        <div class="panel-body">
            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.total.due.bill.amount"/></label>
                <div class="col-sm-10">${totalDueBills}</div>
            </div>

            <h3>
                <fmt:message key="label.active.shipments"/>
            </h3>

            <table class="table">
                <thead>
                    <tr>
                        <th><fmt:message key="label.serial.no"/></th>
                        <th><fmt:message key="label.transport.vendor"/></th>
                        <th><fmt:message key="label.shipment.status"/></th>
                        <th><fmt:message key="label.shipment.date"/></th>
                        <th><fmt:message key="label.comment"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${activeShipments}" var="shipment">
                        <tr>
                            <td>
                                <c:url var="showUrl" value="/shipment/show">
                                    <c:param name="id" value="${shipment.id}"/>
                                </c:url>
                                <a href="${showUrl}">${shipment.id}</a>
                            </td>
                            <td>${shipment.transportVendor}#${shipment.serialNoWithTransportVendor}</td>
                            <td>${shipment.shipmentStatus}</td>
                            <td>${shipment.shipmentDate}</td>
                            <td>${shipment.comment}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>

