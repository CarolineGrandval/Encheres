<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="fr.eni.messages.LecteurErreur" %>

<html>
<head>
    <link rel="stylesheet" href="styles/initialize.min.css">
    <link type="text/css" rel="stylesheet" href="./styles/styles.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chewy&display=swap" rel="stylesheet">

    <title>Profil</title>
</head>
<body>
<jsp:include page="/WEB-INF/fragments/header.jsp"/>

<h1 class="text-center text-white" style="font-family:'Chewy', cursive;">Modifier mon profil</h1>

<div class="d-flex justify-content-center text-white py-2">
    <div class="row w-75">
        <!-- affichage des messages d'erreur éventuels -->
        <div class="d-flex justify-content-center row py-2">
            <c:if test="${!empty listeCodesErreur}">
                <p class="alert alert-danger" role="alert"><strong>Erreur(s) lors de la mise à jour des données
                    :</strong>
                </p>
                <ul class="alert alert-danger" role="alert">
                    <c:forEach var="code" items="${listeCodesErreur}">
                        <li>${LecteurErreur.getMessageErreur(code)}</li>
                    </c:forEach>
                </ul>
            </c:if>
            <!-- affichage message de confirmation -->
            <c:if test="${!empty message}">
                <p class="alert alert-success" role="alert"><strong>${message}</strong></p>
            </c:if>
        </div>
        <div class="col md-10 mx-auto">
            <form action="${pageContext.request.contextPath}/monprofil" method="post">
                <div class="form-group row">
                    <div class="col-sm-4">
                        <label class="col-form-label" for="pseudo">Pseudo :</label>
                        <input class="form-control" type="text" name="pseudo" id="pseudo" placeholder="pseudo"
                               value="${sessionScope.utilisateur.pseudo}">
                    </div>
                    <div class="col-sm-4">
                        <label class="col-form-label" for="prenom">Prénom :</label>
                        <input class="form-control" type="text" name="prenom" id="prenom" placeholder="prenom"
                               value="${sessionScope.utilisateur.prenom}" disabled>
                    </div>
                    <div class="col-sm-4">
                        <label class="col-form-label" for="nom">Nom :</label>
                        <input class="form-control" type="text" name="nom" id="nom" placeholder="nom"
                               value="${sessionScope.utilisateur.nom}" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-4">
                        <label class="col-form-label" for="email">Email :</label>
                        <input class="form-control" type="email" name="email" id="email" placeholder="email"
                               value="${sessionScope.utilisateur.email}">
                    </div>
                    <div class="col-sm-4">
                        <label class="col-form-label" for="telephone">Téléphone :</label>
                        <input class="form-control" type="tel" name="telephone" id="telephone"
                               placeholder="telephone" value="${sessionScope.utilisateur.telephone}">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-4">
                        <label class="col-form-label" for="rue">Rue :</label>
                        <input class="form-control" class="form-control" type="text" name="rue" id="rue"
                               placeholder="rue"
                               value="${sessionScope.utilisateur.rue}">
                    </div>
                    <div class="col-sm-4">
                        <label class="col-form-label" for="codepostal">Code postal :</label>
                        <input class="form-control" type="text" name="cp" id="codepostal"
                               placeholder="code postal"
                               value="${sessionScope.utilisateur.codePostal}">
                    </div>
                    <div class="col-sm-4">
                        <label class="col-form-label" for="ville">Ville :</label>
                        <input class="form-control" type="text" name="ville" id="ville" placeholder="ville"
                               value="${sessionScope.utilisateur.ville}">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-4">
                        <label class="col-form-label" for="pass">Mot de passe :</label>
                        <input class="form-control" type="password" name="password" id="pass"
                               placeholder="mot de passe"
                               value="${sessionScope.utilisateur.motDePasse}">
                    </div>
                    <div class="col-sm-4">
                        <label class="col-form-label" for="confpass">Confirmation :</label>
                        <input class="form-control" type="password" name="passwordConf" id="confpass"
                               placeholder="confirmez le mot de passe"
                               value="${sessionScope.utilisateur.motDePasse}">
                    </div>
                    <div class="col-sm-4">
                        <p class="col-form-label"> Crédit : </p>
                        <p class="form-control">${sessionScope.utilisateur.credit}</p>
                    </div>
                </div>

                <div class="d-flex justify-content-center">
                <div class="row">
                    <div class="col-sm">
                        <button class="btn btn-primary w-500" type="submit">Valider</button>
                    </div>
                </div>
                </div>
            </form>

            <div class="d-flex justify-content-center">
                <a href="${pageContext.request.contextPath}/supp">
                    <button class="btn btn-danger mx-10" style="margin: 20px">Supprimer mon compte</button>
                </a>
                <div class="d-flex justify-content-center">
                    <a href="${pageContext.request.contextPath}/accueil">
                        <button class="btn btn-secondary" style="margin: 20px">Retour</button>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/fragments/footer.jsp"/>
</body>
</html>
