package org.gdpi.neusoft.test.service;

import javax.annotation.Resource;

import org.gdpi.neusoft.service.CategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:application-dao.xml","classpath:application-service.xml" })
public class TestCategoryService {
	@Resource
	CategoryService categoryService;

	@Test
	public void select() {
		System.out.println(categoryService.select(2, 0, 1000));
	}
}
