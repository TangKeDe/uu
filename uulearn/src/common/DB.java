package common;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
    private final String url = "jdbc:mysql://localhost:3306/uulearn";
    private final String userName = "root";
    private final String password = "yuan199803144323";
    private Connection con = null;
    private Statement stm=null;

    /* ͨ�����췽���������ݿ����� */
    public DB(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("�������ݿ�����ʧ�ܣ�");
        }
    }
    /* �������ݿ����� */
    public void createCon() {
        try {
            con = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("��ȡ���ݿ�����ʧ�ܣ�");
        }
    }

    /* �������ݿ����� */
    public Connection getCon() {
        try {
            con = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("��ȡ���ݿ�����ʧ�ܣ�");
        }
        return con;
    }

    /* ��ȡStatement���� */
    public void getStm(){
        createCon();
        try {
            stm=con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("����Statement����ʧ�ܣ�");
        }
    }
    /**
     * @���� �����ݿ�����ӡ��޸ĺ�ɾ���Ĳ���
     * @���� sqlΪҪִ�е�SQL���
     * @����ֵ boolean��ֵ
     */
    public boolean executeUpdate(String sql) {

        boolean mark=false;
        try {
            getStm();
            int iCount = stm.executeUpdate(sql);
            if(iCount>0)
                mark=true;
            else
                mark=false;
        } catch (Exception e) {
            e.printStackTrace();
            mark=false;
        }
        return mark;
    }
    /* ��ѯ���ݿ� */
    public ResultSet executeQuery(String sql) {
        ResultSet rs=null;
        try {
            getStm();
            try {
                rs = stm.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("��ѯ���ݿ�ʧ�ܣ�");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    /* �ر����ݿ�Ĳ��� */
    public void closed() {
        if(stm!=null)
            try {
                stm.close();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("�ر�stm����ʧ�ܣ�");
            }
        if(con!=null)
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("�ر�con����ʧ�ܣ�");
            }
    }
}
