
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
public class Quiz {
    private int quiz_id;
    private String quiz_name;
    private Users creator_id;
    private Courses course_id;
    private String quiz_content;
    
        public Quiz(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public Quiz(int quiz_id,String quiz_name, Courses course_id) {
        this.quiz_id = quiz_id;
        this.quiz_name = quiz_name;
        this.course_id = course_id;
    }

    public Quiz(int quiz_id, String quiz_name, Courses course_id, String quiz_content) {
        this.quiz_id = quiz_id;
        this.quiz_name = quiz_name;
        this.course_id = course_id;
        this.quiz_content = quiz_content;
    }
    
}

