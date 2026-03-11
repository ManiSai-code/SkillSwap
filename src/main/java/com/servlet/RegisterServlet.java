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
            String email=request.getParameter("useremail");
            PreparedStatement ps = c.prepareStatement(
                    "INSERT INTO login(username,password) values(?,?);" );

            ps.setString(1, name);
            ps.setString(2, pass);
            

           ps.executeUpdate();
            PreparedStatement ps1 = c.prepareStatement(
                    "INSERT INTO registered_users(name,email,password) values(?,?,?);" );
            ps1.setString(1, name);
            ps1.setString(2, email);
            ps1.setString(3,pass);

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
