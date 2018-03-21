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
    <script type="text/javascript" src="<c:url value="/resources/DataTables/DataTables-1.10.16/js/jquery.dataTables.js"/>"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/DataTables/DataTables-1.10.16/css/jquery.dataTables.css"/>"/>
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
            <fmt:message key="label.orders"/>
        </div>

        <div class="panel-body">
            <table class="table table-bordered" id="dataTable">
                <thead>
                    <tr>
                        <th><fmt:message key="label.order.system.id"/></th>
                        <th><fmt:message key="label.order.client.name"/></th>
                        <th><fmt:message key="label.order.address"/> & <fmt:message key="label.order.phone"/></th>
                        <th><fmt:message key="label.order.detail"/></th>
                        <th><fmt:message key="label.order.inside.dhaka"/></th>
                        <th><fmt:message key="label.order.transport.vendor"/></th>
                        <th><fmt:message key="label.order.status"/></th>
                        <th><fmt:message key="label.order.comment"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td>${order.systemId}</td>
                            <td>${order.clientName}</td>
                            <td>${order.address}<br>${order.phone}</td>
                            <td>${order.orderDetail}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.insideDhaka}">Yes</c:when>
                                    <c:otherwise>No</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${order.transportVendor}</td>
                            <td>${order.orderStatus}</td>
                            <td>${order.comment}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>
