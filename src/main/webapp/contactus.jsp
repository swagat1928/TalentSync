<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Contact Us - Responsive Page Design</title>
    <link rel="shortcut icon" type="image/jpg" href="news2.png"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@800&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@900&display=swap');
    </style>
    <link rel="stylesheet" href="contactus.css">
    </head>
    <body>
        <section>
            <div class="container">
                <div class="contactInfo"> 
                    <div>
                        <h2>Contact Info</h2>
                        <ul class="info">
                            <li>
                                <span><img src="location.png"></span>
                                <span>FC College Rd, Shivajinagar<br>
                                    Pune,Maharashtra<br>
                                    411004</span>
                                </span>
                            </li>
                            <li>
                                <span><img src="mail.png"></span>
                                <!-- <span>talentsyn@gmail.com</span> -->
                                <span><a href = "mailto:talentsyn@gmail.com">talentsyn@gmail.com</a></span>
                            </li>
                            <li>
                                <span><img src="call.png"></span>
                                <span>702-279-3488</span>
                            </li>

                        </ul>
                    </div>
                    
                </div>
                	<form action="contact_store.jsp" method="post">
                    <div class="contactForm">
                        <h2>Send a Message</h2>
                        <div class="formBox">
                        <div class="inputBox w50">
                            <input type="text" name="first_name" required>
                            <span>First Name</span>
                        </div>
                        <div class="inputBox w50">
                            <input type="text" name="last_name" required>
                            <span>Last Name</span>
                        </div>
                        <div class="inputBox w50">
                            <input type="email" name="email" required>
                            <span>Email Address</span>
                        </div>
                        <div class="inputBox w50">
                            <input type="text" name="contact" required>
                            <span>Mobile Number</span>
                        </div>
                        <div class="inputBox w100">
                            <textarea required name="message"></textarea>
                            <span>Write your message here...</span>
                        </div>
                        <div class="inputBox w100">
                            <input type="submit" value="Send">
                        </div>
                    </div>
                </div>
                </form>
                    
                    
             
        </section>
    </body>
</html>