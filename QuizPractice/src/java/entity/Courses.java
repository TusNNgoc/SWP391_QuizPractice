/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DELL
 */
@Builder
@Getter
@Setter
@ToString
public class Courses {
    private int course_id;
    private String course_name;
    private Users student_id; //fix to user_id in db
    private Quiz quiz_id;
    
    
}