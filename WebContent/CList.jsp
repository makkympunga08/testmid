<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Course, com.auca.model.Semester, com.auca.model.AcademicUnit, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>All Courses</title>
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    <h1>All Courses</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Semester</th>
            <th>Department</th>
        </tr>
        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            List<Course> courses = em.createQuery("SELECT c FROM Course c", Course.class).getResultList();
            for (Course course : courses) {
        %>
        <tr>
            <td><%= course.getId() %></td>
            <td><%= course.getName() %></td>
            <td><%= course.getSemester().getName() %></td>
            <td><%= course.getDepartment().getName() %></td>
        </tr>
        <%
            }
            em.close();
            emf.close();
        %>
    </table>
</body>
</html>
