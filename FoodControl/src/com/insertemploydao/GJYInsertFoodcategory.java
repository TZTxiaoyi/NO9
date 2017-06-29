package com.insertemploydao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.GJYFoodCategory;

import com.utils.DaoFactory;

public class GJYInsertFoodcategory {
	
	
	/*删除菜品*/
	public int delect(GJYFoodCategory FC){
		System.out.println("delect");
		String sql="update dish set dishState=20 where dishId=?";
		System.out.println(FC.getDishId());
		Object[] params=new Object[]{FC.getDishId()};
		return DaoFactory.Updata(sql, params);	
	}
	
	
	
	/*添加菜品*/
	public int FCinsert(GJYFoodCategory FC){
		String sql="insert into dish values(?,?,?,?,?,?,?,?)";
		Object[] params=new Object[]{FC.getDishName(),FC.getPrice(),FC.getKindId(),FC.getMakeTime(),FC.getPriority(),FC.getPictureName(),FC.getMaxCopies(),FC.getDishState()};
		return DaoFactory.Updata(sql, params);	
	}
	
	
	/*查询菜品*/
	public List sekFood(String ser) {
		String sql ="select  * from dish d1,kind k1 where d1.dishId not in (select top(2)  d1.dishId from dish d1)"+
					 "and d1.kindId=k1.kindId and (d1.dishName like '%"+ser+"%'or d1.dishId like '%"+ser+"%' or d1.dishName like'%"+ser+"%' or d1.price like"+ 
					 "'%"+ser+"%' or d1.kindId like'%"+ser+"%' or d1.makeTime like'%"+ser+"%' or"+ 
					 " d1.priority like'%"+ser+"%' or d1.picture like'%"+ser+"%' or d1.maxCopies like '%"+ser+"%')and d1.dishState=19 ";
				
		List list = DaoFactory.Query(sql);
		System.out.println(list);
		return list;
	
	}

	/*修改菜品*/
	public int Change(GJYFoodCategory FC){
		String sql="update dish set dishName=?,Price=?,kindId=?,makeTime=?,priority=?,picture=?,maxCopies=?,dishState=? where dishId=?";
		Object[] params=new Object[]{FC.getDishName(),FC.getPrice(),FC.getKindId(),FC.getMakeTime(),FC.getPriority(),FC.getPictureName(),FC.getMaxCopies(),FC.getDishState(),FC.getDishId()};
		return DaoFactory.Updata(sql, params);	
		
	}
	
	
	
	
	/* 返回总页码数*/
	public int getallpage(){
		String sql="select count(*) from dish where dishState=19";
		List list =DaoFactory.Query(sql);
		List list1=(List) list.get(0);
		int li=(Integer) list1.get(0);
		return li;
	}
	
	/*返回该页码的结果*/
	public List pagepage(int startIndex){
	
		//System.out.println("aaaaaaaaaa");
		String sql="select top (2) d1.dishId,d1.dishName,d1.price,k1.kindName,d1.makeTime,d1.priority,d1.picture,d1.maxCopies,d1.dishState from dish d1,kind k1 where d1.dishId not in (select top("+startIndex+"*2)d1.dishId from dish d1) and k1.kindId=d1.kindId and d1.dishState=19 order by d1.dishId asc";
		//System.out.println("ddddddddddd");
		return DaoFactory.Query(sql);
	}
}

