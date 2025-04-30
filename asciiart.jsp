<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Générateur ASCII Art</title>
    <style>
        body {
            font-family: monospace;
            background-color: #f0f0f0;
            padding: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        input[type=text] {
            padding: 8px;
            font-size: 16px;
        }
        input[type=submit] {
            padding: 8px 12px;
            font-size: 16px;
            cursor: pointer;
        }
        pre {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 15px;
            display: inline-block;
        }
    </style>
</head>
<body>
    <h1>ASCII Art en Java/JSP</h1>

    <form method="get">
        <label for="inputText">Texte à convertir :</label><br>
        <input type="text" id="inputText" name="inputText" value="<%= request.getParameter("inputText") != null ? request.getParameter("inputText") : "" %>" />
        <input type="submit" value="Générer ASCII Art" />
    </form>

<%
    String input = request.getParameter("inputText");
    if (input != null && !input.trim().isEmpty()) {
        input = input.toUpperCase();

        int L = 4; // largeur d’une lettre
        int H = 5; // hauteur des lettres

        String[] asciiLetters = {
            " #  ##   ##  # # ### ###  ##  ### ###  ##  ### ###  # # ### ### # # ### ### ### ", // Ligne 0
            "# # # # #   # # #   #   # #    #     # # # #   #   # # # # #   # # #   #   # # ", // Ligne 1
            "### ##  #   ### ### ###  #  ##  ###   # ### ### ### ### ###   # ###  ##  ### ",   // Ligne 2
            "# # # # #   # # #     # #   # # # #   # # #   #   #   # # #   # # # #    # # ",   // Ligne 3
            "# # ##   ## # # ### ###  ##  ### # #  ##  ### ###   #   #   ##  ### ### ### "    // Ligne 4
        };

        StringBuilder[] output = new StringBuilder[H];
        for (int i = 0; i < H; i++) {
            output[i] = new StringBuilder();
        }

        for (char c : input.toCharArray()) {
            int index = (c >= 'A' && c <= 'Z') ? (c - 'A') : 26; // 26 = "?" pour les caractères non alphabétiques

            for (int i = 0; i < H; i++) {
                output[i].append(asciiLetters[i].substring(index * L, (index + 1) * L));
            }
        }
%>
    <h2>Résultat :</h2>
    <pre>
<%
        for (int i = 0; i < H; i++) {
            out.println(output[i].toString());
        }
    }
%>
    </pre>
</body>
</html>
