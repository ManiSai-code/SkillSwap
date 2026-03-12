package com.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles form submission (POST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	try {

    	    Class.forName("com.mysql.cj.jdbc.Driver");

    	    Connection c = DriverManager.getConnection(
    	            "jdbc:mysql://localhost:3306/users", "root", "");

    	    String name = request.getParameter("txtName");
    	    String pass = request.getParameter("txtPwd");

    
    	    PreparedStatement ps = c.prepareStatement(
    	            "SELECT password FROM login WHERE username=?");

    	    ps.setString(1, name);

    	    ResultSet rs = ps.executeQuery();

    	    if (rs.next()) {

    	        String storedPassword = rs.getString("password");

    	       
    	        if (BCrypt.checkpw(pass, storedPassword)) {

    	            request.setAttribute("name1", name);
    	            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
    	            rd.forward(request, response);

    	        } else {
    	            response.sendRedirect("login.jsp");
    	        }

    	    } else {

    	        response.sendRedirect("login.jsp");

    	    }

    	    rs.close();
    	    ps.close();
    	    c.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("login1.jsp");
    }
}