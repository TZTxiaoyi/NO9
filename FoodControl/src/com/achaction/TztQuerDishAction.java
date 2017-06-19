package com.achaction;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.entity.TztDishOrder;
import com.logic.TztDishOrderImp;
import com.utils.toJson;

/**
 * 
 * @类功能说明：  
 * @类修改者：  
 * @修改日期：  
 * @修改说明：   
 * @作者：TZT
 * @创建时间：2017-6-16 上午12:00:46  
 * @版本：V1.0
 */
public class TztQuerDishAction {
	/**
	 * 
	 * 方法功能说明：  查询需要制作的菜
	 * 创建：2017-6-16 by TZT   
	 * 修改：日期 by 修改者  
	 * 修改内容：  
	 * @参数： @return      
	 * @return String     
	 * @throws
	 */
	public void queryMade() {
		HttpServletResponse rep= ServletActionContext.getResponse();
		rep.setContentType("text/html;charset=utf-8");
		TztDishOrderImp dao =new TztDishOrderImp();
		TztDishOrder dishorder = new TztDishOrder();
		List result = dao.queryMade();
		System.out.println(result.size());
		try {
			rep.getWriter().print(toJson.toJson("tztjs", result).toString());
			System.out.println(toJson.toJson("tztjs", result));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
		
	}
	/**
	 * 
	 * 方法功能说明：  查询正在制作的菜
	 * 创建：2017-6-17 by TZT   
	 * 修改：日期 by 修改者  
	 * 修改内容：  
	 * @参数：       
	 * @return void     
	 * @throws
	 */
	public void queryMading() {
		HttpServletResponse rep =ServletActionContext.getResponse();
		rep.setContentType("html/text;charset =utf-8");
		TztDishOrderImp  dao =new TztDishOrderImp();
		TztDishOrder dishorder = new TztDishOrder();
		List result = dao.queryMading();
		System.out.println(result.size());
		try {
			rep.getWriter().print(toJson.toJson("tztjs", result).toString());
			System.out.println(toJson.toJson("tztjs", result));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			e.getMessage();
		}
	}
}
