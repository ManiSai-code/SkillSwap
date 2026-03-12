package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	try {

    	    Class.forName("com.mysql.cj.jdbc.Driver");

    	    Connection c = DriverManager.getConnection(
    	            "jdbc:mysql://localhost:3306/users", "root", "");

    	    String name = request.getParameter("username");
    	    String pass = request.getParameter("userpassword");
    	    String email = request.getParameter("useremail");

    	    // Email validation
    	    if(!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")){
    	        response.getWriter().println("Invalid Email Format");
    	        return;
    	    }

    	    // Encrypt password using BCrypt
    	    String hashedPassword = BCrypt.hashpw(pass, BCrypt.gensalt());

    	    // Insert into login table
    	    PreparedStatement ps = c.prepareStatement(
    	            "INSERT INTO login(username,password) VALUES(?,?)");

    	    ps.setString(1, name);
    	    ps.setString(2, hashedPassword);

    	    ps.executeUpdate();

    	    // Insert into registered_users table
    	    PreparedStatement ps1 = c.prepareStatement(
    	            "INSERT INTO registered_users(name,email,password) VALUES(?,?,?)");

    	    ps1.setString(1, name);
    	    ps1.setString(2, email);
    	    ps1.setString(3, hashedPassword);

    	    ps1.executeUpdate();

    	    response.sendRedirect("login.jsp");

    	    ps.close();
    	    ps1.close();
    	    c.close();

    	} catch (Exception e) {
    	    e.printStackTrace();
    	} 
    }
}
