package dao;

import common.DB;
import entity.CharterBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class CharterDao {
    private DB connection = null;
    private CharterBean charterBean = null;

    public  CharterDao() {
        connection = new DB();
    }


    public List get_charter(String subject) {
        /* 生成SQL语句 */
        String sql = null;
        List<CharterBean> charterlist = new ArrayList<CharterBean>();
        if(!subject.equals(""))
            sql = "select * from charter_"+subject;
        /* 执行SQL语句 */
        ResultSet rs = connection.executeQuery(sql);
        if(rs!=null){
            try {
                while (rs.next()) {
                    /* 获取文章信息 */
                    charterBean = new CharterBean();
                    charterBean.setunit(rs.getString(1));
                    charterBean.setnumber(rs.getInt(2));
                    charterBean.setname(rs.getString(3));

                    charterlist.add(charterBean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally{
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                connection.closed();
            }
        }
        return charterlist;
    }
    public CharterBean get_charter_1(String subject,String unit) {
        /* 生成SQL语句 */
        String sql = null;
        if(!subject.equals(""))
            sql = "select * from charter_"+subject + " where charter_ = '"+unit+"'";
        /* 执行SQL语句 */
        System.out.println(sql);
        ResultSet rs = connection.executeQuery(sql);
        if(rs!=null){
            try {
                while (rs.next()) {
                    /* 获取文章信息 */
                    charterBean = new CharterBean();
                    charterBean.setunit(rs.getString(1));
                    charterBean.setnumber(rs.getInt(2));
                    charterBean.setname(rs.getString(3));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally{
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                connection.closed();
            }
        }
        return charterBean;
    }
    public boolean updata(String oper,int op,CharterBean charterBean) {
        /* 生成SQL语句 */
        String sql = null;
        if (op>0)					//添加题目
            sql = "update charter_"+oper+" set num_of_question="+String.valueOf(charterBean.getnumber()+1)
                    +" where charter_='"+charterBean.getunit()+"'";
        /* 执行SQL语句 */
        boolean flag =connection.executeUpdate(sql);
        return flag;
    }
}
