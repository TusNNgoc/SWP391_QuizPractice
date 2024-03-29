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

    public boolean insertCourseByTeacher(String course_name, int user_id_course, String course_content, int status) {
        String sql = "INSERT INTO course(course_name, user_id_course, course_content, isActive )"
                + " VALUES(?, ?, ?, ?)";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setString(1, course_name);
            ps.setInt(2, user_id_course);
            ps.setString(3, course_content);
            ps.setInt(4, status);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
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

    public List<Courses> getCourseByTeacherName(String username) {
        List<Courses> totalCourses = new ArrayList<>();
        String sql = "select * from course c join users u on c.user_id_course = u.user_id\n"
                + "where role_id = 1 and username = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Users user = Users.builder().build();
                user.setUser_id(rs.getInt("user_id_course"));
                Courses course = Courses.builder()
                        .course_id(rs.getInt("course_id"))
                        .course_name(rs.getString("course_name"))
                        .course_content(rs.getString("course_content"))
                        .isActive(rs.getInt("isActive"))
                        .user_id_course(user)
                        .build();

                totalCourses.add(course);
            }
            return totalCourses;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Courses getCourseByCoursename(String course_name) {

        String sql = "select * from course \n"
                + "where course_name = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setString(1, course_name);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Courses course = Courses.builder()
                        .course_id(rs.getInt("course_id"))
                        .course_name(rs.getString("course_name"))
                        .course_content(rs.getString("course_content"))
                        .isActive(rs.getInt("isActive"))
                        .build();
                return course;

            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public String getCourseNameByCourseId(int course_id) {

        String sql = "select * from course \n"
                + "where course_id = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                
                return rs.getString("course_name");

            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    public List<Courses> getCourseByStudentId(int user_id) {
        List<Courses> totalCourses = new ArrayList<>();
        String sql = "select * from course c join users u on c.user_id_course = u.user_id\n"
                + "where role_id = 2 and user_id = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Users user = Users.builder().build();
                user.setUser_id(rs.getInt("user_id_course"));
                Courses course = Courses.builder()
                        .course_id(rs.getInt("course_id"))
                        .course_name(rs.getString("course_name"))
                        .course_content(rs.getString("course_content"))
                        .isActive(rs.getInt("isActive"))
                        .user_id_course(user)
                        .build();

                totalCourses.add(course);
            }
            return totalCourses;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Courses> getCourseByTeacherId(int user_id) {
        List<Courses> totalCourses = new ArrayList<>();
        String sql = "select * from course c join users u on c.user_id_course = u.user_id\n"
                + "where role_id = 1 and user_id = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Users user = Users.builder().build();
                user.setUser_id(rs.getInt("user_id_course"));
                Courses course = Courses.builder()
                        .course_id(rs.getInt("course_id"))
                        .course_name(rs.getString("course_name"))
                        .course_content(rs.getString("course_content"))
                        .isActive(rs.getInt("isActive"))
                        .user_id_course(user)
                        .build();

                totalCourses.add(course);
            }
            return totalCourses;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean updateCourseForStudentAndTeacher(String new_course_name, String course_name, String course_content, int status) {
        String sql = "SET SQL_SAFE_UPDATES = 0;\n"
                + "UPDATE course\n"
                + "SET course_name = ? , course_content= ?, isActive = ?\n"
                + "WHERE course_name = ? ;\n"
                + "SET SQL_SAFE_UPDATES = 1;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setString(1, new_course_name);
            ps.setString(2, course_content);
            ps.setInt(3, status);
            ps.setString(4, course_name);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return false;
    }

    public boolean addStudentbyCoursename(String course_name, int user_id, String course_content) {
        String sql = "INSERT INTO course (course_name, user_id_course, course_content)\n"
                + "VALUES (?, ?, ?);";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {
            ps.setString(1, course_name);
            ps.setInt(2, user_id);
            ps.setString(3, course_content);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public boolean deleteStudentByCoursenameAndUserid(int user_id, String course_name) {
        String sql = "DELETE FROM course WHERE user_id_course = ? and course_name = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {

            ps.setInt(1, user_id);
            ps.setString(2, course_name);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }
    
    public boolean deleteCourseByCourseId(int course_id) {
        String sql = "DELETE FROM course WHERE course_id = ?;";
        try (Connection con = MySQLConnection.getConnection(); PreparedStatement ps = con.prepareCall(sql)) {

            ps.setInt(1,  course_id);
            

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return false;
    }

    public static void main(String[] args) {
        CoursesDAO cd = new CoursesDAO();
        System.out.println(cd.getTotalCourses().size());
    }
}
