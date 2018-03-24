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
            <fmt:message key="label.shipment"/>
        </div>

        <div class="panel-body">
            <c:if test="${shipment.id != 0}">
                <c:url var="showUrl" value="/shipment/show">
                    <c:param name="id" value="${shipment.id}"/>
                </c:url>

                <a href="${showUrl}"><fmt:message key="label.back.to.show"/></a>
            </c:if>

            <form:form action="index" method="post" modelAttribute="shipment">
                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.transport.vendor"/></label>
                    <div class="col-sm-10">
                        <form:select path="transportVendor" cssClass="form-control">
                            <form:options items="${transportVendors}"/>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.tv.shipment.serial.no"/></label>
                    <div class="col-sm-10">
                        <form:input path="serialNoWithTransportVendor" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.shipment.status"/></label>
                    <div class="col-sm-10">
                        <form:select path="shipmentStatus" cssClass="form-control">
                            <form:options items="${shipmentStatuses}"/>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.shipment.date"/></label>
                    <div class="col-sm-10">
                        <form:input path="shipmentDate" cssClass="form-control date-field"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.shipment.payment.method"/></label>
                    <div class="col-sm-10">
                        <form:select path="paymentMethod" cssClass="form-control">
                            <form:options items="${paymentMethods}"/>
                        </form:select>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.payment.date"/></label>
                    <div class="col-sm-10">
                        <form:input path="paymentDate" cssClass="form-control date-field"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.shipment.payable.amount"/></label>
                    <div class="col-sm-10">
                        <form:input path="payableAmount" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.shipment.amount.paid"/></label>
                    <div class="col-sm-10">
                        <form:input path="amountPaid" cssClass="form-control"/>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.comment"/></label>
                    <div class="col-sm-10">
                        <form:input path="comment" cssClass="form-control"/>
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

