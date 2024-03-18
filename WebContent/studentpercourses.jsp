<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.List"%>
<%@page import="com.auca.dao.CourseDao"%>
<%@page import="com.auca.model.Course"%>
<%@page import="com.auca.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Students by Course</title>
       
    <style type="text/css">
         body {
            margin: 0;
            padding: 0;
            font-family: 'Raleway', sans-serif;
            font-weight: bold;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('gistr.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        a {
            position: inherit;
            display: inline-flex;
            padding: 25px 30px;
            color: #03e9f4;
            text-decoration: none;
            text-transform: uppercase;
            transition: 0.5s;
            letter-spacing: 4px;
            overflow: hidden;
        }

        a:hover {
            background: #03e9f4;
            color: #050801;
            box-shadow: 0 0 5px #03e9f4, 0 0 25px #03e9f4, 0 0 50px #03e9f4, 0 0 200px #03e9f4;
            -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
        }

        a:nth-child(1) {
            filter: hue-rotate(270deg);
        }

        a span {
            position: absolute;
            display: block;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #03e9f4);
            animation: animate 1s linear infinite;
        }

        @keyframes animate {
            0% {
                transform: scaleX(0);
                transform-origin: middle;
            }
            50% {
                transform: scaleX(1);
                transform-origin: left;
            }
            50.1% {
                transform: scaleX(1);
                transform-origin: right;
            }
            100% {
                transform: scaleX(0);
                transform-origin: right;
            }
        }

        .background {
            position: fixed;
            top: 100;
            left:50;
            width: 80vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }


		h1 {
    font-size: 36px;
    margin-bottom: 30px;
    text-align: center; 
    background-color: green;
}
		
		.centered-container {
    z-index: 1;
    text-align: center;
    margin-right: 20px;
    display: flex;
    flex-direction: column;
    align-items: flex-start; /* Align items to the top */
}
		
        .button-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }

        .button-container button {
            margin: 10px;
        }

        .button-container a {
            display: block;
            padding: 20px;
            background-color: #03e9f4;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button-container a:hover {
            background-color: #05b8f5;
        }
    </style>
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    <h1>Students by Course</h1>

    <form method="post">
        <label for="courseId">Select a Course:</label>
        <select name="courseId" id="courseId">
            <option value="" disabled selected>Select a Course</option>
            <%
	            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
	            EntityManager em = emf.createEntityManager();
                CourseDao courseDao = new CourseDao(em);
                List<Course> courses = courseDao.findAll();
                for (Course course : courses) {
            %>
                <option value="<%= course.getId() %>"><%= course.getName() %></option>
            <%
                }
            %>
        </select>
        <input type="submit" value="Show Students">
    </form>

    <hr>

    <%
        String courseId = request.getParameter("courseId");
        if (courseId != null && !courseId.isEmpty()) {
            Course selectedCourse = courseDao.findById(courseId);
            List<Student> students = selectedCourse.getStudents();
    %>
        <h2>Students Enrolled in <%= selectedCourse.getName() %></h2>
        <ul>
            <%
                for (Student student : students) {
            %>
                <li><%= student.getName() %></li>
            <%
                }
            %>
        </ul>
    <%
        }
    %>

</body>
</html>
