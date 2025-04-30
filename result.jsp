<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Résultat ASCII</title></head>
<body>
    <h2>Résultat en ASCII Art :</h2>
    <pre>
<% 
    StringBuilder[] ascii = (StringBuilder[]) request.getAttribute("asciiResult");
    for (StringBuilder line : ascii) {
        out.println(line.toString());
    }
%>
    </pre>
    <br/>
    <a href="index.jsp">Retour</a>
</body>
</html>
