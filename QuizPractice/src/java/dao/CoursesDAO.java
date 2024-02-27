/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.MySQLConnection;
import entity.Courses;
import entity.Users;
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

    public boolean insertCourse(String course_name, String course_content) {
        String sql = "INSERT INTO course(course_name, course_content)"
                + " VALUES(?, ?)";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
           ps.setString(1, course_name);
           ps.setString(2, course_content);
            
            int affectedRows = ps.executeUpdate();
            if(affectedRows > 0){
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return false;
    }

    public List<Courses> getTotalCourses() {
        List<Courses> totalCourses = new ArrayList<>();
        String sql = "SELECT * FROM course";
                

        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
               

                Courses course = Courses.builder()
                        .course_id(rs.getInt("course_id"))
                        .course_name(rs.getString("course_name"))
                        .course_content(rs.getString("course_content"))
                    
                        .build();

                totalCourses.add(course);
            }
            return totalCourses;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        CoursesDAO cd = new CoursesDAO();
        System.out.println(cd.getTotalCourses().size());
    }
}
