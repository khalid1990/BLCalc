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
    <script>
        $( function() {
            $( ".date-field" ).datepicker();
        } );
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
                <fmt:message key="label.product"/>
            </div>

            <div class="panel-body">
                <c:url var="productList" value="/product/list"/>
                <a href="${productList}">
                    <fmt:message key="label.product.list"/>
                </a>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.bl.id"/></label>
                    <div class="col-sm-10">${product.blId}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.source.id"/></label>
                    <div class="col-sm-10">${product.sourceId}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.name"/></label>
                    <div class="col-sm-10">${product.name}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.image.url"/></label>
                    <div class="col-sm-10">
                        <img src="${product.imageUrl}" height="200" width="200">
                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.url"/></label>
                    <div class="col-sm-10">${product.prodUrl}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.buying.price"/></label>
                    <div class="col-sm-10">${product.buyingPrice}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.selling.price"/></label>
                    <div class="col-sm-10">${product.sellingPrice}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.type"/></label>
                    <div class="col-sm-10">${product.productType}</div>
                </div>


                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.material"/></label>
                    <div class="col-sm-10">${product.material}</div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.product.discontinued"/></label>
                    <div class="col-sm-10">
                        <c:choose>
                            <c:when test="${product.discontinued}">
                                <c:out value="YES"/>
                            </c:when>
                            <c:otherwise>
                                <c:out value="NO"/>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

                <div class="row">
                    <label class="col-sm-2"><fmt:message key="label.description"/></label>
                    <div class="col-sm-10">${product.stock}</div>
                </div>

                <div class="row">
                    <c:url var="editLink" value="/product/edit">
                        <c:param name="id" value="${product.id}"/>
                    </c:url>

                    <a href="${editLink}" class="btn btn-default">
                        <fmt:message key="label.edit"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
