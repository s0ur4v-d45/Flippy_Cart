package com.sourav.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sourav.dao.CategoryDao;
import com.sourav.dao.ProductDao;
import com.sourav.entities.Category;
import com.sourav.entities.Product;
import com.sourav.helper.FactoryProvider;


@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ProductOperationServlet() {
        super();     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter())
		{
	       String operation = request.getParameter("operation");
				
			if(operation.trim().equals("addcategory")) {
				
				//fetching category data
				String title=request.getParameter("catTitle");
				String description=request.getParameter("catDescription");
				
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				
				int catId =categoryDao.saveCategory(category);
				
				//out.println("category saved");
				
				HttpSession session=request.getSession();	
				session.setAttribute("message","Category saved successfully: "+catId);
				response.sendRedirect("admin.jsp");
				return;
				
			}
			
			else if(operation.trim().equals("addproduct")) {
								
				String pName = request.getParameter("pName");
				String pDescription = request.getParameter("pDescription");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part=request.getPart("pPic"); 
				
				
				Product product = new Product();
				product.setpName(pName);
				product.setpDesc(pDescription);
				product.setpPrice(pPrice);
				product.setpDiscount(pDiscount);
				product.setpQuantity(pQuantity);
				product.setpPhoto(part.getSubmittedFileName());
				
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				Category category = categoryDao.getCategoryById(catId);
				
				product.setCategory(category);
				
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				productDao.saveProduct(product);
				
				
				//pic upload
				
				//finding path where to upload
				String path = this.getServletContext().getRealPath("img")+ File.separator + "Product" + File.separator + part.getSubmittedFileName();
				//String path = request.getRealPath("img") + File.separator + "Product" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
				//String path="C:\\java programs\\FirstServlet\\FlippyCart\\WebContent\\img\\Product" + File.separator  + part.getSubmittedFileName();

				//uploading code
				FileOutputStream fileOutputStream = new FileOutputStream(path);
				InputStream inputStream = part.getInputStream();

				//reading data
				byte[] data = new byte[inputStream.available()];
				inputStream.read(data);
				
				//writing the data
				fileOutputStream.write(data);
				fileOutputStream.close();
				
								
				HttpSession session=request.getSession();	
				session.setAttribute("message","Product saved successfully...");
				response.sendRedirect("admin.jsp");
				return;
				
			}
			
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		} 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
