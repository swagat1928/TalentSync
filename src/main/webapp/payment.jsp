<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="payment.css">
    <style>
        body {
            margin: 0px;
            font-family: Arial, Helvetica, sans-serif;
        }
        #timer {
            margin-top: 3%;
            text-align: center;
            font-size: 25px;
            font-weight: 600;
            margin-bottom: -2%;
        }
    </style>
</head>
<body>

<div id="timer"></div>

<div class="container">

    <form action="paymentServlet" method="post">

        <div class="row">

            <div class="col">

                <h3 class="title">billing address</h3>
        		<input type="hidden" id="flag" name="id" value=<%=request.getParameter("id")%>> 
        		<input type="hidden" id="flag" name="cid" value=<%=request.getParameter("cid")%>>
        		 <input type="hidden" id="flag" name="fid" value=<%=request.getParameter("fid")%>>
        		<input type="hidden" id="flag" name="aid" value=<%=request.getParameter("aid")%>>
        		
                <div class="inputBox">
                    <span>full name :</span>
                    <input type="text" placeholder="Name" name="full_name">
                </div>
                <div class="inputBox">
                    <span>email :</span>
                    <input type="email" placeholder="Enter Email" name="email">
                </div>
                <div class="inputBox">
                    <span>address :</span>
                    <input type="text" placeholder="Adress/Street" name="address">
                </div>
                <div class="inputBox">
                    <span>city :</span>
                    <input type="text" placeholder="City Name" name="city" >
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>state :</span>
                        <input type="text" placeholder="State" name="state">
                    </div>
                    <div class="inputBox">
                        <span>Pin code :</span>
                        <input type="text" placeholder="Pin" id="pin" name="pin">
                    </div>
                </div>

            </div>

            <div class="col">

                <h3 class="title">payment</h3>

                <div class="inputBox">
                    <span>cards accepted :</span>
                    <img src="../components/card_img.png" alt="">
                </div>
                <div class="inputBox">
                    <span>name on card :</span>
                    <input type="text" placeholder="Enter Card Name" name="card_name">
                </div>
                <div class="inputBox">
                    <span>credit card number :</span>
                    <input type="number" placeholder="1111-2222-3333-4444" name="card_number">
                </div>
                <div class="inputBox">
                    <span>exp month(01-Jan/ 12-Dec) :</span>
                    <input type="text" placeholder="10" name="exp_month">
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>exp year :</span>
                        <input type="number" placeholder="2022" name="exp_year">
                    </div>
                    <div class="inputBox">
                        <span>CVV :</span>
                        <input type="text" placeholder="1234" name="cvv">
                    </div>
                </div>

            </div>
    
        </div>
        <input type="submit" value="proceed to checkout" class="submit-btn">

    </form>

</div>    
    
</body>
</html>
