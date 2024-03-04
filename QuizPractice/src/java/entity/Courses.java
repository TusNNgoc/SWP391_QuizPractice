
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DELL
 */
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Courses {
    private int course_id;
    private String course_name;
    private Users student_id; 
    private String course_content;
    
        public Courses(int course_id, String course_name, Users student_id) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.student_id = student_id;
    }

    public Courses(int course_id, String course_name) {
        this.course_id = course_id;
        this.course_name = course_name;
    }
}

