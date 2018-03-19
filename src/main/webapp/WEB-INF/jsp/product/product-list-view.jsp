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
    <script type="text/javascript" src="<c:url value="/resources/DataTables/DataTables-1.10.16/js/jquery.dataTables.js"/>"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.12.1/jquery-ui.css"/> "/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.7-dist/css/bootstrap.css"/> "/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/DataTables/DataTables-1.10.16/css/jquery.dataTables.css"/>"/>
    <script>
        $(document).ready(function() {
            $("#dataTable").dataTable();
        });
    </script>

    <style type="text/css">
        .container {
            position: relative;
            width: 80%;
            height: auto;
            overflow: auto;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <fmt:message key="label.products"/>
        </div>

        <div class="panel-body">
            <table class="table table-striped" id="dataTable">
                <thead>
                    <tr>
                        <th><fmt:message key="label.product.name"/></th>
                        <th><fmt:message key="label.product.source.id"/></th>
                        <th><fmt:message key="label.product.buying.price"/></th>
                        <th><fmt:message key="label.product.selling.price"/></th>
                        <th><fmt:message key="label.product.stock"/></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td>
                                <c:url var="showUrl" value="/product/show">
                                    <c:param name="id" value="${product.id}"/>
                                </c:url>
                                <a href="${showUrl}">${product.name}</a>
                            </td>
                            <td>${product.sourceId}</td>
                            <td>${product.buyingPrice}</td>
                            <td>${product.sellingPrice}</td>
                            <td>${product.stock}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>
