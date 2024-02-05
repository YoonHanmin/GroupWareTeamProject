<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
 const eventSource = new EventSource("/connect")
 eventSource.addEventListener('connect',(e) => {
	const { data: receivedConnectData} = e;
	console.log('connect event data : ',receivedConnectData);
 });

</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>