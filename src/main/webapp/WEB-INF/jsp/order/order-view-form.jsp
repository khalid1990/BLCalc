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
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/site.css"/>">
    <style type="text/css">
        .add-prod {
            font-size: 24px;
            color: green;
            cursor: pointer;
        }

        .remove-prod {
            font-size: 24px;
            color: red;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="container">
        <a href="<c:url var="listUrl" value="/order/list"/>">
            <fmt:message key="label.order.list"/>
        </a>

        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.order"/>
            </div>

            <div class="panel-body">
                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.system.id"/></label>
                    <div class="col-sm-10">
                        <c:url var="orderShowUrl" value="/order/show">
                            <c:param name="id" value="${order.id}"/>
                        </c:url>

                        <a href="${orderShowUrl}">${order.systemId}</a>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.client.name"/></label>
                    <div class="col-sm-10">${order.clientName}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.client.fb.id"/></label>
                    <div class="col-sm-10">${order.clientFbId}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.address"/></label>
                    <div class="col-sm-10">${order.address}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.phone"/></label>
                    <div class="col-sm-10">${order.phone}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.detail"/></label>
                    <div class="col-sm-10">${order.orderDetail}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.inside.dhaka"/></label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${order.insideDhaka}">Yes</c:when>
                            <c:otherwise>No</c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.transport.vendor"/></label>
                    <div class="col-sm-10">${order.transportVendor}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.status"/></label>
                    <div class="col-sm-10">${order.orderStatus}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.delivery.charge"/></label>
                    <div class="col-sm-10">${order.deliveryCharge}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.discount.amount"/></label>
                    <div class="col-sm-10">${order.discountAmount}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.total.amount"/></label>
                    <div class="col-sm-10">${order.totalAmount}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.net.benefit"/></label>
                    <div class="col-sm-10">${order.netBenefit}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.order.comment"/></label>
                    <div class="col-sm-10">${order.comment}</div>
                </div>

                <div class="row">
                    <c:url var="editUrl" value="/order/edit">
                        <c:param name="id" value="${order.id}"/>
                    </c:url>

                    <a href="${editUrl}"><fmt:message key="label.edit"/></a>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.added.products"/>
            </div>

            <div class="panel-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <td><fmt:message key="label.product.bl.id"/></td>
                            <td><fmt:message key="label.product.name"/></td>
                            <td><fmt:message key="label.count"/></td>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${addedProducts}" var="opc">
                            <tr>
                                <td>${opc.product.blId}</td>
                                <td>${opc.product.name}</td>
                                <td>${opc.count}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.products"/>
            </div>

            <div class="panel-body">
                <table class="table table-bordered" id="dataTable">
                    <thead>
                        <tr>
                            <td><fmt:message key="label.product.bl.id"/></td>
                            <td><fmt:message key="label.product.name"/></td>
                            <td><fmt:message key="label.add.or.remove"/></td>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td>${product.blId}</td>
                                <td>${product.name}</td>
                                <td>
                                    <c:url var="addProductToOrder" value="/order/addProduct">
                                        <c:param name="orderId" value="${order.id}"/>
                                        <c:param name="productId" value="${product.id}"/>
                                    </c:url>

                                    <a href="${addProductToOrder}">
                                        <span class="glyphicon glyphicon-plus add-prod"></span>
                                    </a>

                                    <c:url var="removeProductFromOrder" value="/order/removeProduct">
                                        <c:param name="orderId" value="${order.id}"/>
                                        <c:param name="productId" value="${product.id}"/>
                                    </c:url>

                                    <a href="${removeProductFromOrder}">
                                        <span class="glyphicon glyphicon-minus remove-prod"></span>
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
