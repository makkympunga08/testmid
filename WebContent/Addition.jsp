<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap' rel='stylesheet' type='text/css'>
    <title>Midsem project</title>
    <link rel="shortcut icon" href="fav.jpg"/>
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
            background: url('Addition.jpg') no-repeat center center fixed;
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
            left:100;
            width: 80vw;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }


		h1 {
    font-size: 36px;
    margin-bottom: 30px;
    text-align: center; /* Center the text */
}
		
		.centered-container {
    z-index: 1;
    text-align: center;
    margin-right: 20px;
    display: flex;
    flex-direction: column;
    align-items: flex-start; /* Align items to the top */
}
		
        /* Your existing styles for centered-container, h1, button-container, and button can be retained as is */
    </style>
</head>
<body>
    <a href="index.jsp"><span></span><span></span><span></span><span></span>DashBoard</a>
    <div class="background"></div>
    <div class="centered-container">
       <!--  <h1>Add</h1> -->
        
        <div class="button-container">
            <button><a href="newAcademicUnit.jsp">Add Academic Unit</a></button>
            <button><a href="NewCourse.jsp">Add Course</a></button>
            <button><a href="NewStudentDetails.jsp">Add Student Details</a></button>
            <button><a href="NewSemester.jsp">Add Semester</a></button>
            <button><a href="Teacher.jsp">Add Teacher</a></button>
            <button><a href="StudentRegistration.jsp">Register Student</a></button>
               <button><a href="Enroling.jsp">add student to a course</a></button>
        </div>
    </div>
</body>
</html>
