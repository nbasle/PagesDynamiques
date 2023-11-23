<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.yaps.petstore.common.dto.ProductDTO"%>
<html>
<head>
	<title>YAPS PetStore - Find Products</title>
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
        <h5>Products for this category</h5>
        <table border ="2" cellspacing="0" cellpadding="5" width="100%">
        <tr><td>
        <% 
        final Collection productsDTO = (Collection)request.getAttribute("productsDTO");
         
        Iterator i = productsDTO.iterator();
        while ( i.hasNext()) {
        ProductDTO productDTO =(ProductDTO)i.next();
        %>
        <A href="<%=request.getContextPath() %>/finditems?productId=<%=productDTO.getId()%>">
        
        <%= productDTO.getName()%></A>
        <BR>
        
        <%= productDTO.getDescription()%>
        
        <BR>
        <%
        }
        %>
        </td></tr>
        </table>
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