<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.monprojet.Task"%>

<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body bgcolor="white">
    <h1>Liste des Tâches</h1>

    <!-- Formulaire d'ajout de tâche -->
    <form action="taches.jsp" method="post">
        <label for="taskTitle">Titre de la tâche : </label>
        <input type="text" id="taskTitle" name="taskTitle" required><br>

        <label for="taskDescription">Description de la tâche : </label>
        <input type="text" id="taskDescription" name="taskDescription" required><br>

        <label for="taskDueDate">Date d'échéance (format YYYY-MM-DD) : </label>
        <input type="date" id="taskDueDate" name="taskDueDate" required><br>

        <input type="submit" value="Ajouter la tâche">
    </form>

    <hr>

    <h2>Liste des Tâches :</h2>
    <%
