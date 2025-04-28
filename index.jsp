<%@ page import="classes.JeuPendu" %>
<%
    JeuPendu jeu = new JeuPendu();
    session.setAttribute("jeu", jeu);
    response.sendRedirect("pendu.jsp");
%>
