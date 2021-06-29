<%--
  Created by IntelliJ IDEA.
  User: cgrandval2021
  Date: 23/06/2021
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Profil utilisateur</title>
</head>
<body>

<jsp:include page="/WEB-INF/fragments/header.jsp"/>

<table>
    <tbody>

    <!-- cette page est accessible par 2 voies : via la navbar "mon profil" : afficher le profil de l'utilisateur connecté
    via un lien sur le pseudo d'un vendeur : afficher le profil d'un autre utilisateur-->
    <tr>
        <td>Pseudo : </td>
        <td>${empty vendeur ? utilisateur.pseudo : vendeur.pseudo} </td>
    </tr>
    <tr>
        <td>Nom : </td>
        <td>${empty vendeur ? utilisateur.nom : vendeur.nom} </td>
    </tr>
    <tr>
        <td>Prénom : </td>
        <td>${empty vendeur ? utilisateur.prenom : vendeur.prenom}</td>
    </tr>
    <tr>
        <td>Email : </td>
        <td>${empty vendeur ? utilisateur.email : vendeur.email} </td>
    </tr>
    <tr>
        <td>Telephone : </td>
        <td>${empty vendeur ? utilisateur.telephone : vendeur.telephone} </td>
    </tr>
    <tr>
        <td>Rue : </td>
        <td>${empty vendeur ? utilisateur.rue : vendeur.rue} </td>
    </tr>
    <tr>
        <td>Code postal : </td>
        <td>${empty vendeur ? utilisateur.codePostal : vendeur.codePostal} </td>
    </tr>
    <tr>
        <td>Ville : </td>
        <td>${empty vendeur ? utilisateur.ville : vendeur.ville} </td>
    </tr>
    </tbody>
</table>

<a href="accueil">Retour vers l'accueil</a>
<!-- gérer le bouton modifier si on est connecté / problème lors de l'affichage du profil de quelqu'un d'autre-->
<c:if test="${sessionScope.utilisateur == vendeur}">
    <a href="<%=request.getContextPath()%>/monprofil">Modifier mon profil</a>
</c:if>

<c:if test="${sessionScope.utilisateur.pseudo == vendeur.pseudo }">
    <a href="<%=request.getContextPath()%>/monprofil">Modifier</a>
</c:if>

</body>
</html>
