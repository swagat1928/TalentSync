<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiverr - Freelance Services Marketplace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="icon" type="image/png" sizes="16x16"
        href="https://fiverr-res.cloudinary.com/npm-assets/layout-server/favicon-16x16.74a458e.png">
    <link rel="stylesheet" href="login-homepage.css">
    <link rel="stylesheet" href="footer.css">
    <style>
   
        .dropdown {
            border-bottom: #c9cacc 1px solid;
            color: #74767e;
            height: 45px;
            text-align: center;
            background-color: white;

        }

        .dropdown>ul {
            display: inline-flex;
            list-style: none;
            gap: 40px;
            cursor: pointer;
            width: 2400px;
            margin-left: 210px;
            font-weight: bold;

        }

        #ele1 {
            display: none;
        }

        .dropdown>ul>li:hover #ele1 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -40px;


        }

        .dropdown>ul>li:hover {
            border-bottom: 3px solid #1ca163;
            padding-bottom: 9px;
        }

        #ele1>div>ul>li {
            list-style: none;


        }

        #ele1>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            text-align: center;
        }

        #ele1 {
            width: 900px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;

        }

        #ele1>div>ul>li {
            font-size: 14px;
            margin-bottom: 10px;
            margin-top: -5px;

        }

        #ele2 {
            display: none;
        }

        .dropdown>ul>li:hover #ele2 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -40px;

        }

        #ele2>div>ul>li {
            list-style: none;
        }

        #ele2>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            align-items: center;
        }

        #ele2 {
            width: 500px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele2>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }



        #ele3 {
            display: none;
        }

        .dropdown>ul>li:hover #ele3 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -40px;
        }

        #ele3>div>ul>li {
            list-style: none;
        }

        #ele3>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            /* align-items: center; */
        }

        #ele3 {
            width: 600px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele3>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }

        #ele4 {
            display: none;
        }

        .dropdown>ul>li:hover #ele4 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -40px;
        }

        #ele4>div>ul>li {
            list-style: none;
        }

        #ele4>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            /* align-items: center; */
        }

        #ele4 {
            width: 600px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele4>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }




        #ele5 {
            display: none;
        }

        .dropdown>ul>li:hover #ele5 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -40px;
        }

        #ele5>div>ul>li {
            list-style: none;
        }

        #ele5>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            align-items: center;
        }

        #ele5 {
            width: 450px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele5>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }



        #ele6 {
            display: none;
        }

        .dropdown>ul>li:hover #ele6 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -240px;
        }

        #ele6>div>ul>li {
            list-style: none;
        }

        #ele6>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            align-items: center;
        }

        #ele6 {
            width: 450px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele6>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }




        #ele7 {
            display: none;
        }

        .dropdown>ul>li:hover #ele7 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -340px;
        }

        #ele7>div>ul>li {
            list-style: none;
        }

        #ele7>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            align-items: center;
        }

        #ele7 {
            width: 450px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele7>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }

        #ele8 {
            display: none;
        }

        .dropdown>ul>li:hover #ele8 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -400px;
        }

        #ele8>div>ul>li {
            list-style: none;
        }

        #ele8>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            align-items: center;
        }

        #ele8 {
            width: 450px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele8>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }





        #ele9 {
            display: none;
        }

        .dropdown>ul>li:hover #ele9 {
            display: block;
            position: absolute;
            margin-top: 12px;
            margin-left: -420px;
        }

        #ele9>div>ul>li {
            list-style: none;
        }

        #ele9>div {
            margin-left: -25px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            /* align-items: center; */
        }

        #ele9 {
            width: 450px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            background-color: white;
            z-index: 2;
            padding: 20px;
        }

        #ele9>div>ul>li {
            font-size: 14px;
            margin-bottom: 20px;
        }
        a{
            text-decoration: none;
            color: #74767e;
        }
    </style>

</head>

