<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<div id="msg"></div>


<script  src="https://code.jquery.com/jquery-3.2.1.min.js"
         integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

<script type="text/javascript">
    if (!!navigator.geolocation)
    {
        navigator.geolocation.getCurrentPosition(successCallback,errorCallback);
    }
    else
    {
        alert("이 브라우저는 Geolocation를 지원하지 않습니다");
    }

    function successCallback(position)
    {
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;

        document.getElementById("msg").innerHTML = "위도:" + lat + ", 경도:"+lng;

        $.ajax({
            type: "post",
            contentType:"application/json",
            dataType :'jsonp',
            crossDomain:true,
            url: "https://apis.daum.net/local/geo/coord2addr?apikey=175962b9a13ff23b6ba95789998c261c&longitude="+lng+"&latitude="+lat+"&inputCoordSystem=WGS84&output=json",
            error   : function (msg) {
                alert(msg);
            },
            success: function(data){
                alert(data.fullName);
            }
        });

    }

    function errorCallback(error)
    {
        alert(error.message);
    }



</script>


</body>
</html>

