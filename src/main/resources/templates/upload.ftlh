<html>
<head>
<title>图片上传</title>
</head>
<body>
<form enctype="multipart/form-data" method="post" action="${request.contextPath}/thumbnail">
<input type="file" name="image" id="image">
<input type="submit" value="上传">

</form>

</body>
</html>