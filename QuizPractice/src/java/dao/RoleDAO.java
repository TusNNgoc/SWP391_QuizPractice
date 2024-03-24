/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Role;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class RoleDAO {

    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT role_id, role_name from role;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    Role r = Role.builder()
                            .role_id(rs.getInt("role_id"))
                            .role_name(rs.getString("role_name"))
                            .build();
                    list.add(r);
                }
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
        }
        return list;
    }

    public void addRole(int role_id, String role_name) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                String sql = "INSERT INTO role (role_id, role_name)\n"
                        + " VALUES (?,?);";
                ps = con.prepareStatement(sql);
                ps.setInt(1, role_id);
                ps.setString(2, role_name);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Message: " + e.getMessage());
        }
    }

    public void updateRole(String role_id, String role_name) {
        String query = "Update role\n"
                + "Set role_name=? \n"
                + "where role_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, role_name);
                ps.setString(2, role_id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean isRoleIdExist(int roleID) {
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT * FROM role\n"
                        + "WHERE role_id = ?;  ";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                ps.setInt(1, roleID);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                if (rs.next()) {
                    // Close resources
                    rs.close();
                    ps.close();
                    return true;
                }
                // Close resources
                rs.close();
                ps.close();
                // No matching autoPartID found
                return false;
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
            // Handle the error here and return false or throw an exception
            return false;
        }
    }

    public void deleteRole(String id) {
        String query = "DELETE FROM  role\n"
                + "where role_id = ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                ps.setString(1, id);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Users> getUserByRole(String role_id) {
        List<Users> list = new ArrayList<>();
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT user_id, username, email, fullname from users\n"
                        + "WHERE role_id = ?;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    Users u = Users.builder().user_id(rs.getInt("user_id"))
                            .username(rs.getString("username"))
                            .email(rs.getString("email"))
                            .fullname(rs.getString("fullname")).build();
                    list.add(u);
                }
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
        }
        return list;
    }

    public List<Users> getAllUser() {
        List<Users> list = new ArrayList<>();
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                // SQL query to check if a service exists with the given parameters and is not valid
                String sql = "SELECT user_id, username, email, fullname,role_id from users;";
                // Create a prepared statement
                ps = con.prepareStatement(sql);
                // Execute the query
                rs = ps.executeQuery();
                //if rs has value
                while (rs.next()) {
                    Role r = Role.builder().role_id(rs.getInt("role_id")).build();
                    Users u = Users.builder().user_id(rs.getInt("user_id"))
                            .username(rs.getString("username"))
                            .email(rs.getString("email"))
                            .fullname(rs.getString("fullname"))
                            .role(r).build();
                    list.add(u);
                }
            }
        } catch (SQLException e) {
            // Handle any errors that may occur
            e.printStackTrace();
        }
        return list;
    }

    public List<Role> getPaggingRoleByName(int index, String name, int quantityShow) {
        List<Role> list = new ArrayList<>();
        String query = "SELECT * \n"
                + "FROM role a\n"
                + "WHERE ( ";

        String[] keywords = name.split("\\s+"); // Tách các từ khóa trong name        

        for (int i = 0; i < keywords.length; i++) {
            query += "a.role_name LIKE ?";
            if (i < keywords.length - 1) {
                query += " OR ";
            }
        }
        query += " )\n";
        query += "LIMIT ? OFFSET ?;";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                for (int i = 0; i < keywords.length; i++) {
                    ps.setString(i + 1, "%" + keywords[i] + "%");
                }

                ps.setInt(keywords.length + 2, (index - 1) * quantityShow);
                ps.setInt(keywords.length + 1, quantityShow);
                rs = ps.executeQuery();

                while (rs.next()) {
                    Role a = Role.builder().role_id(rs.getInt(1)).role_name(rs.getString(2)).build();
                    list.add(a);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalPartByName(String name) {
        String query = "SELECT Count(role_id) from role b "
                + "WHERE ";
        String[] keywords = name.split("\\s+"); // Tách các từ khóa trong title
        query += "(";
        for (int i = 0; i < keywords.length; i++) {
            query += "b.role_name LIKE ?";
            if (i < keywords.length - 1) {
                query += " OR ";
            }
        }
        query += ");";
        try {
            try (Connection con = MySQLConnection.getConnection()) {
                ps = con.prepareStatement(query);
                for (int i = 0; i < keywords.length; i++) {
                    ps.setString(i + 1 , "%" + keywords[i] + "%");
                }

                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        RoleDAO dao = new RoleDAO();
//        System.out.println(dao.getAllRole());
//        dao.updateRole("1", "teacher");
//        System.out.println(dao.isRoleIdExist(1));
//        int i = dao.getAllUser().size();
//        System.out.println(i);
//        System.out.println(dao.getAllUser());
        System.out.println(dao.getPaggingRoleByName(1, "t", 1));
//        System.out.println(dao.getTotalPartByName("t"));
    }
}



