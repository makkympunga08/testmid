<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Semester, com.auca.dao.SemesterDao, com.auca.model.Student, com.auca.dao.StudentDao, com.auca.model.AcademicUnit, com.auca.dao.AcademicUnitDao, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Course Creation</title>
   <link rel="shortcut icon" href="fav.jpg"/>
    <style type="text/css">
    
    body {
    font-family: 'Oswald', sans-serif;
    background-color: #f2f2f2;
    background: url('final.jpg') no-repeat center center fixed;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
}

form {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
}

label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
}

input[type="text"],
select {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.form-button {
    background-color: #4caf50;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
}

.form-button:hover {
    background-color: #45a049;
}

.home-link {
    position: absolute;
    top: 20px;
    left: 20px;
    font-size: 18px;
    text-decoration: none;
    color: #333;
}

.home-link:hover {
    color: #4caf50;
}
    .home-link {
    position: absolute;
    top: 20px;
    left: 20px;
    font-size: 18px;
    text-decoration: none;
    color: white; /* Set the text color to white */
}

.home-link span {
    display: inline-block;
    width: 5px;
    height: 5px;
    margin-right: 3px;
    background-color: #4caf50; /* Set the background color of the spans */
    border-radius: 50%; /* Create a circular shape */
}

.home-link:hover {
    color: #4caf50; /* Change text color on hover */
}
    
    </style>
</head>
<body>
<a class="home-link" href="index.jsp"><span></span><span></span><span></span><span></span>DashBoard</a>
    

    
    <form method="post" action="${pageContext.request.contextPath}/courses">
    <h1>Course Creation</h1>
    <input type="hidden" name="action" value="create">
    
    <label for="courseId">Course ID:</label>
    <input type="text" name="id" id="courseId">
    
    <label for="courseName">Course Name:</label>
    <input type="text" name="name" id="courseName">
    
    <label for="semId">Select Semester ID:</label>
		<select name="semesterId" id="semId">
            <option value="" selected>Select Semester ID:</option>
            
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            SemesterDao semesterDao = new SemesterDao(em);
            List<Semester> semesterList = semesterDao.findAll();
            
            for (Semester unit : semesterList) {
            %>
                <option value="<%= unit.getId() %>"><%= unit.getName() %></option>
            <%
            }
            // Close the EntityManager here
            em.close();
            emf.close();
            %>
        </select>
	
	<label for="depId">Select department:</label>
		<select name="academicUnitId" id="depId">
            <option value="" selected>Select department</option>
            
            <%
            EntityManagerFactory emg = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager en = emg.createEntityManager();
            AcademicUnitDao academicUnitDao = new AcademicUnitDao(en);
            List<AcademicUnit> departments = academicUnitDao.findDepartments();
            
            for (AcademicUnit unit : departments) {
            %>
                <option value="<%= unit.getId() %>"><%= unit.getName() %></option>
            <%
            }
            // Close the EntityManager here
            en.close();
            emg.close();
            %>
        </select>
    
    <input type="submit" value="Create Course"class="form-button">
</form>
</body>
</html>
