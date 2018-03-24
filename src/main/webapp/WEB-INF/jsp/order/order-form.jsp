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
    <script>
        $( function() {
            $( ".date-field" ).datepicker();
        } );
    </script>
</head>

<body>
    <div class="container">

        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.order"/>
            </div>

            <div class="panel-body">
                <c:if test="${order.id != 0}">
                    <c:url var="showUrl" value="/order/show">
                        <c:param name="id" value="${order.id}"/>
                    </c:url>

                    <a href="${showUrl}"><fmt:message key="label.back.to.show"/></a>
                </c:if>

                <form:form action="index" method="post" modelAttribute="order">
                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.system.id"/></label>
                        <div class="col-sm-10"><form:input path="systemId" cssClass="form-control"/></div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.client.name"/></label>
                        <div class="col-sm-10"><form:input path="clientName" cssClass="form-control"/></div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.client.fb.id"/></label>
                        <div class="col-sm-10"><form:input path="clientFbId" cssClass="form-control"/></div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.address"/></label>
                        <div class="col-sm-10"><form:input path="address" cssClass="form-control"/></div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.phone"/></label>
                        <div class="col-sm-10"><form:input path="phone" cssClass="form-control"/></div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.detail"/></label>
                        <div class="col-sm-10"><form:input path="orderDetail" cssClass="form-control"/></div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.inside.dhaka"/></label>
                        <div class="col-sm-10">
                            <form:checkbox path="insideDhaka" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.transport.vendor"/></label>
                        <div class="col-sm-10">
                            <form:select path="transportVendor" cssClass="form-control">
                                <form:options items="${transportVendors}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.status"/></label>
                        <div class="col-sm-10">
                            <form:select path="orderStatus" cssClass="form-control">
                                <form:options items="${orderStatuses}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.delivery.charge"/></label>
                        <div class="col-sm-10">
                            <form:input path="deliveryCharge" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.discount.amount"/></label>
                        <div class="col-sm-10">
                            <form:input path="discountAmount" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.total.amount"/></label>
                        <div class="col-sm-10">
                            <form:input path="totalAmount" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.net.benefit"/></label>
                        <div class="col-sm-10">
                            <form:input path="netBenefit" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2"><fmt:message key="label.order.comment"/></label>
                        <div class="col-sm-10">
                            <form:input path="comment" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="row">
                        <input type="submit" class="btn btn-default" name="_action_save" value="Save/Update">
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>

</html>
