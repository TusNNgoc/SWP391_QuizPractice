/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Courses;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class CoursesDAO {

    public List<Courses> getTotal() {
        List<Courses> totalCourses = new ArrayList<>();
        String sql = "SELECT * FROM course c\n"
                + "join users u on c.student_id =  u.user_id;";
        
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            }
        } catch (SQLException e) {
            
        }
        return null;
    }
}
