/*
 * Created on 16 déc. 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.yaps.petstore.web.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yaps.petstore.common.delegate.CatalogDelegate;
import com.yaps.petstore.common.dto.ItemDTO;
import com.yaps.petstore.common.exception.ObjectNotFoundException;
import com.yaps.petstore.common.logging.Trace;

/**
 * @author Veronique
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class FindItemServlet extends AbstractServlet {
	  protected void service(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final String mname = "service";
        Trace.entering(getCname(), mname);
        
        final ItemDTO itemDTO;
        String itemId = request.getParameter("itemId");
        try {
//        	 Gets the items for a item id
            Trace.finest(getCname(), mname, "Item id=" + itemId);
        	itemDTO = CatalogDelegate.findItem(itemId);
//			 puts the list of items into the request
            request.setAttribute("itemDTO", itemDTO);

            // Goes to the items page passing the request
            getServletContext().getRequestDispatcher("/item.jsp").forward(request, response);
        } catch(ObjectNotFoundException e) {
        	getServletContext().getRequestDispatcher("/error.jsp?exception=No item found for itemId " + itemId).forward(request, response);
        } catch(Exception e){
        	Trace.throwing(getCname(), mname, e);
            getServletContext().getRequestDispatcher("/error.jsp?exception=Cannot get the item list").forward(request, response);
        }
	  }

}
