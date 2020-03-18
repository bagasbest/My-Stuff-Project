/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Koneksi;

import com.sun.org.apache.bcel.internal.generic.RET;
import java.sql.*;
import javax.swing.JOptionPane;
       


/**
 *
 * @author user
 */
public class koneksi {
    Connection connection;
    
    public Connection getData(){
        try{
            connection = DriverManager.getConnection("jdbc:mysql://localhost/mystuff", "root", "");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Maaf anda Belum Terhubung ke Database");
        }
        return connection;
    }
    
    
}
