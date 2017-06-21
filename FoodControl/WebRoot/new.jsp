<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" deferredSyntaxAllowedAsLiteral="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"></link>
  <script type="text/javascript" src="bootstrap/jquery/jquery-2.1.3.min.js"></script>
   <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
   <style type ="text/css">
   		body{
   			margin:0px;
   			padding:0px;
   			position:relative;
   		}
   		#zbtop{
   			border:1px solid red;			
			width:auto;
			height:100px;
   		}
   		#zbleft{
   			border:1px solid yellow;
   		}
   		#zbright{
   			border:1px solid green;
   			position:Absolute;
   			margin-left:190px;
   			margin-top:-350px;
   			
   		}
   		#zbright div{
   			float:left;
   			width:300px;
   			height:300px;
   			margin-top:00px;
   			
   			text-align:center;
   		}
   		#zbbutton1{
			border:0px;
			font-size:20px;
			color:green;
			margin-left:30px;
		}
		#z1{
			position:absolute;
			top:-100px;
			height:0px;
			background-color:gray;
			z-index:3;
			filter:alpha(opacity=70);
			opacity:0.8!impotrant;
			display:none;
		}
		#z2{
			position:absolute;
			top:-50px;
			left:100px;
			z-index:100;
			
			display:none;
		}
		#food-btn{
			
		}
   </style>
   </head>
  
<body>

  <div class="container-fluid">
	<div class="row">
<!-- 头部 -->
		<div id="zbtop">
			<a type="button" class="btn btn-default"id="zbbutton1" href = "home.jsp"><h1 class="glyphicon glyphicon-home"></h1></a><!-- 主页 -->
			<button type="button" class="btn btn-default" id="zbbutton1"><h1 class="glyphicon glyphicon-map-marker"><input type ="text" size="10px"/></h1></button><!-- 模糊查询菜名 -->
			<button type="button" class="btn btn-default"id="zbbutton1"><h1 class="glyphicon glyphicon-bell">呼叫员工</h1></button><!-- 呼叫员工按钮 -->
			
			<span>当前系统时间：</span><span id="date_1"></span>
			<span id="dishname">牡丹阁</span><span>桌</span>
		</div>
<!-- 左侧 -->		
		<div class=" col-md-2" id="zbleft">
			<div id="navbarExample" class="navbar navbar-static">
		        <div class="navbar-inner">
		            <div class="container" style="width: auto;">                
		                <ul class="nav">
		                    <li class="active"><a href="#php">
		                     <button type="button" class="btn btn-primary btn-lg" >凉菜</button>
		
		                    </a></li>
		                    <li class="active"><a href="#js">
		                     <button type="button" class="btn btn-primary btn-lg" >主食</button>
		                    
		                    </a></li>
		                    <li class="active"><a href="#mysql">
		                     <button type="button" class="btn btn-primary btn-lg" >热菜</button>
		                    
		                    </a></li>
		                    <li class="active"><a href="#pgsql">
		                     <button type="button" class="btn btn-primary btn-lg" >小吃</button>
		                    
		                    </a></li>
		                    <li class=""><a href="#mgdb">
		                     <button type="button" class="btn btn-primary btn-lg" >特色</button>
		                    
		                    </a></li>
		                    
		                </ul>
		            </div>
		        </div>
		    </div>
			</div>
		</div>
