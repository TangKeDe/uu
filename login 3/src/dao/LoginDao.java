package dao;

import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DB;
import entity.UserBean;


public class LoginDao {
	private DB connection = null;

	public LoginDao() {
		connection = new DB();
	}

	public UserBean login(UserBean loginer){
		boolean mark=false;
		if(loginer!=null){
			String sql;
			ResultSet rs;
			switch(loginer.getuser_identity()) {
				case "1":
					sql="select * from tb_master where master_name='"+loginer.getuser_name()+"' and master_password='"+secret(loginer.getuser_password())+"'";
					rs=connection.executeQuery(sql);
					try {
						mark= rs != null && rs.next();
					} catch (SQLException e) {
						mark=false;
						e.printStackTrace();
					}
					try {
						rs.close();
						connection.closed();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case "2":
					//System.out.println(loginer.getuser_name() + " " + loginer.getuser_password() + " ");
					sql="select * from tb_student where stu_account='"+loginer.getuser_name()+"' and stu_password='"+secret(loginer.getuser_password())+"'";
					rs=connection.executeQuery(sql);
					try {
						if(rs!=null&&rs.next())
						{
							mark=true;
							loginer.setname(rs.getString(3));
							loginer.setuser_subject(rs.getString(4));
							loginer.setuser_class(rs.getString(5));
							loginer.setsubjectnumber(rs.getInt(6));
							for(int i=0;i<=loginer.getsubjectnumber();i++)
							{
								loginer.addscore(rs.getString(5+i*2),rs.getString(6+i*2));           //如果数据库有变动，这里都要改
							}
						}
						else{
							mark=false;
							System.out.println("not found");
						}

					} catch (SQLException e) {
						mark=false;
						e.printStackTrace();
					}
					try {
						rs.close();
						connection.closed();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					break;
				case "3":
					sql="select * from tb_teacher where teacher_account='"+loginer.getuser_name()+"' and teacher_password='"+secret(loginer.getuser_password())+"'";
					rs=connection.executeQuery(sql);
					try {
						if(rs!=null&&rs.next())
						{
							mark=true;
							loginer.setname(rs.getString(3));
							loginer.setuser_tea(rs.getString(4));
							loginer.setuser_data(rs.getString(5));
						}
						else
							mark=false;
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
					break;
			}
		}
		if(!mark)
			return null;
		else
			return loginer;
	}

	public boolean changeserct(UserBean loginer) {
		/* 生成SQL语句 */
		String sql = null;
		//修改密码
		switch(loginer.getuser_identity()) {
			case "1":
				sql = "update tb_master set master_password= '"+secret(loginer.getuser_password())
						+"' where master_name= '"+loginer.getuser_name() + "'";
				break;
			case "2":
				sql = "update tb_student set stu_password= '"+secret(loginer.getuser_password())
						+"' where stu_account= '"+loginer.getuser_name()+"'";
				break;
			case "3":
				sql = "update tb_teacher set teacher_password= '"+secret(loginer.getuser_password())
						+"' where teacher_account= '"+loginer.getuser_name()+ "'";
				break;
		}
		/* 执行SQL语句 */
		return connection.executeUpdate(sql);
	}

	/* 加密函数 */
	public String secret(String strs)
	{
		StringBuilder sb = new StringBuilder();
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] bs = digest.digest(strs.getBytes());
			/*
			 * 加密后的数据是-128 到 127 之间的数字，这个数字也不安全。
			 * 取出每个数组的某些二进制位进行某些运算，得到一个新的加密结果
			 *
			 *  0000 0011 0000 0100 0010 0000 0110 0001
			 * &0000 0000 0000 0000 0000 0000 1111 1111
			 * ---------------------------------------------
			 *  0000 0000 0000 0000 0000 0000 0110 0001
			 *
			 *  把取出的数据转成十六进制数
			 */
			for (byte b : bs) {
				int x = b & 255;
				String s = Integer.toHexString(x);
				if (x < 16) {
					sb.append("0");
				}
				sb.append(s);
			}

		} catch (Exception e) {
			return "";
		}
		return sb.toString();
	}
    public boolean operationuser(String oper,UserBean userBean) {
        /* 生成SQL语句 */
        String sql = null;
        if (oper.equals("add2"))					//增加学生
            sql = "insert into tb_student"+"(stu_account,stu_password,stu_name," +
                    "stu_specialty,stu_class,stu_subjectnumber) values ('"
                    + userBean.getuser_name() + "','"+ secret(userBean.getuser_password()) + "','"
                    + userBean.getname() + "','"+ userBean.getuser_subject()+ "','"
                    + userBean.getuser_class()+ "'," + userBean.getsubjectnumber()+ ")";

        if (oper.equals("add3"))					//增加老师
            sql = "insert into tb_teacher"+"(teacher_account,teacher_password,teacher_name," +
                    "teacher_subject,teacher_entry_year) values ('"
                    + userBean.getuser_name() + "','"+ secret(userBean.getuser_password()) + "','"
                    + userBean.getname() + "','"+ userBean.getuser_tea()+ "','"
                    + userBean.getuser_data()+ "')";

        if (oper.equals("modify2"))				//修改学生
            sql = "update tb_student set stu_name='" + userBean.getname()+ "',stu_specialty='"
                    + userBean.getuser_subject() + "',stu_class='"+ userBean.getuser_class()
                    + "',stu_subjectnumber=" + userBean.getsubjectnumber()+" where stu_account='" + userBean.getuser_name()+"'";
        if (oper.equals("modify3"))				//修改老师
            sql = "update tb_teacher set teacher_name='" + userBean.getname()+ "',teacher_subject='"
                    + userBean.getuser_tea() + "',teacher_entry_year='"+ userBean.getuser_data()
                    +"' where teacher_account ='" + userBean.getuser_name()+"'";

        if (oper.equals("delete2"))				//删除学生
            sql = "delete from tb_student where stu_account = '" + userBean.getuser_name()+"'";

        if (oper.equals("delete3"))				//删除老师.
            sql = "delete from tb_teacher where teacher_account = '" + userBean.getuser_name()+"'";

		System.out.println(sql);
        /* 执行SQL语句 */
        boolean flag =connection.executeUpdate(sql);
        return flag;
    }
	public UserBean serch_one(String oper,String num) {
		String sql="";
		UserBean userBean = new UserBean();
		if(oper.equals("stu"))
		{
			sql = "select * from tb_student where stu_account='"+num+"'";
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取学生信息 */

						userBean.setuser_name(rs.getString(1));
						userBean.setname(rs.getString(3));
						userBean.setuser_subject(rs.getString(4));
						userBean.setuser_class(rs.getString(5));
						userBean.setsubjectnumber(rs.getInt(6));
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
		}
		if(oper.equals("tea"))
		{
			sql = "select * from tb_teacher where teacher_account='"+num+"'";
			ResultSet rs = connection.executeQuery(sql);
			if(rs!=null){
				try {
					while (rs.next()) {
						/* 获取老师信息 */
						userBean.setuser_name(rs.getString(1));
						userBean.setname(rs.getString(3));
						userBean.setuser_tea(rs.getString(4));
						userBean.setuser_data(rs.getString(5));

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
		}
		return userBean;
	}
    public List<UserBean> get_Userlist(String oper) {
        List<UserBean> userlist = new ArrayList<UserBean>();
        String sql="";
        if(oper.equals("stu"))
        {
            sql = "select * from tb_student";
            ResultSet rs = connection.executeQuery(sql);
            if(rs!=null){
                try {
                    while (rs.next()) {

                        UserBean userBean = new UserBean();
                        userBean.setuser_name(rs.getString(1));
                        userBean.setname(rs.getString(3));
                        userBean.setuser_subject(rs.getString(4));
                        userBean.setuser_class(rs.getString(5));
                        userBean.setsubjectnumber(rs.getInt(6));
                        userBean.setuser_password(rs.getString(2));
                        userlist.add(userBean);
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
        }
        if(oper.equals("tea"))
        {
            sql = "select * from tb_teacher";
            ResultSet rs = connection.executeQuery(sql);
            if(rs!=null){
                try {
                    while (rs.next()) {
                        UserBean userBean = new UserBean();
                        userBean.setuser_name(rs.getString(1));
                        userBean.setname(rs.getString(3));
                        userBean.setuser_tea(rs.getString(4));
                        userBean.setuser_data(rs.getString(5));
                        userBean.setuser_password(rs.getString(2));
                        userlist.add(userBean);
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
        }
        return userlist;
    }

}