<body>
<%=session.getAttribute("email") %>
<%
String a;
ResultSet rs = null;
try {
	a =(String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freelance", "root", "100pushUPS!!!");
    PreparedStatement statement = con.prepareStatement("SELECT * FROM freelancer");
   
    rs = statement.executeQuery();

} catch (ClassNotFoundException | SQLException e) {
    // Handle any errors that may occur
    e.printStackTrace();
}
%>
    <div id="navbar">
        <a href="Homepage-after-login.html">
            <svg width="89" height="27" viewBox="0 0 89 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g fill="#404145">
                    <path
                        d="m81.6 13.1h-3.1c-2 0-3.1 1.5-3.1 4.1v9.3h-6v-13.4h-2.5c-2 0-3.1 1.5-3.1 4.1v9.3h-6v-18.4h6v2.8c1-2.2 2.3-2.8 4.3-2.8h7.3v2.8c1-2.2 2.3-2.8 4.3-2.8h2zm-25.2 5.6h-12.4c.3 2.1 1.6 3.2 3.7 3.2 1.6 0 2.7-.7 3.1-1.8l5.3 1.5c-1.3 3.2-4.5 5.1-8.4 5.1-6.5 0-9.5-5.1-9.5-9.5 0-4.3 2.6-9.4 9.1-9.4 6.9 0 9.2 5.2 9.2 9.1 0 .9 0 1.4-.1 1.8zm-5.7-3.5c-.1-1.6-1.3-3-3.3-3-1.9 0-3 .8-3.4 3zm-22.9 11.3h5.2l6.6-18.3h-6l-3.2 10.7-3.2-10.8h-6zm-24.4 0h5.9v-13.4h5.7v13.4h5.9v-18.4h-11.6v-1.1c0-1.2.9-2 2.2-2h3.5v-5h-4.4c-4.3 0-7.2 2.7-7.2 6.6v1.5h-3.4v5h3.4z">
                    </path>
                </g>
                <g fill="#1dbf73">
                    <path d="m85.3 27c2 0 3.7-1.7 3.7-3.7s-1.7-3.7-3.7-3.7-3.7 1.7-3.7 3.7 1.7 3.7 3.7 3.7z"></path>
                </g>
            </svg>
        </a>
        <div><input type="text" id="Search" onchange="Search()"
                placeholder="What Service are You looking for Today"><button>
                <svg width="16" height="16" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M15.8906 14.6531L12.0969 10.8594C12.025 10.7875 11.9313 10.75 11.8313 10.75H11.4187C12.4031 9.60938 13 8.125 13 6.5C13 2.90937 10.0906 0 6.5 0C2.90937 0 0 2.90937 0 6.5C0 10.0906 2.90937 13 6.5 13C8.125 13 9.60938 12.4031 10.75 11.4187V11.8313C10.75 11.9313 10.7906 12.025 10.8594 12.0969L14.6531 15.8906C14.8 16.0375 15.0375 16.0375 15.1844 15.8906L15.8906 15.1844C16.0375 15.0375 16.0375 14.8 15.8906 14.6531ZM6.5 11.5C3.7375 11.5 1.5 9.2625 1.5 6.5C1.5 3.7375 3.7375 1.5 6.5 1.5C9.2625 1.5 11.5 3.7375 11.5 6.5C11.5 9.2625 9.2625 11.5 6.5 11.5Z">
                    </path>
                </svg>
            </button></div>
        <div>
            <img src="https://fiverr-res.cloudinary.com/npm-assets/layout-server/bell.78d6546.svg" alt="">
            <img src="https://fiverr-res.cloudinary.com/npm-assets/layout-server/letter.07c989b.svg" alt="">
            <svg width="20" height="20" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M14.325 2.00937C12.5188 0.490623 9.72813 0.718748 8 2.47812C6.27188 0.718748 3.48125 0.487498 1.675 2.00937C-0.674996 3.9875 -0.331246 7.2125 1.34375 8.92187L6.825 14.5062C7.1375 14.825 7.55625 15.0031 8 15.0031C8.44688 15.0031 8.8625 14.8281 9.175 14.5094L14.6563 8.925C16.3281 7.21562 16.6781 3.99062 14.325 2.00937ZM13.5875 7.86875L8.10625 13.4531C8.03125 13.5281 7.96875 13.5281 7.89375 13.4531L2.4125 7.86875C1.27188 6.70625 1.04063 4.50625 2.64063 3.15937C3.85625 2.1375 5.73125 2.29062 6.90625 3.4875L8 4.60312L9.09375 3.4875C10.275 2.28437 12.15 2.1375 13.3594 3.15625C14.9563 4.50312 14.7188 6.71562 13.5875 7.86875Z">
                </path>
            </svg>
        </div>
        <h4>Orders</h4>
        <span Id="username-word"><%=session.getAttribute("email") %></span>
        <a href="landing.html"><button id="Logout" >Logout</button></a>
    </div>
    <!-- <ul id="nav-dropdown">
        <li>Graphics & Design</li>
        <li>Digital Marketing</li>
        <li>Writing & Translation</li>
        <li>Video & Animation</li>
        <li>Music & Audio</li>
        <li>Programming & Tech</li>
        <li>Business</li>
        <li>Lifestyle</li>
        <li>Trending</li>
    </ul> -->

    <div class="dropdown">
        <ul>
            <li class="gd"><a href="./graphic-design.html">Graphics & Design</a>
                <div id="ele1">
                    <div>
                        <ul>
                            <h5>Logo & Brand Identity</h5>
                            <li>Logo Design</li>
                            <li>Brand Style Guides</li>
                            <li>Fonts & Typography</li>
                            <li>Business Cards & Stationery</li>
                        </ul>

                        <ul>
                            <h5>Gaming</h5>
                            <li>Game Art</li>
                            <li>Graphics for Streamers</li>
                            <li>Twitch Store</li>
                            <li>Art & Illustration</li>
                        </ul>

                        <ul>
                            <h5>Illustration</h5>
                            <li>NFT Art</li>
                            <li>Pattern Design</li>
                            <li>Portraits & Caricatures</li>
                            <li>Cartoons & Comics</li>
                            <li>Tattoo Design</li>
                            <li>Storyboards</li>
                            <li>Web & App Design</li>
                        </ul>
                    </div>

                    <div>
                        <ul>
                            <h5>Web & App Design</h5>
                            <li>App Design</li>
                            <li>Website Design</li>
                            <li>UX Design</li>
                            <li>Landing Page Design</li>
                            <li>Icon Design</li>
                            <li>Marketing Design</li>
                        </ul>

                        <ul>
                            <h5>Marketing Design</h5>
                            <li>Social Media Design</li>
                            <li>Email Design</li>
                            <li>Web Banners</li>
                            <li>Signage Design</li>

                        </ul>

                        <ul>
                            <h5>Packaging & Covers</h5>
                            <li>Packaging & Label Design</li>
                            <li>Book Design</li>
                            <li>Album Cover Design</li>
                            <li>Podcast Cover Art</li>
                            <li>Car Wraps</li>
                        </ul>

                        <ul>
                            <h5></h5>
                        </ul>
                    </div>

                    <div>
                        <ul>
                            <h5>Visual Design</h5>
                            <li>Image Editing</li>
                            <li>Presentation Design</li>
                            <li>Infographic Design</li>
                            <li>Vector Tracing</li>
                            <li>Resume Design</li>
                        </ul>

                        <ul>
                            <h5>Architecture & Building Design</h5>
                            <li>Architecture & Interior Design</li>
                            <li>Landscape Design</li>
                            <li>Building Engineering</li>
                            <li>Building Information Modeling</li>
                        </ul>

                        <ul>
                            <h5>Fashion & Jewelry</h5>
                            <li>Fashion Design</li>
                            <li>Jewelry Design</li>
                        </ul>
                    </div>

                    <div>
                        <ul>
                            <h5>Print Design</h5>
                            <li>T-Shirts & Merchandise</li>
                            <li>Flyer Design</li>
                            <li>Brochure Design</li>
                            <li>Poster Design</li>
                            <li>Catalog Design</li>
                            <li>Menu Design</li>
                            <li>Invitation Design</li>
                        </ul>

                        <ul>
                            <h5>Product & Characters Design</h5>
                            <li>Industrial & Product Design</li>
                            <li>Character Modeling</li>
                            <li>Trade Booth Design</li>
                        </ul>

                        <ul>
                            <h5>Miscellaneous</h5>
                            <li>Logo Maker Tool</li>
                            <li>Design Advice</li>
                            <li>Other</li>
                        </ul>

                    </div>

                </div>
            </li>


            <li class="dm">Digital Marketing
                <div id="ele2">
                    <div>
                        <ul>
                            <li>Social Media Marketing</li>
                            <li>Social Media Advertising</li>
                            <li>Search Engine Optimization (SEO)</li>
                            <li>Local SEO</li>
                            <li>Marketing Strategy</li>
                            <li>Public Relations</li>
                            <li>Guest Posting</li>
                            <li>Video Marketing</li>
                            <li>Email Marketing</li>
                            <li>Web Analytics</li>
                            <li>Text Message Marketing</li>
                            <li>Crowdfunding</li>
                        </ul>

                        <ul>
                            <li>Marketing AdviceNEW</li>
                            <li>Search Engine Marketing (SEM)</li>
                            <li>Display Advertising </li>
                            <li>E-Commerce Marketing</li>
                            <li>Influencer Marketing</li>
                            <li>Community Management</li>
                            <li>Mobile App Marketing</li>
                            <li>Music Promotion</li>
                            <li>Book & eBook Marketing</li>
                            <li>Podcast Marketing</li>
                            <li>Affiliate Marketing</li>
                            <li>Other</li>
                        </ul>

                    </div>
                </div>
            </li>


            <li class="wt">Writing & Translation
                <div id="ele3">
                    <div>
                        <ul>
                            <li>Articles & Blog Posts</li>
                            <li>Translation</li>
                            <li>Proofreading & Editing</li>
                            <li>Resume Writing</li>
                            <li>Cover Letters</li>
                            <li>LinkedIn Profiles</li>
                            <li>Ad CopyNEW</li>
                            <li>Sales Copy</li>
                            <li>Social Media Copy</li>
                            <li>Email Copy</li>
                            <li>Case Studies</li>
                        </ul>

                        <ul>
                            <li>Book & eBook Writing</li>
                            <li>Book EditingNEW</li>
                            <li>Scriptwriting</li>
                            <li>Podcast Writing</li>
                            <li>Beta Reading</li>
                            <li>Creative Writing</li>
                            <li>Brand Voice & Tone</li>
                            <li>UX Writing</li>
                            <li>Speechwriting</li>
                            <li>eLearning Content DevelopmentNEW</li>
                            <li>Technical Writing</li>
                        </ul>

                        <ul>
                            <li>Job DescriptionsNEW</li>
                            <li>White Papers</li>
                            <li>Website Content</li>
                            <li>Product Descriptions</li>
                            <li>Press Releases</li>
                            <li>Business Names & Slogans</li>
                            <li>Grant Writing</li>
                            <li>Transcription</li>
                            <li>Research & Summaries</li>
                            <li>Writing AdviceNEW</li>
                            <li>Other</li>
                        </ul>
                    </div>
                </div>

            </li>


            <li class="va">Video & Animation
                <div id="ele4">
                    <div>
                        <ul>
                            <li>Video Editing</li>
                            <li>Short Video Ads</li>
                            <li>Whiteboard & Animated Explainers</li>
                            <li>Character Animation</li>
                            <li>Lyric & Music Videos</li>
                            <li>Logo Animation</li>
                            <li>Intros & Outros</li>
                            <li>Visual Effects</li>
                            <li>Subtitles & Captions</li>
                            <li>Spokesperson Videos</li>
                            <li>Unboxing Videos</li>
                            <li>Animated GIFs</li>
                        </ul>

                        <ul>
                            <li>3D Product Animation</li>
                            <li>Social Media VideosNEW</li>
                            <li>E-Commerce Product Videos</li>
                            <li>Live Action Explainers</li>
                            <li>Lottie & Website Animation</li>
                            <li>NFT Animation</li>
                            <li>Corporate Videos</li>
                            <li>App & Website Previews</li>
                            <li>Animation for Streamers</li>
                            <li>Slideshow Videos</li>
                            <li>Crowdfunding Videos</li>
                            <li>Meditation Videos</li>
                            <li>Product Photography</li>
                        </ul>

                        <ul>
                            <li>Animation for Kids</li>
                            <li>Article to Video</li>
                            <li>Game Trailers</li>
                            <li>Book Trailers</li>
                            <li>Real Estate Promos</li>
                            <li>eLearning Video Production</li>
                            <li>Video Templates Editing</li>
                            <li>Screencasting Videos</li>
                            <li>Local PhotographyBETA</li>
                            <li>VideographersNEW</li>
                            <li>Filmed Video ProductionNEW</li>
                            <li>Video AdviceNEW</li>
                            <li>Other</li>
                        </ul>
                    </div>
                </div>
            </li>


            <li class="ma">Music & Audio
                <div id="ele5">
                    <div>
                        <ul>
                            <li>Voice Over</li>
                            <li>Producers & Composers</li>
                            <li>Singers & Vocalists</li>
                            <li>Session Musicians</li>
                            <li>Jingles & Intros</li>
                            <li>Songwriters</li>
                            <li>Online Music Lessons</li>
                            <li>Beat Making</li>
                            <li>Audiobook Production</li>
                            <li>Audio Ads Production</li>
                            <li>Sound Design</li>
                            <li>Mixing & Mastering</li>
                        </ul>

                        <ul>
                            <li>Audio Editing</li>
                            <li>Podcast Editing</li>
                            <li>Music Transcription</li>
                            <li>Vocal Tuning</li>
                            <li>DJ Drops & Tags</li>
                            <li>DJ Mixing</li>
                            <li>Remixing & Mashups</li>
                            <li>Synth Presets</li>
                            <li>Meditation Music</li>
                            <li>Audio Logo & Sonic Branding</li>
                            <li>Music & Audio AdviceNEW</li>
                            <li>Other</li>
                        </ul>
                    </div>
                </div>
            </li>


            <li class="pt">Programming & Tech
                <div id="ele6">
                    <div>
                        <ul>
                            <li>WordPress</li>
                            <li>Website Builders & CMS</li>
                            <li>Game Development</li>
                            <li>Development for Streamers</li>
                            <li>Web Programming</li>
                            <li>E-Commerce Development</li>
                            <li>Mobile Apps</li>
                            <li>Desktop Applications</li>
                            <li>Chatbots</li>
                            <li>Support & IT</li>
                            <li>Online Coding Lessons</li>
                            <li>Cybersecurity & Data Protection</li>
                        </ul>

                        <ul>
                            <li>Get Your Website in a Few Steps</li>
                            <li>Electronics EngineeringNEW</li>
                            <li>Convert Files</li>
                            <li>User Testing</li>
                            <li>QA & Review</li>
                            <li>Blockchain & Cryptocurrency</li>
                            <li>NFT DevelopmentNEW</li>
                            <li>Databases</li>
                            <li>Data Processing</li>
                            <li>Data EngineeringNEW</li>
                            <li>Data ScienceNEW</li>
                            <li>Other</li>
                        </ul>
                    </div>
                </div>
            </li>

            <li class="bn">Business
                <div id="ele7">
                    <div>
                        <ul>
                            <li>Virtual Assistant</li>
                            <li>E-Commerce Management</li>
                            <li>Market Research</li>
                            <li>Sales</li>
                            <li>Customer Care</li>
                            <li>CRM Management NEW</li>
                            <li>ERP ManagementNEW</li>
                            <li>Supply Chain Management</li>
                            <li>Project Management</li>
                            <li>Event ManagementNEW</li>
                            <li>Game Concept Design</li>
                        </ul>

                        <ul>
                            <li>Business Plans</li>
                            <li>Financial Consulting</li>
                            <li>Legal Consulting</li>
                            <li>Business Consulting</li>
                            <li>Presentations</li>
                            <li>HR Consulting</li>
                            <li>Career Counseling</li>
                            <li>Data Entry</li>
                            <li>Data Analytics</li>
                            <li>Data Visualization</li>
                            <li>Other
                        </ul>
                    </div>
                </div>
            </li>


            <li class="lf">Lifestyle
                <div id="ele8">
                    <div>
                        <ul>
                            <li>Online Tutoring</li>
                            <li>Gaming</li>
                            <li>Astrology & Psychics</li>
                            <li>Modeling & Acting</li>
                            <li>Wellness</li>
                            <li>Traveling</li>
                            <li>Fitness Lessons</li>
                            <li>Dance Lessons</li>
                            <li>Life Coaching</li>
                        </ul>

                        <ul>
                            <li>Greeting Cards & Videos</li>
                            <li>Personal Stylists</li>
                            <li>Cooking Lessons</li>
                            <li>Craft Lessons</li>
                            <li>Arts & Crafts</li>
                            <li>Family & Genealogy</li>
                            <li>Collectibles</li>
                            <li>Other</li>
                        </ul>
                    </div>
                </div>
            </li>


            <li class="td">Trending
                <div id="ele9">
                    <div>
                        <ul>
                            <li>Dropshipping</li>
                            <li>E-Commerce Marketing</li>
                            <li>Game Development</li>
                            <li>Discord Services</li>
                            <li>NFT Services</li>
                        </ul>

                        <ul>
                            <li>Architecture & Interior Design</li>
                            <li>Data</li>
                            <li>Resume Writing</li>
                            <li>Search Engine Optimization (SEO)</li>
                            <li>Character Modeling</li>
                            <li>Character Animation</li>
                            <li>Image Editing</li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>


    <div id="welcome-container">
        <div id="post-reqdiv">
            <h3>HI <span id="name-1"><%=session.getAttribute("email") %></span>,</h3>
            <p>Get offers from sellers for your project</p>
            <button>Post a request</button>
        </div>
        <div id="crousel-div">
            <div id="crousel-welcome">
                <h2><span id="name-2"><%=session.getAttribute("email") %></span>,</h2>
                <p>Here's what <i>you</i> need for developing your game</p>

            </div>
            <span id="left-button"></span>
            <section id="crousel">
                <div class="first-crousel">
                    <img src="https://fiverr-res.cloudinary.com/image/upload/f_png,q_auto/v1/attachments/generic_asset/asset/c056c874b3b9af09781cdab02f479239-1651142936268/Programming%20_%20Tech%20-%20Game%20Development.svg"
                        alt="">
                    <p>Game Development</p>
                </div>
                <div class="first-crousel">
                    <img src="https://fiverr-res.cloudinary.com/image/upload/f_png,q_auto/v1/attachments/generic_asset/asset/c056c874b3b9af09781cdab02f479239-1651142936257/Graphics%20_%20Design%20-%20Game%20Art.svg"
                        alt="">
                    <p>Game Art</p>
                </div>
                <div class="first-crousel">
                    <img src="https://fiverr-res.cloudinary.com/image/upload/f_png,q_auto/v1/attachments/generic_asset/asset/65f721973b3f98727ecc908498f1f2d9-1651386017284/Character%20Design_2249.svg"
                        alt="">
                    <p>Character Design</p>
                </div>
                <div class="first-crousel">
                    <img src="https://fiverr-res.cloudinary.com/image/upload/f_png,q_auto/v1/attachments/generic_asset/asset/c056c874b3b9af09781cdab02f479239-1651142936262/Graphics%20_%20Design%20-%20Character%20Modeling.svg"
                        alt="">
                    <p>Sound Design</p>
                </div>
                <div class="first-crousel">
                    <img src="https://fiverr-res.cloudinary.com/image/upload/f_png,q_auto/v1/attachments/generic_asset/asset/c056c874b3b9af09781cdab02f479239-1651142936266/Video%20_%20Animation%20-%20Character%20Animation.svg"
                        alt="">
                    <p>Character Animation</p>
                </div>
                <div class="first-crousel">
                    <img src="https://fiverr-res.cloudinary.com/image/upload/f_png,q_auto/v1/attachments/generic_asset/asset/c056c874b3b9af09781cdab02f479239-1651142936266/Video%20_%20Animation%20-%20Character%20Animation.svg"
                        alt="">
                    <p>Character Modeling</p>
                </div>

            </section>
            <button id="button-crousel"></button>

        </div>
    </div>
    <h2 id="result-for"></h2>
    <div id="Search-box">

    </div>
    <div id="sorting-div">
        <select id="sort-price" onchange="sortTitle()">
            <option value="">Sort By Price</option>
            <option value="Low">Low To High</option>
            <option value="High">High To Low</option>
        </select>
        <select id="sort-rating" onchange="sortRating()">
            <option value="">Sort By Rating</option>
            <option value="Low">Low To High</option>
            <option value="High">High To Low</option>
        </select>
    </div>

    <div id="Products-Crousel">
        <div>
            <h3>Continue browsing <span><svg width="16" height="16" viewBox="0 0 16 16"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M9.92332 2.96885C9.63854 2.66807 9.1768 2.66807 8.89202 2.96885C8.60723 3.26963 8.60723 3.75729 8.89202 4.05807L11.6958 7.01931H1.48616C1.08341 7.01931 0.756918 7.36413 0.756918 7.7895C0.756918 8.21487 1.08341 8.5597 1.48616 8.5597H11.8436L8.89202 11.677C8.60723 11.9778 8.60723 12.4654 8.89202 12.7662C9.1768 13.067 9.63854 13.067 9.92332 12.7662L14.0459 8.41213C14.3307 8.11135 14.3307 7.62369 14.0459 7.32291L13.977 7.25011C13.9737 7.24661 13.9704 7.24315 13.9671 7.23972L9.92332 2.96885Z">
                        </path>
                    </svg></span></h3>
            <div>
                <button class="pr-btn">
                    <img src="data:image/png;base64,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"
                        alt="">
                </button>
                <button class="pr-btn">
                    <img src="data:image/png;base64,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"
                        alt="">
                </button>
            </div>
        </div>

        <!-- Products section -->
        <section id="Products">
        </section>
    </div>

    <h2>Because you saved <span>create you a website using duda builder</span> </h2>

    <section id="Products-2">

    </section>
    <span id="left-btn-pr2">
        <button class="pr-btn2" id="pr-btn2-left">
            <img src="https://i.ibb.co/hCXN8LJ/download.png" alt="">
        </button>
    </span>
    <span id="right-btn-pr2">
        <button class="pr-btn2" id="pr-btn2-right">
            <img src="data:image/png;base64,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"
                alt="">
        </button>
    </span>
    <section id="Products-3">


    </section>
    <span id="left-btn-pr3">
        <button class="pr-btn3" id="pr-btn3-left">
            <img src="https://i.ibb.co/hCXN8LJ/download.png" alt="">
        </button>
    </span>
    <span id="right-btn-pr3">
        <button class="pr-btn3" id="pr-btn3-right">
            <img src="https://i.ibb.co/hCXN8LJ/download.png" alt="">
        </button>
    </span>

    <h2>Gigs you may like</h2>

    <section id="Products-4">

    </section>
<div class="container">
  
  <div class="row">
  <%
	while(rs.next())
	{
%>   
<div class="card mx-3" style="width: 18rem;">
  <img src="images/<%=rs.getString("image") %>" class="card-img-top" alt="..." height="150" width="150">
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("firstname") %></h5>
    <p class="card-text"><%=rs.getString("bio") %></p>
    <p class="card-text">Rate : <%=rs.getDouble("rate") %></p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
	
    <%} %>
    </div>
</div>
 





    <h2 id="handpicked-line">Beautiful illustrations, <span>handpicked for you</span> </h2>
    <section id="Handpicked-section">
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/image/upload/q_auto,f_auto,w_400,dpr_1.0/v1/attachments/generic_asset/asset/7a95123bcdfb2c68385a93c15dc1c04b-1617011757239/create-a-quirky-combination-of-text-and-illustration.png"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/f6fa36d845d712e5d7cb9d7085d58e66-1558545571663/2f3230e6-b78c-4277-879b-d975f8351326.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Digital illustration</h5>
                    <p>by byastridpr</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
         
        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/gigs3/166771084/original/71ebb6054047c39cc3cfdcd9b84a58cf51e73379/create-a-vector-illustration-in-modern-flat-style.jpg"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/58dd95e5f7d3284f97e1f5c8cade234e-1598647681033/3b0e1eb9-5903-4165-a11c-fee8b78a782c.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Vector Illustration</h5>
                    <p>frizenasya</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/attachments/delivery/asset/66e6ba633bd253b773d9ac35dec13263-1594476674/Giant%20Bird1/create-great-illustrations-for-your-projects.png"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/f3883b7dbac8ceccad33c7e0df977446-1582721147593/58228a1e-0fed-4961-aa7d-8e5f883d8d69.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Children’s books illustration</h5>
                    <p>jamesmoffittart</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/attachments/delivery/asset/8731d181eed8158cb2db5ee124617272-1559983517/190608_Fiverr_Babarali85/create-awesome-digital-illustrations.JPG"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/f6fa36d845d712e5d7cb9d7085d58e66-1558545571663/2f3230e6-b78c-4277-879b-d975f8351326.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Digital illustration</h5>
                    <p>by byastridpr</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/attachments/delivery/asset/aa1589219035135fc669ec00dbba4728-1596720675/fiverr%20manu%20mgeitnerdigital%20teamwork%20journey%20v3/create-colourful-digital-illustrations-to-capture-your-ideas.jpg"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/59d6a0c6537b7894c40c45a5216462a6-1542626836183/723aee13-5e56-40ef-bd2c-bfd70c584d85.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Characters Illustration</h5>
                    <p>christyj27</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/attachments/delivery/asset/8731d181eed8158cb2db5ee124617272-1559983517/190608_Fiverr_Babarali85/create-awesome-digital-illustrations.JPG"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/f6fa36d845d712e5d7cb9d7085d58e66-1558545571663/2f3230e6-b78c-4277-879b-d975f8351326.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Digital illustration</h5>
                    <p>by byastridpr</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/attachments/delivery/asset/b3eff28fe2bc3be4baa0fbe4b18fef6d-1594071157/lovetate21_1/colourful-digital-illustrations-character-in-the-interior.png"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_original,q_auto,f_auto/attachments/profile/photo/f3e36c39ef62276a76cfbb936bc116e7-1605324204060/50658d1f-9a46-4d26-9b9d-a7d2ccb7ccea.JPG"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Hand Drawn Illustration</h5>
                    <p>jamayalt</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://fiverr-res.cloudinary.com/images/q_auto,f_auto,w_400,dpr_1.0/attachments/delivery/asset/ec0b2e0a09cd66e964f922c517506de8-1604488031/4687ADD2-6AA2-4F86-9E7C-23E22ADB8A5A/create-an-illustration-poster-book-or-album-cover.jpeg"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/dc884e77d490aff5db05517f6420a5b7-1572284662673/54df7897-00c5-4f5d-8e10-82cc3c9edde7.jpeg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>Hand Drawn Illustration</h5>
                    <p>muravski</p>
                </div>
            </div>

        </div>
        <div class="handpicked-box">
            <img src="https://discover.fiverr.com/wp-content/uploads/create-unique-nft-digital-abstract-art-400x400.jpg"
                alt="">
            <div class="handpicked-pr-id">
                <img src="https://fiverr-res.cloudinary.com/t_profile_thumb,q_auto,f_auto/attachments/profile/photo/f6fa36d845d712e5d7cb9d7085d58e66-1558545571663/2f3230e6-b78c-4277-879b-d975f8351326.jpg"
                    alt="">
                <div class="handpicked-pr-name">
                    <h5>NFT Illustration</h5>
                    <p>by artkrieg</p>
                </div>
            </div>

        </div>
    </section>
    <span id="left-btn-handpicked">
        <button class="pr-btn-hand" id="left-btn-hand">
            <img src="https://i.ibb.co/hCXN8LJ/download.png" alt="">
        </button>
    </span>
    <span id="right-btn-handpicked">
        <button class="pr-btn-hand" id="right-btn-hand">
            <img src="data:image/png;base64,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"
                alt="">
        </button>
    </span>

    <div id="img-crousel">
        <div id="img-crousel-box-1" class="img-crousel-box">
            <h2>Facebook ads. Know it all.</h2>
            <p>Scale your business with best practices covered in this course.</p>
        </div>
        <div id="img-crousel-box-2" class="img-crousel-box">
            <h2>Build a strong online presence</h2>
            <p>Boost your business with this course on personal branding techniques.</p>
        </div>
        <div id="img-crousel-box-3" class="img-crousel-box">
            <h2>Convert web visitors into customers</h2>
            <p>Unlock the secrets of conversion rate optimization with this course.</p>
        </div>
        <div id="img-crousel-box-4" class="img-crousel-box">
            <h2>Master social media platforms</h2>
            <p>Learn how to monetize your online presence with this course.</p>
        </div>
        <div id="img-crousel-box-1" class="img-crousel-box">
            <h2>Facebook ads. Know it all.</h2>
            <p>Scale your business with best practices covered in this course.</p>
        </div>

    </div>
    <div id="footer">

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>

</html>
<script src="login-homepage.js"></script>

<script type="module">
    import { footer } from "../script/footer.js"
    document.getElementById("footer").innerHTML = footer()
</script>
