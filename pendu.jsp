<%@ page import="classes.JeuPendu" %>
<%
    JeuPendu jeu = (JeuPendu) session.getAttribute("jeu");
    if (jeu == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String lettreParam = request.getParameter("lettre");
    if (lettreParam != null && lettreParam.length() == 1) {
        jeu.proposerLettre(lettreParam.charAt(0));
        if (jeu.estGagne() || jeu.estPerdu()) {
            response.sendRedirect("resultat.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Jeu du Pendu</title>
</head>
<body>
    <h1>Jeu du Pendu</h1>
    <p>Mot : <%= jeu.getMotActuel() %></p>
    <p>Lettres proposées : <%= jeu.getLettresProposees() %></p>
    <p>Essais restants : <%= jeu.getEssaisRestants() %></p>

    <form method="post" action="pendu.jsp">
        Proposer une lettre : <input type="text" name="lettre" maxlength="1" required>
        <input type="submit" value="Envoyer">
    </form>
</body>
</html>
