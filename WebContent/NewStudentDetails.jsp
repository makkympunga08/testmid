<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Student Form</title>
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
    
    <form method="post" action="${pageContext.request.contextPath}/student">
    <h1>Student Form</h1>
        <input type="hidden" name="action" value="create">

        <!-- Input field for Student ID -->
        <label for="id">ID:</label>
        <input type="text" name="id" id="id" required>
        
        <!-- Input field for Student Name -->
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <!-- Input field for Date of Birth -->
        <label for="dob">Date of Birth:</label>
        <input type="date" name="dob" id="dob" required>

        <!-- Input field for Telephone -->
        <label for="telephone">Telephone:</label>
        <input type="text" name="telephone" id="telephone" required>

        <input type="submit" value="Create Student"class="form-button">
    </form>
</body>
</html>
