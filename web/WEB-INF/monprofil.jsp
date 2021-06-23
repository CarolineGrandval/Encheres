<%--
  Created by IntelliJ IDEA.
  User: cgrandval2021
  Date: 22/06/2021
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="fr.eni.messages.LecteurErreur" %>

<html>
<head>
    <title>Profil</title>
</head>
<body>

<h1>Mon profil</h1>

<!--! créer une servlet profil / récupérer les infos de la session -->
<form action="${pageContext.request.contextPath}/monprofil" method="post">
    <label for="pseudo">Pseudo :</label>
    <input type="text" name="pseudo" id="pseudo" placeholder="pseudo" value="${sessionScope.utilisateur.pseudo}">
    <label for="prenom">Prénom :</label>
    <input type="text" name="prenom" id="prenom" placeholder="prenom" value="${sessionScope.utilisateur.prenom}">
    <label for="nom">Nom :</label>
    <input type="text" name="nom" id="nom" placeholder="nom" value="${sessionScope.utilisateur.nom}">
    <label for="email">Email :</label>
    <input type="email" name="email" id="email" placeholder="email" value="${sessionScope.utilisateur.email}">
    <label for="telephone">Téléphone :</label>
    <input type="tel" name="telephone" id="telephone" placeholder="telephone" value="${sessionScope.utilisateur.telephone}">
    <label for="rue">Rue :</label>
    <input type="text" name="rue" id="rue" placeholder="rue" value="${sessionScope.utilisateur.rue}">
    <label for="codepostal">Code postal :</label>
    <input type="text" name="cp" id="codepostal" placeholder="code postal" value="${sessionScope.utilisateur.codePostal}">
    <label for="ville">Ville :</label>
    <input type="text" name="ville" id="ville" placeholder="ville" value="${sessionScope.utilisateur.ville}">
    <label for="pass">Mot de passe :</label>
    <input type="password" name="password" id="pass" placeholder="mot de passe">
    <label for="confpass">Confirmation  :</label>
    <input type="password" name="passwordConf" id="confpass" placeholder="confirmez le mot de passe">
    <p>Crédit : ${sessionScope.utilisateur.credit}</p>
    <input type="submit" value="Enregistrer">
    <a href="${pageContext.request.contextPath}/supp"><button>Supprimer mon compte</button></a>

</form>

</body>
</html>
