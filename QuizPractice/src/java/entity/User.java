/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


////////////UPDATE///////////////////////
import java.util.Date;
import javax.management.relation.Role;

public class User {

    private int user_id; 
    private String fullname;
    private String password;
    private String username;
    private String email;
    private boolean accountActived;
    private int role_id; // Sử dụng đối tượng Role thay vì int
    private String country;
    private String address;
    private String gender;
    private Date dob;
    private String phone;

    public User() {
    }

    // Constructor không sử dụng tham số không cần thiết
    public User(int user_id, String fullname, String password, String username, String email, boolean accountActived, int role, String country, String address, String gender, Date dob, String phone) {
        this.user_id = user_id;
        this.fullname = fullname;
        this.password = password;
        this.username = username;
        this.email = email;
        this.accountActived = accountActived;
        this.role_id = role;
        this.country = country;
        this.address = address;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAccountActived(boolean accountActived) {
        this.accountActived = accountActived;
    }

    public void setRole(int role) {
        this.role_id = role;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // Getters và Setters

    public int getUser_id() {
        return user_id;
    }

    public String getFullname() {
        return fullname;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public boolean isAccountActived() {
        return accountActived;
    }

    public int getRole() {
        return role_id;
    }

    public String getCountry() {
        return country;
    }

    public String getAddress() {
        return address;
    }

    public String getGender() {
        return gender;
    }

    public Date getDob() {
        return dob;
    }

    public String getPhone() {
        return phone;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", fullname=" + fullname + ", password=" + password + ", username=" + username + ", email=" + email + ", accountActived=" + accountActived + ", role_id=" + role_id + ", country=" + country + ", address=" + address + ", gender=" + gender + ", dob=" + dob + ", phone=" + phone + '}';
    }
}

