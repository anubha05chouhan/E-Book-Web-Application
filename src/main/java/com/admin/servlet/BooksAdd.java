/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

/**
 *
 * @author Abc1
 */
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String categories = req.getParameter("categories");
            String status = req.getParameter("bstatus");

            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();
            
            BookDtls b=new BookDtls(bookName,  author,  price,  categories ,  status, fileName ,"admin");
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            

         

            boolean f = dao.addBooks(b);

            HttpSession session = req.getSession();

            if (f) {
                
                
                String path = getServletContext().getRealPath("") + File.separator + "img";
           // System.out.println("-------------------------------------------------------");
           // System.out.println("Base path: " + path);
            //System.out.println("-------------------------------------------------------");

            File dir = new File(path);
            if (!dir.exists()) {
                boolean created = dir.mkdirs();
                if (!created) {
                    throw new IOException("Failed to create directory: " + path);
                }
            }

            String filePath = path + File.separator + fileName;
           // System.out.println("File path: " + filePath);
            //System.out.println("-------------------------------------------------------");

            // Write the file manually using FileOutputStream
            try (InputStream input = part.getInputStream(); FileOutputStream output = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = input.read(buffer)) != -1) {
                    output.write(buffer, 0, bytesRead);
                }
                //System.out.println("File successfully written to: " + filePath);
            } catch (IOException e) {
                //System.out.println("Error writing file: " + e.getMessage());
                e.printStackTrace();
                throw e;
            }
                session.setAttribute("succMsg", "Book Add Successfully");
                resp.sendRedirect("admin/add_books.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on Server");
                resp.sendRedirect("admin/add_books.jsp");
            }


            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



/*
String path = getServletContext().getRealPath("") + File.separator + "img";
            System.out.println("-------------------------------------------------------");
            System.out.println(path);
            System.out.println("-------------------------------------------------------");
            File dir = new File(path);
            System.out.println("-------------------------------------------------------");
            System.out.println(path + File.separator + fileName);
            
            System.out.println("-------------------------------------------------------");
           part.write(path + File.separator + fileName);
           System.out.println("-------------------------------------------------------");
*/


