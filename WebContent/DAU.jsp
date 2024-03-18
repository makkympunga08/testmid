<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.AcademicUnit, com.auca.dao.AcademicUnitDao, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Delete Academic Unit</title>
    <link rel="stylesheet" type="text/css" href="semester.css">
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    

    <form method="post" action="${pageContext.request.contextPath}/academic-units">
    <h1>Delete Academic Unit</h1>
        <input type="hidden" name="action" value="delete">

        <label for="deleteUnitId">Select Academic Unit ID to Delete:</label>
        <select name="id" id="deleteUnitId">
            <option value="" selected>Select an Academic Unit ID to Delete</option>
            
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            AcademicUnitDao academicUnitDao = new AcademicUnitDao(em);
            List<AcademicUnit> academicUnitsList = academicUnitDao.findAll();
            
            for (AcademicUnit unit : academicUnitsList) {
            %>
                <option value="<%= unit.getId() %>"><%= unit.getId() %></option>
            <%
            }
            // Close the EntityManager here
            em.close();
            emf.close();
            %>
        </select>

        <input type="submit" value="Delete Academic Unit"class="form-button">
    </form>
</body>
</html>
