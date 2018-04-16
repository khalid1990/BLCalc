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
    <h2><fmt:message key="label.shipment"/></h2>
    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.shipment.general.information"/>
        </div>

        <div class="panel-body">
            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.transport.vendor"/></label>
                <div class="col-sm-10">${shipment.transportVendor}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.tv.shipment.serial.no"/></label>
                <div class="col-sm-10">${shipment.serialNoWithTransportVendor}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.shipment.status"/></label>
                <div class="col-sm-10">${shipment.shipmentStatus}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.shipment.date"/></label>
                <div class="col-sm-10">${shipment.shipmentDate}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.account"/></label>
                <div class="col-sm-10">${shipment.account.name}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.payment.date"/></label>
                <div class="col-sm-10">${shipment.paymentDate}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.shipment.payable.amount"/></label>
                <div class="col-sm-10">${payableAmount}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.shipment.amount.paid"/></label>
                <div class="col-sm-10">${shipment.amountPaid}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.comment"/></label>
                <div class="col-sm-10">${shipment.comment}</div>
            </div>
        </div>

        <div class="panel-footer">
            <div class="row">
                <div class="col-sm-2">
                    <c:url var="listUrl" value="/shipment/list"/>
                    <a href="${listUrl}" class="btn btn-default"><fmt:message key="label.shipment.shipment.list"/></a>
                </div>

                <div class="col-sm-2">
                    <c:url var="editUrl" value="/shipment/edit">
                        <c:param name="id" value="${shipment.id}"/>
                    </c:url>
                    <a href="${editUrl}" class="btn btn-default"><fmt:message key="label.edit"/></a>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.shipment.added.order"/>
        </div>

        <div class="panel-body">
            <table class="table table-bordered" id="dataTable">
                <thead>
                    <tr>
                        <th><fmt:message key="label.order.client.name"/></th>
                        <th><fmt:message key="label.order.address"/> & <fmt:message key="label.order.phone"/></th>
                        <th><fmt:message key="label.order.detail"/></th>
                        <th><fmt:message key="label.order.inside.dhaka"/></th>
                        <th><fmt:message key="label.order.comment"/></th>
                        <th><fmt:message key="label.action"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td>${order.clientName}</td>
                            <td>${order.address}<br>${order.phone}</td>
                            <td>${order.orderDetail}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.insideDhaka}">Yes</c:when>
                                    <c:otherwise>No</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${order.comment}</td>
                            <td>
                                <c:url var="removeFromShipment" value="/shipment/removeFromShipment">
                                    <c:param name="shipmentId" value="${shipment.id}"/>
                                    <c:param name="orderId" value="${order.id}"/>
                                </c:url>

                                <a href="${removeFromShipment}">
                                    <fmt:message key="label.shipment.remove.order"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.shipment.not.added"/>
        </div>

        <div class="panel-body">
            <table class="table table-bordered" id="dataTable">
                <thead>
                    <tr>
                        <th><fmt:message key="label.order.client.name"/></th>
                        <th><fmt:message key="label.order.address"/> & <fmt:message key="label.order.phone"/></th>
                        <th><fmt:message key="label.order.detail"/></th>
                        <th><fmt:message key="label.order.inside.dhaka"/></th>
                        <th><fmt:message key="label.order.comment"/></th>
                        <th><fmt:message key="label.action"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${unshippedOrders}" var="order">
                        <tr>
                            <td>${order.clientName}</td>
                            <td>${order.address}<br>${order.phone}</td>
                            <td>${order.orderDetail}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.insideDhaka}">Yes</c:when>
                                    <c:otherwise>No</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${order.comment}</td>
                            <td>
                                <c:url var="addToShipment" value="/shipment/addToShipment">
                                    <c:param name="shipmentId" value="${shipment.id}"/>
                                    <c:param name="orderId" value="${order.id}"/>
                                </c:url>

                                <a href="${addToShipment}">
                                    <fmt:message key="label.add.to.shipment"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>

