<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    // Initialiser la session
    HttpSession session = request.getSession();

    // Initialiser le tableau
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<>();
        session.setAttribute("tableau", tableau);
    }

    // Gérer les actions
    String action = request.getParameter("action");
    String message = "";

    if ("ajouter".equals(action)) {
        String valStr = request.getParameter("valeur");
        if (valStr != null && !valStr.isEmpty()) {
            try {
                int val = Integer.parseInt(valStr);
                if (tableau.size() < 10) {
                    tableau.add(val);
                    message = "✅ Valeur ajoutée avec succès.";
                } else {
                    message = "❌ Tableau plein (10 éléments max).";
                }
            } catch (NumberFormatException e) {
                message = "❌ Entrez une valeur entière valide.";
            }
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "✅ Dernière valeur supprimée.";
        } else {
            message = "❌ Tableau déjà vide.";
        }
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "✅ Tableau vidé avec succès.";
    }
%>

<html>
<head>
    <title>Exercice 2 - Tableaux</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 20px; }
        h1 { color: #333; }
        .msg { font-weight: bold; margin-top: 10px; }
        .msg:before { content: "ℹ "; }
        ul { background: #fff; padding: 10px; border: 1px solid #ccc; }
    </style>
</head>
<body>
    <h1>Gestion d'un tableau d'entiers</h1>

    <form method="post">
        <input type="number" name="valeur" placeholder="Nouvelle valeur" />
        <button type="submit" name="action" value="ajouter">Ajouter</button>
        <button type="submit" name="action" value="supprimer">Supprimer dernière valeur</button>
        <button type="submit" name="action" value="vider">Vider le tableau</button>
    </form>

    <div class="msg"><%= message %></div>

    <h3>Contenu actuel du tableau (<%= tableau.size() %>/10) :</h3>
    <ul>
        <% for (Integer val : tableau) { %>
            <li><%= val %></li>
        <% } %>
    </ul>
</body>
</html>
