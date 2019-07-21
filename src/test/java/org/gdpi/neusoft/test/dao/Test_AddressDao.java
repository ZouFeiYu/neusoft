package org.gdpi.neusoft.test.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Address;
import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.dao.AddressDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:application-dao.xml"})
public class Test_AddressDao {

		@Resource
		private AddressDao addressDao;
		
		@Test
		public void insert() {
			Author author=new Author();
			author.setCreatedUser(1);
			author.setCreatedTime(new Date());
			
			Address address=new Address();
			address.setUserId(1);
			address.setRecName("mengli");
			address.setProvince("福建省");
			address.setCity("福州市" );
			address.setArea("仓山区");
			address.setTown("建新镇");
			address.setDetail("建新中心小学");
			address.setRecAddress("guangdong");
			address.setPhone("15767391345");
			address.setTelphone("0579-4174385");
			address.setRecDefault(0);
			address.setAuthor(author);
			addressDao.insertAddress(address);
		}
		
		@Test 
		public void deleteById() {
			addressDao.deleteById(1);
		}
		@Test
		public void deleteByUserId() {
			addressDao.deleteByUserId(1);
		}
		@Test
		public void selectAll() {
			List<Address> addresses= addressDao.selectAll();
			for (Address address : addresses) {
				System.out.println(address.toString());
			}
		}
		
		@Test
		public void selectByUserId() {
			List<Address> addresses= addressDao.selectByUserId(1);
			for (Address address : addresses) {
				System.out.println(address.toString());
			}
		}
		
		@Test
		public void countAddress() {
			Integer i=addressDao.countAddress();
			System.out.println(i);
		}
		@Test
		public void countAddressByUserId() {
			Integer i=addressDao.countAddressByUserId(1);
			System.out.println(i);
		}
		
		@Test
		public void update() {
			Address address=addressDao.selectById(50);
			if(address!=null) {
				address.setRecName("ccc");
				address.setRecDefault(1);
				address.setPhone("15767391234");
				addressDao.updateAddress(address);
				System.out.println(address.toString());
			}
		}
		
		@Test
		public void selectDefaultAddress() {
			Address address1=addressDao.selectDefaultAddress(1);
			System.out.println(address1.getId());
			Address address=addressDao.selectById(1);
			if(address!=null) {
				addressDao.updateRecDefault(address1.getId(), address.getId());
			}
		}
	
		@Test
		public void updateRecDefault() {
			Address oldDefault= addressDao.selectDefaultAddress(19);
			addressDao.updateRecDefault( oldDefault.getId(),42);
		}
		@Test
		public void selectById() {
			System.out.println(addressDao.selectById(40).toString());
		}
}
