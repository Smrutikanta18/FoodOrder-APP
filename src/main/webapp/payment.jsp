<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Method</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #e9ecef; /* Softer background for better contrast */
        margin: 0;
        padding: 0;
    }

    .payment-container {
        width: 90%;
        margin: 50px auto;
        background-color: #e9ecef;
        border-radius: 12px;
        padding: 40px;

        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .payment-container h1 {
        font-size: 26px;
        text-align: center;
        margin-bottom: 30px;
        color: #333;
        font-weight: 600;
        text-transform: uppercase; /* Make heading stand out */
    }

    .order-summary {
        background-color: #e9ecef;
        padding: 20px;
        margin-bottom: 30px;
        border-radius: 10px;
        border: 1px solid #dee2e6;
    }

    .order-summary p {
        font-size: 22px;
        text-align: center;
        color: #28a745; /* Green color for total amount */
        font-weight: bold;
    }

    .total-amount {
        font-size: 24px;
        color: #28a745;
    }

    .tabs {
        display: flex;
        justify-content: space-around; /* Space evenly between buttons */
        margin-bottom: 20px;
        background-color: #e9ecef; /* Light background for tabs */
        border-radius: 8px;
        overflow: hidden; /* Rounded corners effect */
    }

    .tablinks {
        flex: 1; /* Allow buttons to grow equally */
        padding: 15px 0;
        cursor: pointer;
        font-size: 16px;
        border: none;
        text-align: center;
        background-color: #e9ecef; /* Tab button background */
        transition: background-color 0.3s, color 0.3s;
    }

    .tablinks.active, .tablinks:hover {
        background-color: #007bff; /* Blue color on active and hover */
        color: #fff; /* White text on active and hover */
    }

    .tabcontent {
        display: none;
        padding: 20px;
        border: 1px solid #dee2e6;
        background-color: #e9ecef;
        border-radius: 8px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        transition: opacity 0.3s ease-in-out;
    }

    .tabcontent h2 {
        font-size: 20px;
        margin-bottom: 15px;
        color: #333;
        text-align: center;
    }

    .tabcontent input, .tabcontent select {
        width: 95%;
        padding: 15px;
        margin-bottom: 15px;
        border: 1px solid #ced4da; /* Light border for inputs */
        border-radius: 8px;
        font-size: 16px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    .tabcontent input:focus, .tabcontent select:focus {
        border-color: #007bff; /* Blue border on focus */
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Soft shadow on focus */
    }

    .place-order {
        background-color: #28a745; /* Green background for buttons */
        color: #fff;
        padding: 18px;
        width: 100%;
        border: none;
        border-radius: 8px;
        font-size: 20px;
        font-weight: 600;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s; /* Added transition */
    }

    .place-order:hover {
        background-color: #218838; /* Darker green on hover */
    }

    .place-order:active {
        transform: scale(0.98); /* Slight shrink effect on click */
    }

    @media screen and (max-width: 768px) {
        .payment-container {
            width: 90%;
            padding: 20px;
        }

        .tablinks {
            font-size: 14px;
            padding: 10px;
        }

        .place-order {
            font-size: 18px;
            padding: 15px;
        }

        .order-summary p {
            font-size: 18px;
        }

        .total-amount {
            font-size: 20px;
        }
    }

</style>
    <style>
            .custom-navbar {
                background-color: transparent;
                padding: 0;
            }

            .breadcrumb-nav {
                list-style: none;
                display: flex;
                justify-content: center; /* Centers the breadcrumb items horizontally */
                align-items: center;
                padding: 0;
            }

            .breadcrumb-item {
                font-size: 15px;
                font-weight: bold;
                color: #333;
                position: relative;
            }

            .breadcrumb-item.active {
                color: green; /* Active state color changed to green */
            }

            .breadcrumb-item:not(:last-child)::after {
                content: '-------'; /* Separator between breadcrumb items */
                color: #999;
                font-weight: normal;
            }

            .breadcrumb-item:last-child::after {
                content: ''; /* Remove the separator after the last breadcrumb item */
            }

            .container {
                display: flex;
                justify-content: center;
                margin: 20px 0; /* Add space above and below the navbar */
            }

            @media (max-width: 768px) {
                .breadcrumb-item {
                    font-size: 16px;
                }

                .breadcrumb-item:not(:last-child)::after {
                    content: '---'; /* Shorten the separator for smaller screens */
                }
            }
            </style>
</head>
<body>
    <div class="container">
        <nav class="navbar custom-navbar">
            <ul class="breadcrumb-nav">
                <li class="breadcrumb-item">Cart</li>
                <li class="breadcrumb-item">Address</li>
                <li class="breadcrumb-item active">Payment</li>
            </ul>
        </nav>
    </div>

    <div class="container">

        <div class="payment-container">
        <div class="order-summary">
                    <p>Total Amount: <span class="total-amount">&#8377; <%= String.format("%.2f", (Double) request.getSession().getAttribute("totalsum")) %></span></p>
                </div>
            <h1>Select Payment Method</h1>
            <div class="tabs">
                <button class="tablinks active" onclick="openTab(event, 'NetBanking')">Net Banking</button>
                <button class="tablinks" onclick="openTab(event, 'UPI')">UPI</button>
                <button class="tablinks" onclick="openTab(event, 'DebitCard')">Debit Card</button>
                <button class="tablinks" onclick="openTab(event, 'COD')">Cash on Delivery</button>
            </div>

            <div id="NetBanking" class="tabcontent" style="display: block;">
                <h2>Net Banking</h2>
                <select>
                    <option>Select your bank</option>
                    <option>Bank A</option>
                    <option>Bank B</option>
                    <option>Bank C</option>
                </select>
                <form action="placed" method="post">
                    <input type="hidden" name="uemail" value="<%= request.getSession().getAttribute("email")%>"> <!-- Add user's email here -->
                    <button type="submit" class="place-order btn btn-secondary add-new-address-btn">Place Order</button>
                </form>

            </div>

            <div id="UPI" class="tabcontent">
                <h2>UPI</h2>
                <input type="text" placeholder="Enter UPI ID">
                <form action="placed" method="post">
                    <input type="hidden" name="uemail" value="<%= request.getSession().getAttribute("email")%>"> <!-- Add user's email here -->
                    <button type="submit" class="place-order btn btn-secondary add-new-address-btn">Place Order</button>
                </form>

            </div>

            <div id="DebitCard" class="tabcontent">
                <h2>Debit Card</h2>
                <input type="text" placeholder="Card Number">
                <input type="text" placeholder="Card Holder Name">
                <input type="text" placeholder="Expiry Date (MM/YY)">
                <input type="text" placeholder="CVV">
                <form action="placed" method="post">
                    <input type="hidden" name="uemail" value="<%= request.getSession().getAttribute("email")%>"> <!-- Add user's email here -->
                    <button type="submit" class="place-order btn btn-secondary add-new-address-btn">Place Order</button>
                </form>
            </div>

            <div id="COD" class="tabcontent">
                <h2>Cash on Delivery</h2>
                <p>You can pay in cash when your order is delivered.</p>
                <form action="placed" method="post">
                    <input type="hidden" name="uemail" value="<%= request.getSession().getAttribute("email")%>"> <!-- Add user's email here -->
                    <button type="submit" class="place-order btn btn-secondary add-new-address-btn">Place Order</button>
                </form>

            </div>
        </div>
    </div>


    <script>
    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;

        // Hide all tab contents
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }

        // Remove active class from all tabs
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].classList.remove("active");
        }

        // Show the current tab and add active class
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.classList.add("active");
    }

    </script>
</body>
</html>
