<%@page import="com.report.MainReport"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.report.ReportBean"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import=" org.xml.sax.SAXException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Automation Report</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: Georgia, serif;
	font-size: 20px;
	font-style: italic;
	font-weight: normal;
	letter-spacing: normal;
	background: #f0f0f0;
}

#content {
	background-color: #fff;
	width: 750px;
	padding: 40px;
	margin: 0 auto;
	border-left: 40px solid #fff;
	border-right: 1px solid #ddd;
	-moz-box-shadow: 0px 0px 16px #aaa;
}

.head {
	font-family: Helvetica, Arial, Verdana;
	text-transform: uppercase;
	font-weight: bold;
	font-size: 12px;
	font-style: normal;
	letter-spacing: 3px;
	color: #888;
	border-bottom: 3px solid #f0f0f0;
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.head a {
	color: #1D81B6;
	text-decoration: none;
	float: right;
	text-shadow: 1px 1px 1px #888;
}

.head a:hover {
	color: #f0f0f0;
}

#content h1 {
	font-family: "Trebuchet MS", sans-serif;
	color: #1D81B6;
	font-weight: normal;
	font-style: normal;
	font-size: 30px;
	text-shadow: 1px 1px 1px #aaa;
	text-align:center;
}

#content h2 {
	font-family: "Trebuchet MS", sans-serif;
	font-size: 34px;
	font-style: normal;
	background-color: #f0f0f0;
	margin: 40px 0px 30px -40px;
	padding: 0px 40px;
	clear: both;
	float: left;
	width: 100%;
	color: #aaa;
	text-shadow: 1px 1px 1px #fff;
}
</style>
<body>
	<div id="content">
		<a class="back" href=""></a> <span class="scroll"></span>
		<h1>Migration Automation Execution Status &nbsp;&nbsp;&nbsp;</h1>
		<br>
		<h1 text-align="left">Iteration 2</h1>
		<br>
		<span class="scroll"></span>
		<table class="table1">
			<thead>
				<tr>
					<th scope="col" abbr="Starter">ExecutionSet Name</th>
					<th scope="col" abbr="Medium">Executor</th>
					<th scope="col" abbr="Business">Release</th>
					<th scope="col" abbr="Deluxe">Build Level</th>
					<th scope="col" abbr="Deluxe">Status</th>
					<th scope="col" abbr="Deluxe">Has Error</th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						String path = this.getServletContext().getRealPath("/");
						File dataPath = new File(path, "data/execute-20160115.xml");

						DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
						DocumentBuilder builder = factory.newDocumentBuilder();
						Document document = builder.parse(dataPath.getAbsolutePath());
						Element root = document.getDocumentElement();
						NodeList nodeList = root.getChildNodes();
						List<ReportBean> reports = new ArrayList<ReportBean>();
						for (int i = 0; i < nodeList.getLength(); i++) {
							ReportBean report = new ReportBean();
							Node child = nodeList.item(i);
							for (Node node = child.getFirstChild(); node != null; node = node.getNextSibling()) {
								if ("executeSetName".equals(node.getNodeName())) {
									report.setExecuteSetName(node.getFirstChild().getNodeValue());
								}
								if ("executor".equals(node.getNodeName())) {
									report.setExecutor(node.getFirstChild().getNodeValue());
								}
								if ("release".equals(node.getNodeName())) {
									report.setRelease(node.getFirstChild().getNodeValue());
								}
								if ("buildLevel".equals(node.getNodeName())) {
									report.setBuildLevel(node.getFirstChild().getNodeValue());

								}
								if ("hasFailed".equals(node.getNodeName())) {
									report.setHasFailed(Boolean.parseBoolean(node.getFirstChild().getNodeValue()));

								}
								if ("status".equals(node.getNodeName())) {
									report.setStatus(node.getFirstChild().getNodeValue());
								}
							}
							reports.add(report);
						}

						for (ReportBean report : reports) {
							if(report.getExecuteSetName()==null)
								continue;
				%>
				<tr>
					<td><%=report.getExecuteSetName()%></td>
					<td><%=report.getExecutor()%></td>
					<td><%=report.getRelease()%></td>
					<td><%=report.getBuildLevel()%></td>
					<td><span class="check"></span></td>
					<td><span class="check"></span></td>
				</tr>


				<%
					}
					} catch (Exception e) {

					}
					out.flush();
				%>
			</tbody>
		</table>

	</div>
</body>
</html>