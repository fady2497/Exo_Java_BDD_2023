<%@ page import="classes.JeuPendu" %>
<%
    JeuPendu jeu = (JeuPendu) session.getAttribute("jeu");
    if (jeu == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Résultat du jeu</title>
</head>
<body>
    <h1>Résultat</h1>
    <% if (jeu.estGagne()) { %>
        <h2>Bravo, vous avez gagné ! Le mot était <%= jeu.getMotActuel() %></h2>
    <% } else { %>
        <h2>Dommage, vous avez perdu ! Le mot était <%= jeu.getMotActuel() %></h2>
    <% } %>

    <a href="index.jsp">Rejouer</a>
</body>
</html>
