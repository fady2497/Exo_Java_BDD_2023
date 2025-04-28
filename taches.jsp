public class Task {
    private String title;
    private String description;
    private String dueDate;
    private boolean isCompleted;

    public Task(String title, String description, String dueDate) {
        this.title = title;
        this.description = description;
        this.dueDate = dueDate;
        this.isCompleted = false;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getDueDate() {
        return dueDate;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void markAsCompleted() {
        this.isCompleted = true;
    }

    @Override
    public String toString() {
        return "Titre: " + title + " | Description: " + description + " | Date d'échéance: " + dueDate + " | Statut: " + (isCompleted ? "Terminée" : "Non terminée");
    }
}
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskTitle = request.getParameter("taskTitle");
        String taskDescription = request.getParameter("taskDescription");
        String taskDueDate = request.getParameter("taskDueDate");

        // Récupérer la liste des tâches de la session
        List<Task> tasks = (List<Task>) request.getSession().getAttribute("tasks");
        if (tasks == null) {
            tasks = new ArrayList<>();
            request.getSession().setAttribute("tasks", tasks);
        }

        if (taskTitle != null && !taskTitle.isEmpty()) {
            Task newTask = new Task(taskTitle, taskDescription, taskDueDate);
            tasks.add(newTask);
        }

        // Rediriger vers la page JSP pour afficher la liste des tâches
        response.sendRedirect("tasks.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Rediriger vers la page d'affichage des tâches
        RequestDispatcher dispatcher = request.getRequestDispatcher("tasks.jsp");
        dispatcher.forward(request, response);
    }
}
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Task"%>

<html>
<head>
    <title>Liste des Tâches</title>
</head>
<body bgcolor="white">
    <h1>Liste des Tâches</h1>

    <!-- Formulaire d'ajout de tâche -->
    <form action="TaskServlet" method="post">
        <label for="taskTitle">Titre de la tâche : </label>
        <input type="text" id="taskTitle" name="taskTitle" required><br>

        <label for="taskDescription">Description de la tâche : </label>
        <input type="text" id="taskDescription" name="taskDescription" required><br>

        <label for="taskDueDate">Date d'échéance (format YYYY-MM-DD) : </label>
        <input type="date" id="taskDueDate" name="taskDueDate" required><br>

        <input type="submit" value="Ajouter la tâche">
    </form>

    <h2>Liste des Tâches :</h2>
    <%
        List<Task> tasks = (List<Task>) session.getAttribute("tasks");

        if (tasks != null && !tasks.isEmpty()) {
            for (Task task : tasks) {
                out.println("<p>" + task.getTitle() + " - " + task.getDescription() + " (Date d'échéance: " + task.getDueDate() + ") - Statut: " + (task.isCompleted() ? "Terminée" : "Non terminée") + "</p>");
            }
        } else {
            out.println("<p>Aucune tâche à afficher.</p>");
        }
    %>

</body>
</html>
