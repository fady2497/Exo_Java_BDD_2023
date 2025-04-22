<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Les chaînes</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaînes de caractères</h1>

    <form action="#" method="post">
        <p>Saisir une chaîne (minimum 6 caractères) :
        <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

<%
    String chaine = request.getParameter("chaine");

    if (chaine != null && !chaine.isEmpty()) {
%>
    <h2>Informations de base</h2>
<%
        if (chaine.length() < 6) {
%>
        <p style="color:red;">La chaîne doit contenir au moins 6 caractères !</p>
<%
        } else {
            int longueurChaine = chaine.length();
            char caractereExtrait = chaine.charAt(2); // 3ème caractère
            String sousChaine = chaine.substring(2, 6);
            int positionE = chaine.indexOf('e');
%>
            <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères.</p>
            <p>Le 3e caractère de votre chaîne est : <%= caractereExtrait %></p>
            <p>Une sous-chaîne de votre texte (positions 3 à 6) : <%= sousChaine %></p>
            <p>Le premier 'e' est à la position : <%= positionE %></p>

    <h2>Exercice 1 : Combien de 'e' ?</h2>
<%
            int compteurE = 0;
            for (int i = 0; i < chaine.length(); i++) {
                if (chaine.charAt(i) == 'e' || chaine.charAt(i) == 'E') {
                    compteurE++;
                }
            }
%>
            <p>Il y a <%= compteurE %> lettre(s) 'e' dans votre chaîne.</p>

    <h2>Exercice 2 : Affichage vertical</h2>
<%
            for (int i = 0; i < chaine.length(); i++) {
%>
            <%= chaine.charAt(i) %><br/>
<%
            }
%>

    <h2>Exercice 3 : Retour à la ligne sur les espaces</h2>
<%
            String[] mots = chaine.split(" ");
            for (String mot : mots) {
%>
            <%= mot %><br/>
<%
            }
%>

    <h2>Exercice 4 : Une lettre sur deux</h2>
<%
            StringBuilder lettreSurDeux = new StringBuilder();
            for (int i = 0; i < chaine.length(); i += 2) {
                lettreSurDeux.append(chaine.charAt(i));
            }
%>
            <p><%= lettreSurDeux.toString() %></p>

    <h2>Exercice 5 : Texte en verlant</h2>
<%
            StringBuilder reverse = new StringBuilder(chaine);
%>
            <p><%= reverse.reverse().toString() %></p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
<%
            int voyelles = 0;
            int consonnes = 0;
            for (int i = 0; i < chaine.length(); i++) {
                char c = Character.toLowerCase(chaine.charAt(i));
                if (Character.isLetter(c)) {
                    if ("aeiouy".indexOf(c) >= 0) {
                        voyelles++;
                    } else {
                        consonnes++;
                    }
                }
            }
%>
            <p>Nombre de voyelles : <%= voyelles %></p>
            <p>Nombre de consonnes : <%= consonnes %></p>
<%
        } // fin du else
    } // fin du if chaine != null
%>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
