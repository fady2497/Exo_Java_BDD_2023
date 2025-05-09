<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les tableaux</h1>

<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres séparés par des espaces, exemple : 6 78 15</p>
    <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<%
    String chaine = request.getParameter("chaine");
    if (chaine != null && !chaine.trim().isEmpty()) {
        String[] tableauDeChiffres = chaine.trim().split("\\s+");

        if (tableauDeChiffres.length >= 1) {
            int[] valeurs = new int[tableauDeChiffres.length];
            for (int i = 0; i < tableauDeChiffres.length; i++) {
                try {
                    valeurs[i] = Integer.parseInt(tableauDeChiffres[i]);
                } catch (NumberFormatException e) {
                    valeurs[i] = 0;
                }
            }
%>

<p>Le tableau contient <%= valeurs.length %> valeurs</p>
<ul>
<% for (int i = 0; i < valeurs.length; i++) { %>
    <li>Chiffre <%= i + 1 %> : <%= valeurs[i] %></li>
<% } %>
</ul>

<h2>Exercice 1 : Le carré de la première valeur</h2>
<% if (valeurs.length >= 1) { %>
<p>Résultat : <%= valeurs[0] * valeurs[0] %></p>
<% } else { %>
<p>Pas assez de valeurs pour faire cet exercice.</p>
<% } %>

<h2>Exercice 2 : La somme des deux premières valeurs</h2>
<% if (valeurs.length >= 2) { %>
<p>Résultat : <%= valeurs[0] + valeurs[1] %></p>
<% } else { %>
<p>Pas assez de valeurs pour faire cet exercice.</p>
<% } %>

<h2>Exercice 3 : La somme de toutes les valeurs</h2>
<%
    int somme = 0;
    for (int v : valeurs) {
        somme += v;
    }
%>
<p>Résultat : <%= somme %></p>

<h2>Exercice 4 : La valeur maximum</h2>
<%
    int max = valeurs[0];
    for (int v : valeurs) {
        if (v > max) {
            max = v;
        }
    }
%>
<p>Résultat : <%= max %></p>

<h2>Exercice 5 : La valeur minimale</h2>
<%
    int min = valeurs[0];
    for (int v : valeurs) {
        if (v < min) {
            min = v;
        }
    }
%>
<p>Résultat : <%= min %></p>

<h2>Exercice 6 : La valeur la plus proche de 0</h2>
<%
    int procheDeZero = valeurs[0];
    for (int v : valeurs) {
        if (Math.abs(v) < Math.abs(procheDeZero)) {
            procheDeZero = v;
        }
    }
%>
<p>Résultat : <%= procheDeZero %></p>

<h2>Exercice 7 : La valeur la plus proche de 0 (préférence pour le positif en cas d'égalité)</h2>
<%
    int procheDeZero2 = valeurs[0];
    for (int v : valeurs) {
        if (Math.abs(v) < Math.abs(procheDeZero2) ||
            (Math.abs(v) == Math.abs(procheDeZero2) && v > procheDeZero2)) {
            procheDeZero2 = v;
        }
    }
%>
<p>Résultat : <%= procheDeZero2 %></p>

<%
        } else {
%>
<p>Merci de saisir au moins 1 chiffre pour pouvoir faire les exercices.</p>
<%
        }
    }
%>

<p><a href="index.html">Retour au sommaire</a></p>

</body>
</html>
