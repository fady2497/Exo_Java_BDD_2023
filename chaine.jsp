<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Déclaration de la chaîne
    String bonjour = "salut la compagnie";

    // Transformation en majuscules
    String enMajuscules = bonjour.toUpperCase();

    // Mettre la première lettre en majuscule
    String debutMajuscule = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1);
%>

<html>
<head>
    <title>Exercice JSP - Chaînes de caractères</title>
</head>
<body>
    <h1>Résultat de l'exercice sur les chaînes</h1>
    <p><strong>Texte d'origine :</strong> <%= bonjour %></p>
    <p><strong>En majuscules :</strong> <%= enMajuscules %></p>
    <p><strong>Première lettre en majuscule :</strong> <%= debutMajuscule %></p>
</body>
</html>
