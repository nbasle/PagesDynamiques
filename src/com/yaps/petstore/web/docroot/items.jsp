<%@ page errorPage="error.jsp"%>
<%@ page import="com.yaps.petstore.common.dto.ItemDTO"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<html>
<head>
	<title>YAPS PetStore - Find Items</title>
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
        <h5>Items for this product</h5>
        <table border ="2" cellspacing="0" cellpadding="5" width="100%">
        <tr><td>
        <% 
        final Collection itemsDTO = (Collection)request.getAttribute("itemsDTO");
       
        Iterator i=itemsDTO.iterator();
        while ( i.hasNext()) {
        ItemDTO itemDTO =(ItemDTO)i.next();
        %>
        
        <A href="<%=request.getContextPath() %>/finditem?itemId=<%=itemDTO.getId()%>">
        
        <%= itemDTO.getName()%>
        </A> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <%= itemDTO.getUnitCost()%>
       <BR>
        <%=itemDTO.getProductDescription()%>
        <BR>
        
        <%
        }
        %>
        </td>
        </tr>
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