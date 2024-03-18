<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Teacher, com.auca.dao.TeacherDao, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Semester Management</title>
    
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    

    <form method="post" action="${pageContext.request.contextPath}/teachers">
    <h1>Delete a teacher</h1>
        <input type="hidden" name="action" value="delete">

        <label for="updateUnitId">Select Teacher ID to Update:</label>
        <select name="id" id="updateUnitId">
            <option value="" selected>Select an Teacher ID to Update</option>
            
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            TeacherDao teacherDao = new TeacherDao(em);
            List<Teacher> teacherList = teacherDao.findAll();
            
            for (Teacher unit : teacherList) {
            %>
                <option value="<%= unit.getId() %>"><%= unit.getId() %></option>
            <%
            }
            // Close the EntityManager here
            em.close();
            emf.close();
            %>
        </select>

        
        <input type="submit" value="Delete Teacher"class="form-button">
        
    </form>
</body>
</html>
