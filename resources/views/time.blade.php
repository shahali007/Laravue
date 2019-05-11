<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        body{
            background: url({{asset('images/bg.png')}});
            background-size: cover;
        }
        #siteblock.site-block {
            display: none;
            position: fixed;
            z-index: 10000;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.75);
        }
        /* Modal Content */
        #siteblock .siteblock-content {
            margin: auto;
            display: table;
            position: relative;
            -webkit-animation-name: zoom;
            -webkit-animation-duration: 0.6s;
            animation-name: zoom;
            animation-duration: 0.6s;
            max-width:90%;
        }

        /* Modal Content img*/
        #siteblock .siteblock-content img{
            position: relative;
        }


        /* The Close Button */
        #siteblock .block-close {
            position: absolute;
            background: #f8f8f8;
            opacity: 1;
            right: -10px;
            top: -10px;
            width: 26px;
            height: 26px;
            line-height: 27px;
            border-radius: 50%;
            box-shadow: 0px 0px 0px 5px rgb(204, 204, 204);
            z-index: 1;
            font-size: 18px;
        }
        #siteblock .block-close:hover,
        #siteblock .block-close:focus {
            color: #fff;
            background: #000;
            text-decoration: none;
            cursor: pointer;
        }

        #adTimeCountdown{
            position: absolute;
            color: #fff;
            z-index: 1;
            top: -60px;
            font-weight: bold;
            font-size: 25px;
            left: 50%;
            transform: translateX(-50%);
        }

        /* Add Animation */
        @-webkit-keyframes zoom {
            from {-webkit-transform:scale(0)}
            to {-webkit-transform:scale(1)}
        }
        @keyframes zoom {
            from {transform:scale(0)}
            to {transform:scale(1)}
        }
    </style>
</head>
<body>
<!-- The Site Block -->
<div id="siteblock" class="site-block">
    <div class="siteblock-content">
        <span class="block-close">&times;</span>
        <a href="#">
            <span id="adTimeCountdown"></span>
            <img src="https://s3-ap-southeast-1.amazonaws.com/images.jagonews24/media/common/Site-blocker-Desktop.png" alt="PRAN" style="width:550px";>
        </a>
    </div>
</div>

<script>
    let siteblock = document.getElementById('siteblock');
    let span = document.getElementsByClassName("block-close")[0];
    span.onclick = function() {
        siteblock.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == siteblock) {
            siteblock.style.display = "none";
        }
    }
    // set time for showing siteblock after 2 seconds of page loading
    setTimeout(function() {
        siteblock.style.display = "block";
    }, 2000);
    // set time for stopping/closing siteblock for 5 seconds
    setTimeout(function() {
        siteblock.style.display = "none";
    }, 10000);

    // adTimeCountdown
    let timeleft = 9;
    let adTimeCountdown = setInterval(function(){
        document.getElementById("adTimeCountdown").innerHTML = timeleft;
        timeleft -= 1;
        if(timeleft < 0){
            clearInterval(adTimeCountdown);
            document.getElementById("adTimeCountdown").innerHTML = "0"
        }
    }, 1000);
</script>
</body>
</html>