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
 * @author HP
 */

@Builder
@Getter
@Setter
@ToString
public class Users {
    private int user_id; 
    private String fullname;
    private String password;
    private String username;
    private String email;
    private boolean accountActived ; 
    private Role role; //add
    
    
    
}
