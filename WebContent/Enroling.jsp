<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.auca.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.dao.CourseDao"%>
<%@page import="com.auca.model.Student"%>
<%@page import="com.auca.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
    
	    StudentDao studentDao;
	    CourseDao courseDao;  	
    
    	if("POST".equals(request.getMethod())) {
    		EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
    	    EntityManager em = emf.createEntityManager();
    	    studentDao = new StudentDao(em);
    	    courseDao = new CourseDao(em);
    		
		    String studentId = request.getParameter("student");
			String courseId = request.getParameter("course");
			
			Student student = studentDao.findById(studentId);
			Course course = courseDao.findById(courseId);
			
			List<Course> courses = new ArrayList<Course>();
			courses.add(course);
			
			student.setCourses(courses);
			studentDao.update(student);
			
			response.sendRedirect("index.jsp");
    	}
    	
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
<title>Insert title here</title>
<link rel="shortcut icon" href="fav.jpg"/>
<style type="text/css">

<title>Course Creation</title>
   
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

</style>
</head>


<body>
<a class="home-link" href="index.jsp">home</a><br>
	<form action="Enroling.jsp" method="POST">
		<label>Student Id:</label><br>
		<input type="text" name="student"><br>
		<label>Course Id:</label><br>
		<input type="text" name="course">
		<input type="submit" value="Add Course"class="form-button">
	</form>
</body>
</html>