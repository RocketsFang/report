<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Migration Automation Execution Report</title>
</head>
<body>
	<h1>okay</h1>
	<s:form action="report.action" namespace="/">                
             <s:combobox label="Select a executor" 
		headerKey="-1" headerValue="--- Select ---"
		list="#{'1':'Zhang Shuo', '2':'Fang Haiwei', '3':'Guan Zhili', '4':'Su Shi'}" 
		name="executor" />       
          </s:form>
	
	<%
try{
String path = this.getServletContext().getRealPath("/");
out.print("path="+path);
File dataPath = new File(path, "data");
for (File dataFile: dataPath.listFiles()){
	out.print("path="+dataFile);
}
}
catch(Exception e){
	
}
%>
</body>
</html>