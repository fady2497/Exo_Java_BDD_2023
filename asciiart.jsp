<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Java (lettres + chiffres)</title>
    <style>
        textarea {
            font-family: monospace;
            width: 100%;
            height: 180px;
            background: #f0f0f0;
        }
        input {
            font-size: 16px;
            padding: 5px;
            width: 50%;
        }
    </style>
</head>
<body>

<h2>Générateur ASCII Art (Java côté serveur)</h2>

<form method="post">
    <input type="text" name="text" placeholder="Tape ici ton texte (ex: LE 123)">
    <input type="submit" value="Générer">
</form>

<%
    String inputText = request.getParameter("text");
    if (inputText != null) {
        inputText = inputText.toUpperCase();

        Map<Character, String[]> asciiArt = new HashMap<>();
        asciiArt.put('A', new String[]{" #  ", "# # ", "### ", "# # ", "# # "});
        asciiArt.put('B', new String[]{"##  ", "# # ", "##  ", "# # ", "##  "});
        asciiArt.put('C', new String[]{" ## ", "#   ", "#   ", "#   ", " ## "});
        asciiArt.put('D', new String[]{"##  ", "# # ", "# # ", "# # ", "##  "});
        asciiArt.put('E', new String[]{"### ", "#   ", "##  ", "#   ", "### "});
        asciiArt.put('F', new String[]{"### ", "#   ", "##  ", "#   ", "#   "});
        asciiArt.put('G', new String[]{" ## ", "#   ", "# # ", "# # ", " ## "});
        asciiArt.put('H', new String[]{"# # ", "# # ", "### ", "# # ", "# # "});
        asciiArt.put('I', new String[]{"### ", " #  ", " #  ", " #  ", "### "});
        asciiArt.put('J', new String[]{"  # ", "  # ", "  # ", "# # ", " #  "});
        asciiArt.put('K', new String[]{"# # ", "##  ", "#   ", "##  ", "# # "});
        asciiArt.put('L', new String[]{"#   ", "#   ", "#   ", "#   ", "### "});
        asciiArt.put('M', new String[]{"# # ", "### ", "### ", "# # ", "# # "});
        asciiArt.put('N', new String[]{"# # ", "### ", "### ", "### ", "# # "});
        asciiArt.put('O', new String[]{" #  ", "# # ", "# # ", "# # ", " #  "});
        asciiArt.put('P', new String[]{"##  ", "# # ", "##  ", "#   ", "#   "});
        asciiArt.put('Q', new String[]{" ## ", "# # ", "# # ", " ## ", "  # "});
        asciiArt.put('R', new String[]{"##  ", "# # ", "##  ", "##  ", "# # "});
        asciiArt.put('S', new String[]{" ## ", "#   ", " #  ", "  # ", "##  "});
        asciiArt.put('T', new String[]{"### ", " #  ", " #  ", " #  ", " #  "});
        asciiArt.put('U', new String[]{"# # ", "# # ", "# # ", "# # ", "### "});
        asciiArt.put('V', new String[]{"# # ", "# # ", "# # ", "# # ", " #  "});
        asciiArt.put('W', new String[]{"# # ", "# # ", "### ", "### ", "# # "});
        asciiArt.put('X', new String[]{"# # ", "# # ", " #  ", "# # ", "# # "});
        asciiArt.put('Y', new String[]{"# # ", "# # ", " #  ", " #  ", " #  "});
        asciiArt.put('Z', new String[]{"### ", "  # ", " #  ", "#   ", "### "});
        asciiArt.put('0', new String[]{"### ", "# # ", "# # ", "# # ", "### "});
        asciiArt.put('1', new String[]{" #  ", "##  ", " #  ", " #  ", "### "});
        asciiArt.put('2', new String[]{"### ", "  # ", " #  ", "#   ", "### "});
        asciiArt.put('3', new String[]{"### ", "  # ", " ## ", "  # ", "### "});
        asciiArt.put('4', new String[]{"# # ", "# # ", "### ", "  # ", "  # "});
        asciiArt.put('5', new String[]{"### ", "#   ", "##  ", "  # ", "##  "});
        asciiArt.put('6', new String[]{" ## ", "#   ", "##  ", "# # ", "##  "});
        asciiArt.put('7', new String[]{"### ", "  # ", " #  ", "#   ", "#   "});
        asciiArt.put('8', new String[]{"### ", "# # ", "### ", "# # ", "### "});
        asciiArt.put('9', new String[]{"##  ", "# # ", "##  ", "  # ", " #  "});
        asciiArt.put(' ', new String[]{"    ", "    ", "    ", "    ", "    "});
        asciiArt.put('?', new String[]{"??? ", "??? ", "??? ", "??? ", "??? "});

        String[] output = {"", "", "", "", ""};

        for (char c : inputText.toCharArray()) {
            String[] art = asciiArt.getOrDefault(c, asciiArt.get('?'));
            for (int i = 0; i < 5; i++) {
                output[i] += art[i] + " ";
            }
        }
%>

<h3>Résultat :</h3>
<textarea readonly>
<%= output[0] %>
<%= output[1] %>
<%= output[2] %>
<%= output[3] %>
<%= output[4] %>
</textarea>

<% } %>

</body>
</html>
