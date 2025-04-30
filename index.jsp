<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>ASCII Art Generator</title></head>
<body>
    <h2>Entrez un mot à transformer en ASCII Art :</h2>
    <form action="ascii" method="post">
        Mot : <input type="text" name="inputText" />
        <br/><br/>
        <input type="submit" value="Générer ASCII Art" />
    </form>
</body>
</html>
