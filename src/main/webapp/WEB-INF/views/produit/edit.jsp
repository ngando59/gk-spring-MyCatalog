<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>myCatalog</title>
    <link rel="icon" type="image/png" href="${context}/resources/img/favicon.png" />
    <link href="${context}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${context}/resources/vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="${context}/resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="${context}/resources/vendor/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    
    <script src="${context}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${context}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${context}/resources/vendor/fancybox/jquery.fancybox.pack.js"></script>
	<script src="${context}/resources/js/modal.js"></script>

</head>
<body>
    <div class="dialog">
        <div class="dialog-content">
            <div class="dialog-header">
                <h4 class="dialog-title">Mise à jour produit</h4>
            </div>
            <c:if test="${messageSuccess != null}">
            	<div class="padding15">
            		<div class="bg-success text-white text-center radius10">${messageSuccess}</div>
            	</div>         	
            </c:if>
            <c:if test="${messageError != null}">
            	<div class="padding15">
            		<div class="bg-danger text-white text-center radius10">${messageSuccess}</div>
            	</div>         	
            </c:if>
            <div class="dialog-body">
                <f:form id="updateForm" modelAttribute="produit" method="post" action="${context}/produit/save">
                    <f:input path="idProduit" type="hidden"/>
                    <div class="form-group">
                        <label for="nomProduit">Nom du produit</label><br />
                        <f:input type="text" class="form-control input-sm" path="nomProduit" placeholder="Nom" required="required"/>
                        <div class="has-error">
                            <f:errors path="nomProduit" class="help-inline"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="prix">Prix du produit</label><br>
                        <f:input type="number" class="form-control input-sm" path="prix" placeholder="prix" required="required"/>
                        <div class="has-error">
                            <f:errors path="prix" class="help-inline"/>
                        </div>
                    </div>
                    <div class="form-group text-right">
                        <input type="submit" value="Mettre à jour" class="btn btn-primary btn-sm" />
                    </div>
                </f:form>
            </div>
        </div>
    </div>
</body>
</html>
