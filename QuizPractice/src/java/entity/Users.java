/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.Data;

/**
 *
 * @author HP
 */
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Users {

    private int user_id;

    private String fullname;
    private String password;
    private String username;
    private String email;
    private boolean accountActived;
    private Role role;
    private String roleName;
    private String country;
    private String address;
    private String gender;
    private Date dob;
    private String phone;
    private String course_name;
    private String description;
    


}
