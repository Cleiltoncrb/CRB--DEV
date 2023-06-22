package com.autotech.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    public static Connection getConexao() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/autotech?user=root&password=";
        Connection conexao = DriverManager.getConnection(url);
        return conexao;
    }
}
