package org.gdpi.neusoft.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import net.sf.json.JSONArray;

public class Power {
	/**
	 * 添加权限
	 * @param power 权限集合
	 * @param powerID 权限ID
	 * @return 添加成功返回true,如果权限已存在返回false
	 */
	public static boolean add(List<Integer> power,Integer powerID) {
		if(power.contains(powerID)) {
			return false;
		}else {
			power.add(powerID);
			return true;
		}
	}
	
	/**
	 * 删除权限
	 * @param power 权限集合
	 * @param powerID 权限ID
	 * @return 删除成功返回true,如果权限不存在返回false
	 */
	public static boolean delete(List<Integer> power,Integer powerID) {
		if(power.contains(powerID)) {
			power.remove(powerID);
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 权限格式化
	 * @param power 权限字符串
	 * @return 权限集合
	 */
	@SuppressWarnings("unchecked")
	public static List<Integer> format(String power){
		List<Integer> list=new ArrayList<>();
		list=JSONArray.fromObject(power);
		return list;
	}
	/**
	 * 格式化权限
	 * @param power 权限集合
	 * @return 权限字符串
	 */
	public static String format(List<Integer> power) {
		return JSONArray.fromObject(power).toString();
	}
	/**
	 * 格式化权限
	 * @param power 权限数组
	 * @return 权限字符串
	 */
	public static String format(Integer[] power) {
		return format(Arrays.asList(power));
	}
	/** 
	 * 增加用户
	 * @param power
	 * @return
	 */
	public static boolean hasAddUser(List<Integer> power) {
		return power.contains(1);
	}
	/**
	 *  删除用户
	 * @param power
	 * @return
	 */
	public static boolean hasDeleteUser(List<Integer> power) {
		return power.contains(2);
	}
	/**
	 *  查找用户
	 * @param power
	 * @return
	 */
	public static boolean hasSelectUser(List<Integer> power) {
		return power.contains(3);
	}
	/**
	 *  修改用户
	 * @param power
	 * @return
	 */
	public static boolean hasUpdateUser(List<Integer> power) {
		return power.contains(4);
	}
	/**
	 *  增加管理员
	 * @param power
	 * @return
	 */
	public static boolean hasAddAdmin(List<Integer> power) {
		return power.contains(5);
	}
	/**
	 *  删除管理员
	 * @param power
	 * @return
	 */
	public static boolean hasDeleteAdmin(List<Integer> power) {
		return power.contains(6);
	}
	/**
	 *  查找管理员
	 * @param power
	 * @return
	 */
	public static boolean hasSelectAdmin(List<Integer> power) {
		return power.contains(7);
	}
	/**
	 *  修改管理员
	 * @param power
	 * @return
	 */
	public static boolean hasUpdateAdmin(List<Integer> power) {
		return power.contains(8);
	}
	/**
	 *  增加商品
	 * @param power
	 * @return
	 */
	public static boolean hasAddGoods(List<Integer> power) {
		return power.contains(9);
	}
	/**
	 *  删除商品
	 * @param power
	 * @return
	 */
	public static boolean hasDeleteGoods(List<Integer> power) {
		return power.contains(10);
	}
	/**
	 *  查找商品
	 * @param power
	 * @return
	 */
	public static boolean hasSelectGoods(List<Integer> power) {
		return power.contains(11);
	}
	/**
	 *  修改商品
	 * @param power
	 * @return
	 */
	public static boolean hasUpdateGoods(List<Integer> power) {
		return power.contains(12);
	}
	/**
	 *  增加商品分类
	 * @param power
	 * @return
	 */
	public static boolean hasAddCategory(List<Integer> power) {
		return power.contains(13);
	}
	/**
	 *  删除商品分类
	 * @param power
	 * @return
	 */
	public static boolean hasDeleteCategory(List<Integer> power) {
		return power.contains(14);
	}
	/**
	 *  查找商品分类
	 * @param power
	 * @return
	 */
	public static boolean hasSelectCategory(List<Integer> power) {
		return power.contains(15);
	}
	/**
	 *  修改商品分类
	 * @param power
	 * @return
	 */
	public static boolean hasUpdateCategory(List<Integer> power) {
		return power.contains(16);
	}
	/**
	 *  增加订单
	 * @param power
	 * @return
	 */
	public static boolean hasAddOrder(List<Integer> power) {
		return power.contains(17);
	}
	/**
	 *  删除订单
	 * @param power
	 * @return
	 */
	public static boolean hasDeleteOrder(List<Integer> power) {
		return power.contains(18);
	}
	/**
	 *  查找订单
	 * @param power
	 * @return
	 */
	public static boolean hasSelectOrder(List<Integer> power) {
		return power.contains(19);
	}
	/**
	 *  修改订单
	 * @param power
	 * @return
	 */
	public static boolean hasUpdateOrder(List<Integer> power) {
		return power.contains(20);
	}
}
