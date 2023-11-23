<%@ page errorPage="error.jsp"%>
<%@ page import="com.yaps.petstore.common.dto.ItemDTO"%>
<html>
<head>
	<title>YAPS PetStore - Create Customer</title>
</head>
<body>

<table cellspacing="0" cellpadding="5" width="100%">
    <%--HEADER--%>
	<tr>
		<td colspan="3">
			<jsp:include page="common/header.jsp"/>
		</td>
	</tr>

	<tr>
        <%--NAVIGATION--%>
        <td valign="top" width="20%">
    		<jsp:include page="common/navigation.jsp"/>
    	</td>

        <td align="left" width="60%">
        <%--CENTRAL BODY--%>
        <% 
        final ItemDTO itemDTO = (ItemDTO)request.getAttribute("itemDTO");
        %>
        <h5><%=itemDTO.getName()%></h5>
        
        <h5 align="right"> Unit Cost:<%=itemDTO.getUnitCost()%></h5>
        
        <img border="0" src="images/<%=itemDTO.getImagePath()%>"/>
        
           <%--FOOTER--%>
    	</td>
        <td></td>
    </tr>
    <tr>
    	<td colspan="3">
    		<jsp:include page="common/footer.jsp"/>
    	</td>
    </tr>
</table>
</body>
</html>