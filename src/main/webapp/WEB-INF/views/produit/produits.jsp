<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>myCatalog</title>
    
    <link rel="icon" type="image/png" href="${context}/resources/img/favicon.png" />
    <link href="${context}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" >
    <link href="${context}/resources/vendor/fontawesome/css/all.min.css" rel="stylesheet" type="text/css" >
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="${context}/resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="${context}/resources/vendor/fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    
    <script src="${context}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${context}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${context}/resources/vendor/fancybox/jquery.fancybox.pack.js"></script>
	<script src="${context}/resources/js/modal.js"></script>
	<script>
		$().ready(function(){
			$('#confirm-delete').on('show.bs.modal', function(e) {
			    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
			});
			$(".iframe").click(function(){
				$.fancybox.open({
				    href: $(this).attr('data-href'),
				    width : 500,
				    afterClose : function(){location.reload();},
				    type: 'iframe'
				});
			});
		});
	</script>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>MyCatalog</h1>
	 	<p>Bienvenue sur l'application MyCatalog !</p> 
	</div>
	<section class="generic-container">
		<h1>Produits</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nom</th>
					<th>prix</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${produits}" var="produit">
					<tr>
						<td>${produit.idProduit}</td>
						<td>${produit.nomProduit}</td>
						<td>${produit.prix} &euro;</td>
						<td class="text-right">
							<a href="#" data-href="${context}/produit/edit/${produit.idProduit}" class="btn btn-primary iframe"><i class="fas fa-edit"></i>Editer</a>
							<a href="#" data-href="${context}/produit/delete?id=${produit.idProduit}" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete"><i class="fas fa-trash-alt"></i>Supprimer</a> 			
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-right">
			<button id="btnNew" type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal"><i class="fas fa-plus"></i>Nouveau produit</button>
		</div>
		<div id="addModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Nouveau produit</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<f:form id="addForm" class="form-horizontal" modelAttribute="produit" method="post"	action="${context}/produit/save">
							<div class="form-group">
								<label for="nomProduit">Nom du produit</label><br />
								<f:input type="text" class="form-control input-sm" path="nomProduit" placeholder="Nom" required="required" />
								<div class="has-error">
									<f:errors path="nomProduit" class="help-inline" />
								</div>
							</div>
							<div class="form-group">
								<label for="prix">Prix du produit</label><br>
								<f:input type="number" class="form-control input-sm" path="prix" placeholder="prix" required="required" />
								<div class="has-error">
									<f:errors path="prix" class="help-inline" />
								</div>
							</div>
							<div class="form-group text-right">
								<input type="submit" value="Enregistrer" class="btn btn-primary btn-sm" />
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="confirm-delete" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">Suppresion</div>
					<div class="modal-body">Supprimer définitivement ce produit?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
						<a class="btn btn-danger btn-ok">Supprimer</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>