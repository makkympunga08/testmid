<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <title>Midsem project</title>
    <link rel="shortcut icon" href="fav.jpg"/>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: 'Oswald', sans-serif;
            background-image: url('masoro.jpeg'); 
            background-size: cover;
            background-position: center;
            height: 100vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .content {
            position: relative;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .logo {
            position: absolute;
            top: 20px;
            right: 1070px;
            width: 150px; /* Adjust the width as needed */
            height:50%;
        }

        a {
            position: relative;
            display: inline-flex;
            padding: 15px 20px;
            margin: 10px;
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
    </style>
</head>
<body>
    <div class="logo">
        <img src="auca.png" alt="College Logo">
    </div>
    <div class="content">
        <h1>Welcome to AUCA</h1>
        <h2>Student Registration Module</h2>
        <a href="Addition.jsp"><span></span><span></span><span></span><span></span>Addition</a>
<!--         <a href="M.jsp"><span></span><span></span><span></span><span></span>Management</a>
 -->        <a href="List.jsp"><span></span><span></span><span></span><span></span>Lists</a>
        <a href="FilteredListsModule.jsp"><span></span><span></span><span></span><span></span>Filtered Lists</a>
    </div>
</body>
</html>
