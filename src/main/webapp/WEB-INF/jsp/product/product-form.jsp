<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="forn" uri="http://www.springframework.org/tags/form" %>

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
</head>

<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <fmt:message key="label.product"/>
            </div>

            <div class="panel-body">
                <c:if test="${product.id != 0}">
                    <c:url var="showUrl" value="/product/show">
                        <c:param name="id" value="${product.id}"/>
                    </c:url>

                    <a href="${showUrl}"><fmt:message key="label.back.to.show"/></a>
                </c:if>
                
                <form:form action="index" method="post" enctype="multipart/form-data" modelAttribute="product" cssClass="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.bl.id"/> </label>
                        <form:input path="blId" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.source.id"/> </label>
                        <form:input path="sourceId" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.name"/> </label>
                        <form:input path="name" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.image.url"/> </label>
                        <form:input path="imageUrl" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.url"/> </label>
                        <form:input path="prodUrl" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.buying.price"/> </label>
                        <form:input path="buyingPrice" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.selling.price"/> </label>
                        <form:input path="sellingPrice" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.type"/> </label>
                        <form:select path="productType" cssClass="col-sm-10 form-control">
                            <form:options items="${productTypes}"/>
                        </form:select>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.material"/> </label>
                        <form:select path="material" cssClass="col-sm-10 form-control">
                            <form:options items="${materials}"/>
                        </form:select>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.stock"/> </label>
                        <form:input path="stock" cssClass="col-sm-10 form-control"/>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.product.discontinued"/> </label>
                        <form:checkbox path="discontinued" />
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2"> <fmt:message key="label.description"/> </label>
                        <form:textarea path="description" cssClass="col-sm-10 form-control"/>
                    </div>

                    <input type="submit" name="_action_save" class="btn btn-primary">
                </form:form>
            </div>
        </div>
    </div>
</body>

</html>
