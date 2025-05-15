<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manipulation de chaînes</title>
</head>
<body>
<%
    String bonjour = "salut la compagnie";

    // Affichage en majuscules
    String majuscules = bonjour.toUpperCase();

    // Fonction pour mettre la première lettre en majuscule
    String capitaliser(String texte) {
        if (texte == null || texte.isEmpty()) return texte;
        return texte.substring(0, 1).toUpperCase() + texte.substring(1).toLowerCase();
    }

    String capitalise = capitaliser(bonjour);
%>

<h2>Original :</h2>
<p><%= bonjour %></p>

<h2>Majuscules :</h2>
<p><%= majuscules %></p>

<h2>Première lettre en majuscule :</h2>
<p><%= capitalise %></p>

</body>
</html>
