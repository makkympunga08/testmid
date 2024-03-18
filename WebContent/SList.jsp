<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Student, com.auca.model.AcademicUnit, com.auca.model.Semester, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Student Details List</title>
</head>
<body>
    <h1>All Students</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Telephone</th>
        </tr>
        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            List<Student> activeStudents = em.createQuery("SELECT s FROM Student s", Student.class).getResultList();
            for (Student student : activeStudents) {
         %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getDob() %></td>
            <td><%= student.getTelephone() %></td>
        </tr>
        <%
            }
            em.close();
            emf.close();
        %>
    </table>
</body>
</html>