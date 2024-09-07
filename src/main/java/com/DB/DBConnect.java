/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DB;

/**
 *
 * @author Abc1
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;
    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql:///ebook-app?useSSL=false","root","root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}

