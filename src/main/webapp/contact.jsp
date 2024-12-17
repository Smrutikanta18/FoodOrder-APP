<html >
<head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 1600px;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 30px;
            width: 100%;
            box-sizing: border-box;
        }


        .contact-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .contact-card h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .contact-card p {
            font-size: 16px;
            color: #666;
            margin: 5px 0;
        }

        .contact-card .email {
            font-size: 14px;
            color: #007bff;
        }


        .contact-card button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        .contact-card button:hover {
            background-color: #0056b3;
        }


        @media (max-width: 768px) {
            .contact-card {
                padding: 15px;
            }

            .contact-card h3 {
                font-size: 20px;
            }

            .contact-card p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="contact-card">
            <h3><%= session.getAttribute("firstname") %> <%= session.getAttribute("lastname") %></h3>
            <p>Phone: <%= session.getAttribute("phone") %></p>
            <p class="email">Email:  <%= session.getAttribute("email") %></p>

        </div>
    </div>


</body>
</html>