<!-- 右侧打开网页自动添加菜单 -->
		<div class=" col-md-10" id="zbright">
			<c:forEach var="next"  items="${dishList}" varStatus="statu">
				<div>
					<img  onclick = "show()" src="image/2.png" alt="..." class="img-circle" width="200" height="200"><br/>
					<span name="name${statu.index}">${next[1]}</span>:  <span name="name${statu.index}">${next[2]}</span>元 / 份<br/>
					<div class="row" >
						<div class=" center-block"  id="food-btn">
							<input type="button" name="name${statu.index}" value="-1" class="remove btn btn-default">
							<input type="text" value="0" class="number-cl btn btn-default" size="3" name="name${statu.index}">
							<input type="button" name="name${statu.index}" value="+1" class="add btn btn-default">
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
<!-- 底部 -->		
		<div id="zbbottom">
   
			<nav class="navbar-button navbar-fixed-bottom">
				<button type="button" id="LookOrder" class="btn btn-lg btn-info col-md-offset-10" data-toggle="modal" data-target="#myMenu">我点的菜 价格：<span id="Total">0</span></button>
			</nav>
				
				<div class="modal fade" id="myMenu"> <!-- modal把div的内容识别为模态框 fade模态框切换时内容淡入淡-->
					<div class="modal-dialog">
						<div class="modal-content"><!-- 模态框居中显示-->
							<div class="modal-header"> <!-- 模态框标题-->
								<button type="button" class="close"			data-dismiss=modal>×
								</button>
								<h4 class="modal-title" id="MyMenuLabel">		我点的菜<button type="button" id="clear" class="btn btn-danger">
									清空菜单
								</button> 
								</h4>
							</div>
							<div class="modal-body" id="modall-add" > <!-- 模态框显示的主要内容-->
								<table class="modall-table table table-striped" id="modall-table">
									
								</table>
							</div>
							
							<div class="modal-footer"> <!-- 模态框下的关闭和保存按钮--> 
								<span>点菜数量：</span><span id="foodnum"></span> <span>总价：</span><span id="mtTotal"></span>
								<button type="button" class="btn btn-default" data-dismiss="modal">
									关闭
								</button>
								<button type="button" class="btn btn-danger" id="order">
									立刻下单
								</button> 
							</div>
						</div>
					</div>
				</div>
	  		</div>
		</div><!-- 底部div -->
		

  
  
 
		<script>
			
			
				//添加菜品，更新菜单和总价
				function upfood(btnid,foodname,uprice,number,price){	
					$.ajax({
						type:"post",
						url:"addfood_addFood.action",
						data:{"addfood.foodname":foodname,"addfood.uprice":uprice,"addfood.number":number,"addfood.price":price},
						success:function(data){
							OrderTotal();
						}
					});
				};
				
				function OrderTotal(){
					$.ajax({
						type:"post",
						url:"addfood_OrderTotal.action",
						success:function(data){
							var json=JSON.parse(data);
							$("#Total").html(json.price);
							$("#mtTotal").html(json.price);
							$("#foodnum").html(json.num);
						}
					});
				};
				//减少点菜的数量更新总价
				$("#zbright").on('click',".remove",function(){
					var btnid=$(this).attr("name");//当前点击的按钮的name
					alert(btnid);
					var foodname=$($("span[name=\""+btnid+"\"]")[0]).html();//当前添加的菜名
					var uprice=parseInt($($("span[name=\""+btnid+"\"]")[1]).html());//单价
					var number=parseInt($($("input[name=\""+btnid+"\"]")[1]).val())-1;
					//alert(btnid+","+foodname+","+uprice+","+number);
					if(number<0){
						number=0;
					}
					var price=uprice*number;//价格*数量获得总价	
					$($("input[name=\""+btnid+"\"]")[1]).val(number);
						upfood(btnid,foodname,uprice,number,price);
				});
				//输入框失焦事件更新总价
				$("#zbright").on('blur',".number-cl",function(){
					
				});
				//增加点菜的数量更新总价
				$("#zbright").on('click',".add",function(){
					var btnid=$(this).attr("name");//当前点击的按钮的name
					var foodname=$($("span[name=\""+btnid+"\"]")[0]).html();//当前添加的菜名
					var uprice=parseInt($($("span[name=\""+btnid+"\"]")[1]).html());//单价
					var number=parseInt($($("input[name=\""+btnid+"\"]")[1]).val())+1;
					var price=uprice*number;//价格*数量获得总价	
					$($("input[name=\""+btnid+"\"]")[1]).val(number);
						upfood(btnid,foodname,uprice,number,price);
				});
				//点击查看我的菜单
				$("#LookOrder").click(function(){				
					LookOrder();
				});
				//刷新菜单
				function LookOrder(){				
					$.ajax({
						type:"post",
						url:"addfood_lookFood.action",
						data:{"df":"df"},
						success:function(data){
							var json=JSON.parse(data);
							$("#modall-table").html("<tr><td>菜名</td><td>单价</td><td>数量</td><td>总价</td><td></td></tr>");
							$.each(json,function(index,value){
								var dd="<tr>"+"<td name=\""+index+"\">"+value.foodname+"</td>"+"<td>"+value.uprice+"</td>"+"<td>"+value.number+"</td>"+"<td>"+value.price+"</td>"+"<td><button class=\"btn btn-danger\" name=\""+index+"\" id=\"del\">删除</button></td>"+"</tr>";
								$("#modall-table").append(dd);
							});	
							OrderTotal();
						}
					});
				}
				
				//清除所有我的菜单
				$("#clear").click(function(){
					//alert("dff");
					$.ajax({
						type:"post",
						url:"addfood_clearfood.action",
						data:{"df":"df"},
						success:function(data){
								//alert("ss");
								LookOrder();
						}
					});
				});
				$("#modall-table").on('click',"#del",function(){
					var btnname=$(this).attr("name");
					var foodname=$($("td[name=\""+btnname+"\"]")[0]).html();
					$.ajax({
						type:"post",
						url:"addfood_delfood.action",
						data:{"addfood.foodname":foodname},
						success:function(data){
								//alert("ss");
								LookOrder();
						}
					});
					
				});
				//下单获得订单信息和菜单信息，桌号
				$("#order").click(function(){
					alert("dff");
					var orderStatus=15;
					var orderPrice=parseInt($("#mtTotal").html());
					var foodNum=parseInt($("#foodnum").html());
					var cost=9;
					//获得菜单数据
					$.ajax({
						type:"post",
						url:"addfood_addOrder.action",
						data:{"addorder.orderStatus":orderStatus,"addorder.orderPrice":orderPrice,"addorder.foodNum":foodNum,"addorder.cost":cost},
						success:function(data){
								if(data!=-1){
									alert("下单成功");
								}
						}
					});
							
				});
				
				
				function getTime(){
    				var time = new Date();
   				 	$("#date_1").html(time.toLocaleString());
				}
				$(function(){
    				setInterval("getTime()",1000);
				});
				
		</script>
		<script type="text/javascript" language="javascript">
			var z1=document.getElementById("z1");
			var z2=document.getElementById("z2");
			function show(){
				z1.style.width=document.body.offsetWidth+"px";
				z1.style.height=document.body.offsetHeight+"px";
				z1.style.display="block";
				z2.style.display="block";
			}
			function close1(){
				z1.style.display="none";
				z2.style.display="none";
			}
  		</script>
</body>
</html>
