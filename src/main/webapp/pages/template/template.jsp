<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Spring MVC - Tiles Integration tutorial</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" ></link>
    
    <tiles:importAttribute name="jsincludes"/>
    <c:forEach var="item" items="${jsincludes}">
	    <script src="${pageContext.request.contextPath}${item}"></script>	 
	</c:forEach>

	<!--[if IE]>
	<link rel="stylesheet" href="resources/css/ie.css" 
      type="text/css" media="screen, projection">
	<![endif]-->

	<style>
		body{ margin-top:20px; margin-bottom:20px; background-color:#DFDFDF;}
	</style>
</head>
<body>	
	<div class="container-fluid" style="border: #C1C1C1 solid 1px; border-radius:10px;">
		
		<!-- Header -->
		<div class="row">
			<div class="col-md-12">
				<tiles:insertAttribute name="header" />	
			</div>
		</div>
		
		
		<div class="row">
			<!-- Menu Page -->
			<div class="col-md-3" style="height:400px;background-color:#FCFCFC;">
				<tiles:insertAttribute name="menu" />
			</div>
			
			<!-- Body Page -->
			<div class="col-md-9">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		
		<!-- Footer Page -->
		<div class="row">
			<div class="col-md-12">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</div>
</body>
</html>