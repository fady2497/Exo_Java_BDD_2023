<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les tableaux</h1>
<form action="#" method="post">
    <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<%
    String chaine = request.getParameter("chaine");

    if (chaine != null && !chaine.trim().isEmpty()) {
        String[] tableauDeChiffres = chaine.trim().split("\\s+");
        int[] valeurs = new int[tableauDeChiffres.length];

        for (int i = 0; i < tableauDeChiffres.length; i++) {
            try {
                valeurs[i] = Integer.parseInt(tableauDeChiffres[i]);
            } catch (NumberFormatException e) {
                valeurs[i] = 0; // Défaut si non entier
            }
        }
%>
    <p>Le tableau contient <%= valeurs.length %> valeurs :</p>
    <ul>
        <% for (int i = 0; i < valeurs.length; i++) { %>
            <li>Chiffre <%= (i + 1) %> : <%= valeurs[i] %></li>
        <% } %>
    </ul>

    <h2>Exercice 1 : Le carré de la première valeur</h2>
    <p><%= valeurs[0] * valeurs[0] %></p>

    <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
    <p><%= valeurs[0] + valeurs[1] %></p>

    <h2>Exercice 3 : La somme de toutes les valeurs</h2>
    <%
        int somme = 0;
        for (int v : valeurs) {
            somme += v;
        }
    %>
    <p><%= somme %></p>

    <h2>Exercice 4 : La valeur maximum</h2>
    <%
        int max = valeurs[0];
        for (int v : valeurs) {
            if (v > max) {
                max = v;
            }
        }
    %>
    <p><%= max %></p>

    <h2>Exercice 5 : La valeur minimale</h2>
    <%
        int min = valeurs[0];
        for (int v : valeurs) {
            if (v < min) {
                min = v;
            }
        }
    %>
    <p><%= min %></p>

    <h2>Exercice 6 : La valeur la plus proche de 0</h2>
    <%
        int procheDeZero = valeurs[0];
        for (int v : valeurs) {
            if (Math.abs(v) < Math.abs(procheDeZero)) {
                procheDeZero = v;
            }
        }
    %>
    <p><%= procheDeZero %></p>

    <h2>Exercice 7 : La valeur la plus proche de 0 (avec préférence au positif)</h2>
    <%
        int procheDeZero2 = valeurs[0];
        for (int v : valeurs) {
            if (Math.abs(v) < Math.abs(procheDeZero2) || (Math.abs(v) == Math.abs(procheDeZero2) && v > procheDeZero2)) {
                procheDeZero2 = v;
            }
        }
    %>
    <p><%= procheDeZero2 %></p>

<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
