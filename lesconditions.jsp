<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les conditions</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les conditions</h1>

    <form action="#" method="post">
        <p>Saisir la valeur 1 (A) : <input type="text" id="valeur1" name="valeur1"></p>
        <p>Saisir la valeur 2 (B) : <input type="text" id="valeur2" name="valeur2"></p>
        <p>Saisir la valeur 3 (C) : <input type="text" id="valeur3" name="valeur3"></p>
        <p>Saisir un nombre pour savoir s'il est pair ou impair : <input type="text" id="valeurPair" name="valeurPair"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

<%
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");
    String valeurPair = request.getParameter("valeurPair");

    if (valeur1 != null && valeur2 != null && !valeur1.isEmpty() && !valeur2.isEmpty()) {
        int intValeur1 = Integer.parseInt(valeur1);
        int intValeur2 = Integer.parseInt(valeur2);
%>
        <h2>Comparaison entre deux valeurs</h2>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
<%
    }

    if (valeur1 != null && valeur2 != null && valeur3 != null &&
        !valeur1.isEmpty() && !valeur2.isEmpty() && !valeur3.isEmpty()) {

        int A = Integer.parseInt(valeur1);
        int B = Integer.parseInt(valeur2);
        int C = Integer.parseInt(valeur3);
%>
        <h2>Exercice 1 : Comparaison de C entre A et B</h2>
        <p>
            <% if ((C >= A && C <= B) || (C >= B && C <= A)) { %>
                Oui, C = <%= C %> est compris entre A = <%= A %> et B = <%= B %>.
            <% } else { %>
                Non, C = <%= C %> n'est pas compris entre A = <%= A %> et B = <%= B %>.
            <% } %>
        </p>
<%
    }

    if (valeurPair != null && !valeurPair.isEmpty()) {
        int nombre = Integer.parseInt(valeurPair);
%>
        <h2>Exercice 2 : Pair ou impair</h2>
        <p>
            <% if (nombre % 2 == 0) { %>
                Le nombre <%= nombre %> est **pair**.
            <% } else { %>
                Le nombre <%= nombre %> est **impair**.
            <% } %>
        </p>
<%
    }
%>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
