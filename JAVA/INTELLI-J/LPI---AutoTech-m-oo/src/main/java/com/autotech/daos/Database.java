package com.autotech.daos;

import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static javax.swing.JOptionPane.*;

public class Database {

    public static Connection getConexao() throws SQLException {
        Connection conexao = null;
        try {
            String url = "jdbc:mysql://localhost:3306/autotech?user=root&password=";
            conexao = DriverManager.getConnection(url);
        } catch (SQLException erro) {
             erro.getMessage();
        }
        return conexao;
    }
}
