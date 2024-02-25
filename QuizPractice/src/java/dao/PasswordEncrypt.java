/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author -Pc-
 */
public class PasswordEncrypt {
    public static String hashPassword (String pass){
        try{
            MessageDigest md = MessageDigest.getInstance("SHA");
            md.update(pass.getBytes());
            byte[] b = md.digest();
            StringBuilder sb = new StringBuilder();
            for(byte b1 : b){
                sb.append(Integer.toHexString(b1 & 0xff));
            }
            
            return sb.toString();
        }catch (NoSuchAlgorithmException ex){
            Logger.getLogger(PasswordEncrypt.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
