/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Scanner;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author Jeremy
 */
public class Setup {

    public static boolean isInit = false;

    public String execute() throws FileNotFoundException, IOException, SQLException {
        initDataBase();

        return "success";
    }

    public void initDataBase() throws FileNotFoundException, IOException, SQLException {
        if (isInit) {
            return;
        }

        Properties prop = new Properties();
        InputStream properties = this.getClass().getClassLoader().getResourceAsStream("hibernate.properties");
        prop.load(properties);

        ApplicationContext context = new ClassPathXmlApplicationContext("hibernate.xml");
        DriverManagerDataSource basicDataSource = (DriverManagerDataSource) context.getBean("basicDatabaseConnect");

        Connection conn = basicDataSource.getConnection();

        InputStream sql = this.getClass().getClassLoader().getResourceAsStream("script.sql");

        importSQL(conn, sql);

        isInit = true;
    }

    public static void importSQL(Connection conn, InputStream in) throws SQLException {
        Scanner s = new Scanner(in);
        s.useDelimiter("(;(\r)?\n)|(--\n)");
        Statement st = null;

        st = conn.createStatement();
        while (s.hasNext()) {
            String line = s.next();
            if (line.startsWith("/*!") && line.endsWith("*/")) {
                int i = line.indexOf(' ');
                line = line.substring(i + 1, line.length() - " */".length());
            }

            if (line.trim().length() > 0) {
                st.execute(line);
            }
        }

        if (st != null) {
            st.close();
        }
    }
}
