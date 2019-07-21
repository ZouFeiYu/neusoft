package org.gdpi.neusoft.test.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.User;
import org.gdpi.neusoft.dao.AuthorDao;
import org.gdpi.neusoft.dao.UserDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author montreal
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:application-dao.xml"})
public class Test_User {
	@Resource
	private UserDao userDao;
	@Resource
	private AuthorDao authorDao;
	
	//插入用户
	@Test
	public void Insert() {
		String[] id= {"0","1","2","3","4","5","6","7","8","9","X"};
		String[] ph= {"0","1","2","3","4","5","6","7","8","9"};
		for(int i=100;i<200;i++) {			
			Author author =new Author();
			Date date=new Date();
			author.setCreatedTime(randomDate("2001-01-01 00:00:00","2018-12-23 20:00:00"));
			author.setCreatedUser(1);
			
			User user=new User();
			user.setNickName("user"+i);
			user.setPassword("123456");
			user.setType(3);
			user.setState(1);
			String ids="";
			for(int j=0;j<18;j++) {
				ids+=id[new Random().nextInt(id.length)];
			}
			user.setIdCard(ids);
			String phone="";
			for(int j=0;j<11;j++) {
				phone+=ph[new Random().nextInt(ph.length)];
			}
			user.setPhone(phone);
			user.setAuthor(author);
			userDao.insert(user);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	} 
	
	//删除指定id用户
	@Test
	public void deleteById() {
		userDao.delete(2);
	}
	
	//查询所有用户
	@Test
	public void findAll() {
		List<User>users=userDao.selectAll(0, 10);
		for (User user : users) {
			System.out.println(user.getName());
		}
	}
	
	//查询指定id用户
	@Test
	public void findById() {
		User user=userDao.selectById(1);
		System.out.println(user.getNickName());
	}
	//通过用户名查找用户
	@Test
	public void findByNickyName() {
		User user =userDao.selectByName("admin");
		System.out.println(user.getNickName());
	}
	
	//更新用户信息
	@Test
	public void update() {
		User user=	userDao.selectById(3);
		user.setPassword("12");
		userDao.update(user);
		System.out.println(user.getNickName());
	}
	//查看所有用户总数
	@Test
	public void useCount() {
		Integer a=userDao.UserCount();
		System.out.println(a);
	}
	
	//通过nickName或者idcard查找用户
	@Test
	public void selectByNickNameOrIDcard() {
		String content="2";
		User user =userDao.selectByNameOrIDcard(content);
		System.out.println(user.getId());
	}
	
	//查找指定类型用户总数
	@Test
	public void typeCount() {
		Integer a=userDao.TypeCount(1);
		System.out.println(a);
	}
	//查找指定类型所有用户
	@Test
	public void selectUserByType() {
		Integer count =userDao.TypeCount(1);
		List<User>users=userDao.selectByType(0, count, 1);
		for (User user : users) {
			System.out.println(user.getId()+"\t"+user.getNickName());
		}
	}
	private static Date randomDate(String beginDate,String endDate){  
        try {  
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
            Date start = format.parse(beginDate);  // 构造开始日期  
            Date end = format.parse(endDate);  // 构造结束日期  
            // getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。
            if(start.getTime() >= end.getTime()){  
                return null;  
            }  
              
            long date = random(start.getTime(),end.getTime());  
              
            return new Date(date);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }
	private static long random(long begin,long end){  
        long rtn = begin + (long)(Math.random() * (end - begin));  
// 如果返回的是开始时间和结束时间，则递归调用本函数查找随机值  
        if(rtn == begin || rtn == end){  
            return random(begin,end);  
        }  
        return rtn;  
    }  

}

