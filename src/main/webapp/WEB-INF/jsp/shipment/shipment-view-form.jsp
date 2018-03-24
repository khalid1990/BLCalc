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
            <fmt:message key="label.shipment"/>
        </div>

        <div class="panel-body">
            <a href="<c:url value="/shipment/list"/>"><fmt:message key="label.shipment.shipment.list"/></a>

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
                <label class="col-sm-2"><fmt:message key="label.shipment.payment.method"/></label>
                <div class="col-sm-10">${shipment.paymentMethod}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.payment.date"/></label>
                <div class="col-sm-10">${shipment.paymentDate}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.shipment.payable.amount"/></label>
                <div class="col-sm-10">${shipment.payableAmount}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.shipment.amount.paid"/></label>
                <div class="col-sm-10">${shipment.amountPaid}</div>
            </div>

            <div class="row">
                <label class="col-sm-2"><fmt:message key="label.comment"/></label>
                <div class="col-sm-10">${shipment.comment}</div>
            </div>

            <div class="row">
                <c:url var="editUrl" value="/shipment/edit">
                    <c:param name="id" value="${shipment.id}"/>
                </c:url>

                <a href="${editUrl}"><fmt:message key="label.edit"/></a>
            </div>
        </div>
    </div>
</div>
</body>

</html>

