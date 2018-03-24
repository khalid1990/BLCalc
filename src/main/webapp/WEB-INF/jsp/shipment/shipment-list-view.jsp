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
            <fmt:message key="label.shipments"/>
        </div>

        <div class="panel-body">
            <table class="table table-bordered" id="dataTable">
                <thead>
                    <tr>
                        <th><fmt:message key="label.serial.no"/></th>
                        <th><fmt:message key="label.transport.vendor"/></th>
                        <th><fmt:message key="label.shipment.status"/></th>
                        <th><fmt:message key="label.shipment.date"/></th>
                        <th><fmt:message key="label.shipment.payable.amount"/></th>
                        <th><fmt:message key="label.comment"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${shipments}" var="shipment">
                        <tr>
                            <td>${shipment.id}</td>
                            <td>${shipment.transportVendor}#${shipment.serialNoWithTransportVendor}</td>
                            <td>${shipment.shipmentStatus}</td>
                            <td>${shipment.shipmentDate}</td>
                            <td>${shipment.payableAmount}</td>
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

