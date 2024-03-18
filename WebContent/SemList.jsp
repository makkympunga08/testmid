<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Semester, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>All Semesters</title>
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    <h1>All Semesters</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Start Date</th>
            <th>End Date</th>
        </tr>
        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            List<Semester> semesters = em.createQuery("SELECT s FROM Semester s", Semester.class).getResultList();
            for (Semester semester : semesters) {
        %>
        <tr>
            <td><%= semester.getId() %></td>
            <td><%= semester.getName() %></td>
            <td><%= semester.getStartDate() %></td>
            <td><%= semester.getEndDate() %></td>
        </tr>
        <%
            }
            em.close();
            emf.close();
        %>
    </table>
</body>
</html>
