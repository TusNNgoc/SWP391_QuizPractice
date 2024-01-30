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
    private boolean accountActived ; 
    private Role role; //add
    private String nationality;
    private String address;
    private String gender;
    private Date dob;
    private String phone;


    public Users(int user_id, String password, String username, String email, boolean accountActived, Role role) {
        this.user_id = user_id;
        this.password = password;
        this.username = username;
        this.email = email;
        this.accountActived = accountActived;
        this.role = role;
    }





    
   
}
