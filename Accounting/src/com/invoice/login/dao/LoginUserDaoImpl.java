package com.invoice.login.dao;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import com.invoice.login.beans.Login;
import com.invoice.login.beans.Login1;


@Component(value="loginUserDao")

public class LoginUserDaoImpl implements LoginUserDao {

	//private static String sql;
	private JdbcTemplate jdbcTemplate;
	

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Autowired	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Login authonticationDao(String userName, String password) {
		
		String sql = "select * from login where username = ?" ;
		/*Iterator it = list.iterator();
        while(it.hasNext())
        {
            Object o = it.next();
            System.out.println(o.toString());
        }*/
     /*   List<Login1> Listl1  = getJdbcTemplate().query(sql,new BeanPropertyRowMapper(Login1.class));
     for(Login1 lx:Listl1)
     {
    	 System.out.println("lx="+lx.getEmpUserId());
     }
        Login1 l1=Listl1.get(0);*/
		try{
		Login1 l1 = (Login1)getJdbcTemplate().queryForObject(sql, new Object[] { userName }, new BeanPropertyRowMapper(Login1.class));
        //System.out.println("l1.getUname()="+l1.getUsername());
        //System.out.println("l1.getPassword()="+l1.getPassword());
        //System.out.println("l1.getRole()="+l1.getUserrole());
		if(userName.equals(l1.getUsername())&& password.equals(l1.getPassword()))
		{
		Login login=new Login();
		login.setUname(l1.getUsername());
		login.setEmpUserId(l1.getEmpId());
		login.setFlag(true);
		ArrayList<String>r=new ArrayList<String>();
		String str=l1.getUserrole();
		StringBuilder strRole=new StringBuilder();
		for(int i=0;i<str.length();i++)
		{
			if(str.charAt(i)!='/')
			{
				strRole.append(str.charAt(i));
			}
			else
			{
				//System.out.println("strRole="+strRole);
				r.add(strRole.toString());
				//System.out.println("strRole.toString()="+strRole.toString());
				strRole.delete(0, strRole.length());
				continue;
			}
		}
		login.setRole(r);
		return login;
		}else
		{
			return null;
		}
		}catch(Exception e)
		{
			return null;
		}
		/*final List<Login> loginList=getJdbcTemplate().query(sql, new RowMapper<Login>() {
			private List<Login> vList=new ArrayList<Login>();
			public Login mapRow(ResultSet rs,int rowNo)throws SQLException
			{
				Login login=new Login();
								
				vList.add(vender);
				return vender;
			}	
		});	*/	
			
	}

	@Override
	public int Count() 
	{
		int cnt = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM login", Integer.class);
		return cnt;
	}


	}


