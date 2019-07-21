package org.gdpi.neusoft.test.table;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.neusoft.bean.Author;
import org.gdpi.neusoft.bean.Category;
import org.gdpi.neusoft.dao.CategoryDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:application-dao.xml" })
public class WriteCategory {
	@Resource
	CategoryDao categoryDao;

	@Test
	public void write() {
		// 一级菜单
		String[] menu1 = { "女装", "女鞋", "男装", "男鞋", "内衣", "母婴", "手机", "数码", "家电", "美妆", "箱包", "运动", "户外", "家装", "家纺",
				"居家百货", "鲜花宠物", "配饰", "食品", "生鲜", "汽车摩托", "医药", "图书", "通信", "洗护", "乐器" };
		// 二级菜单
		String[][] menu2 = { 
				{ "风格馆", "气质裙装", "时尚内搭", "百搭裤装", "特色服装", "潮流外套" },
				{"时尚女鞋", "国际大牌", "秋冬流行" },//女鞋
				{"热卖分类", "男士外套", "休闲裤" },//男装
				{"流行男鞋", "国际大牌", "热卖潮牌" },//男鞋
				{"热卖品类", "保暖内衣", "睡衣家居服" },//内衣
				};
		// 三级菜单
		String[][][] menu3 = 
			{ 
				{ 
					{ "欧美风", "文艺风", "街头风", "甜美风", "学院风", "田园风" },
					{ "印花连衣裙", "麻花连衣裙", "吊带连衣裙", "碎花连衣裙", "波点连衣裙", "欧根纱连衣裙", "真丝连衣裙", "沙滩裙", "波西米亚裙", "鱼尾裙", "百褶裙", "旗袍" },
					{ "衬衫", "雪纺衫", "蕾丝衫", "T恤", "针织衫", "高领毛衣" },
					{ "休闲裤", "牛仔裤", "正装裤", "铅笔裤", "哈伦裤", "直筒裤", "微喇裤", "阔腿裤", "工装裤", "灯笼裤", "背带裤", "连衣裤" },
					{ "中老年女装", "大码女装", "设计师原创品牌", "休闲套装", "职业套装", "时尚套装", "名族服饰", "舞台服饰", "婚纱" }, 
					{ "牛仔外套", "短外衣" }
				},
				{
					{"休闲鞋", "帆布鞋", "高跟鞋","凉鞋", "婚鞋"},
					{"沙驰", "凯瑞奇", "ecco","思加图", "真美诗"},
					{"穆勒鞋", "过膝靴", "乐福鞋","小白鞋", "牛津鞋"}
					},
					{
						{"夹克", "休闲裤", "T恤","牛仔裤", "衬衫"},
						{"牛仔外套", "风衣", "卫衣","棒球服", "西服"},
						{"修身版型", "商务休闲", "免烫版型","束脚裤", "直筒版型"}
					},

					{
						{"休闲皮鞋", "商务休闲鞋", "板鞋","运动休闲鞋", "凉鞋"},
						{"阿迪达斯", "耐克", "ecco","CAT", "暇步士"},
						{"GXG", "马克华菲", "飞跃","爱得堡", "米先生"}
					},
					{
						{"内衣馆", "大牌文胸", "秋冬保暖","配饰馆", "女士围巾/披肩"},
						{"保暖上衣", "保暖裤", "男士保暖","女士保暖", "打底裤"},
						{"女士睡衣", "男士睡衣", "情侣睡衣","卡通睡衣", "亲子睡衣"}
					}

			};
		Integer menu1Start=1;
		Integer menu2Start=menu1.length+menu1Start;
		Integer menu3Start=0;
		for(int i=0;i<menu2.length;i++){
			menu3Start=menu3Start+menu2Start+menu2[i].length;
		}
		Author author=new Author();
		author.setCreatedUser(1);
		author.setCreatedTime(new Date());
		for(int i=0;i<menu1.length;i++){
			Category category1=new Category();
			category1.setAuthor(author);
			category1.setId(menu1Start);
			category1.setName(menu1[i]);
			category1.setOrders(i+1);
			category1.setParentId(0);
			category1.setStatus(1);
			categoryDao.insert(category1);
			if(i>=menu2.length){
				menu1Start++;
				continue;
			}
			for(int j=0;j<menu2[i].length;j++){
				Category category2=new Category();
				category2.setAuthor(author);
				category2.setId(menu2Start);
				category2.setName(menu2[i][j]);
				category2.setOrders(j+1);
				category2.setParentId(menu1Start);
				category2.setStatus(1);
				categoryDao.insert(category2);
				if(j>=menu3[i].length){
					menu2Start++;
					continue;
				}
				for(int z=0;z<menu3[i][j].length;z++){
					Category category3=new Category();
					category3.setAuthor(author);
					category3.setId(menu3Start);
					category3.setName(menu3[i][j][z]);
					category3.setOrders(z+1);
					category3.setParentId(menu2Start);
					category3.setStatus(1);
					categoryDao.insert(category3);
					menu3Start++;
				}
				menu2Start++;
			}
			menu1Start++;
		}
	}
}
