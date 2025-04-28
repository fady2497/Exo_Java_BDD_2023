<%@ page import="java.util.*" %>
<%
    String motSecret = (String) session.getAttribute("motSecret");
    char[] motActuel = (char[]) session.getAttribute("motActuel");
    List<Character> lettresProposees = (List<Character>) session.getAttribute("lettresProposees");
    Integer essaisRestants = (Integer) session.getAttribute("essaisRestants");

    if (motSecret == null) {
        
        String[] mots = {"PENDU", "JAVA", "ELEPHANT", "ORDINATEUR", "PROGRAMME", "INTERNET", "BANANE", "TOMATE", "VOITURE", "MONTAGNE"};
        Random rand = new Random();
        motSecret = mots[rand.nextInt(mots.length)];
        motActuel = new char[motSecret.length()];
        Arrays.fill(motActuel, '_');
        lettresProposes = new ArrayList<Character>();
        essaisRestants = 6;

        session.setAttribute("motSecret", motSecret);
        session.setAttribute("motActuel", motActuel);
        session.setAttribute("lettresProposes", lettresProposes);
        session.setAttribute("essaisRestants", essaisRestants);
    }

    String lettrePropose = request.getParameter("lettre");
    if (lettreProposee != null && lettreProposee.length() == 1) {
        char lettre = Character.toUpperCase(lettreProposee.charAt(0));
        if (!lettresProposes.contains(lettre)) {
            lettresProposes.add(lettre);
            boolean trouve = false;
            for (int i = 0; i < motSecret.length(); i++) {
                if (motSecret.charAt(i) == lettre) {
                    motActuel[i] = lettre;
                    trouve = true;
                }
            }
            if (!trouve) {
                essaisRestants--;
            }

            session.setAttribute("motActuel", motActuel);
            session.setAttribute("lettresProposes", lettresProposes);
            session.setAttribute("essaisRestants", essaisRestants);
        }
    }

    boolean gagne = motSecret.equals(new String(motActuel));
    boolean perdu = essaisRestants <= 0;
%>

<html>
<head>
    <title>Jeu du Pendu</title>
</head>
<body>
    <h1>Jeu du Pendu</h1>

    <% if (gagne) { %>
        <h2>Bravo ! Vous avez gagné ! Le mot était <%= motSecret %>.</h2>
        <a href="JeuPendu.jsp">Rejouer</a>
        <% session.invalidate(); %>
    <% } else if (perdu) { %>
        <h2>Dommage... Vous avez perdu. Le mot était <%= motSecret %>.</h2>
        <a href="JeuPendu.jsp">Rejouer</a>
        <% session.invalidate(); %>
    <% } else { %>
        <p>Mot actuel : 
            <% for (char c : motActuel) { %>
                <%= c %> 
            <% } %>
        </p>
        <p>Lettres proposés : <%= lettresProposes %></p>
        <p>Essais restants : <%= essaisRestants %></p>

        <form method="post">
            Proposez une lettre : <input type="text" name="lettre" maxlength="1" required>
            <input type="submit" value="Envoyer">
        </form>
    <% } %>
</body>
</html>
