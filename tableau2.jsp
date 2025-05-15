<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    // Initialiser ou récupérer la session
    HttpSession session = request.getSession(true);

    // Récupérer le tableau depuis la session ou le créer s'il n'existe pas
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<>();
        session.setAttribute("tableau", tableau);
    }

    String action = request.getParameter("action");
    String message = "";

    // Gérer les actions de l'utilisateur
    if ("ajouter".equals(action)) {
        try {
            int valeur = Integer.parseInt(request.getParameter("valeur"));
            if (tableau.size() < 10) {
                tableau.add(valeur);
                message = "Valeur ajoutée avec succès.";
            } else {
                message = "Erreur : le tableau est plein (10 éléments max).";
            }
        } catch (Exception e) {
            message = "Erreur : entrez une valeur entière valide.";
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "Dernière valeur supprimée.";
        } else {
            message = "Erreur : le tableau est déjà vide.";
        }
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "Tableau vidé avec succès.";
    }
%>

<html>
<head>
    <title>Manipulation de tableau</title>
    <style>
        body { font-family: Arial; background: #f0f0f0; padding: 20px; }
        h1 { color: #333; }
        form { margin-bottom: 20px; }
        .msg { font-weight: bold; color: #006600; }
        .error { color: red; }
        .tableau { background: #fff; padding: 10px; border: 1px solid #ccc; }
    </style>
</head>
<body>
    <h1>Tableau interactif (max 10 éléments)</h1>

    <form method="post">
        <input type="number" name="valeur" placeholder="Entrez un entier" />
        <button type="submit" name="action" value="ajouter">Ajouter</button>
        <button type="submit" name="action" value="supprimer">Supprimer dernière valeur</button>
        <button type="submit" name="action" value="afficher">Afficher tableau</button>
        <button type="submit" name="action" value="vider">Vider tableau</button>
    </form>

    <% if (!message.isEmpty()) { %>
        <p class="msg"><%= message %></p>
    <% } %>

    <div class="tableau">
        <h3>Contenu du tableau :</h3>
        <ul>
        <% for (Integer val : tableau) { %>
            <li><%= val %></li>
        <% } %>
        </ul>
        <p><strong>Taille :</strong> <%= tableau.size() %>/10</p>
    </div>
</body>
</html>
