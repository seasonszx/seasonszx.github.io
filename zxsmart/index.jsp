<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="java,快速开发，代码生成，自定义流程"/>
<title>Zero Xanadu Seasons</title>
<link href="css/lanrenzhijia.css" rel="stylesheet"/>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
		//var loginFlag = false;
		//var loginHelper = null;
		$(document).ready(function(){
			$('.carousel').carousel(
				{
					"pause":"false",
					"interval":0
				}
			);
			
			$('.carousel').on('slide.bs.carousel', function (event) {
				var tag = $(event.relatedTarget).attr("tag");
				var progress = $(event.relatedTarget).attr("progress");
				
				$('#img_home').attr("src", "images/home.png");
				$('#img_intro').attr("src", "images/intro.png");
				$('#img_gift').attr("src", "images/gift.png");
				$('#img_feedback').attr("src", "images/feedback.png");
				$('#img_related').attr("src", "images/related.png");
				
				$('#img_' + tag).attr("src", "images/" + tag + "_selected.png");
				
				//$("#progress").width(progress + "px");
				//$("#progress").css('left', (progress / 2) - 400 + "px");
				$("#progress").animate({width: progress, left: (progress / 2) - 400}, 500);
				playAnimation(tag);
			});
			
			$("body,html").animate({
               scrollTop:(60)
            },1200);
			
			playAnimation("home");
			
		}); 
		
		function switchlanrenzhijia(lanrenzhijiaIndex){
			$('.carousel').carousel(lanrenzhijiaIndex);
		}
		
		function playAnimation(tag){
			var ani1 = $("#lanrenzhijia_" + tag + " .ani_step_1");
			var ani2 = $("#lanrenzhijia_" + tag + " .ani_step_2");
			var ani3 = $("#lanrenzhijia_" + tag + " .ani_step_3");
			var pre_start = ((tag == "home") ? 0 : 300);
			if(ani1 != null){
				ani1.css("opacity", 0);
				setTimeout(function(){
					ani1.animate({opacity: 1}, 1000);
				}, 10 + pre_start);
			}
			if(ani2 != null){
				ani2.css("opacity", 0);
				setTimeout(function(){
					ani2.animate({opacity: 1}, 1000);
				}, 1500 + pre_start);
			}
			if(ani3 != null){
				ani3.css("opacity", 0);
				setTimeout(function(){
					$("#lanrenzhijia_" + tag + " .ani_step_3").animate({opacity: 1}, 1000);
				}, 3000 + pre_start);
			}
		}
	</script>
	<script>
		function subInfo(){
			var name = $('#name').val();
			if(name.length == 0 || name == ('必须填写真实姓名')){
				alert('姓名不能为空！');
				return false;
			}
			var tel = $('#tel').val();
			if(tel.length == 0 || tel == ('必须填写真实电话')){
				alert('电话不能为空！');
				return false;
			}
			var mail = $('#mail').val();
			if(mail.length == 0 || mail == ('必须填写邮箱')){
				alert('邮箱不能为空！');
				return false;
			}
			var qq = $('#qq').val();
			var remark = $('#remark').val();
			var datastring ='a=a'+
							'&name='+name+
							'&tel='+tel+
							'&mail='+mail+
							'&qq='+qq+
							'&remark='+remark;
	
			$.ajax({
				   type: "post",
				   url: "add_Vuserkeyinfo.action?random="+Math.random(),
				   data: datastring,
				   success: function(data){
						if(data=="succ"){
							var msg='提交成功,经过审核后，我们会将试用体验码发送到您的邮箱！';
							alert(msg);
							location.reload();
						}else{
							var msg='提交失败！';
							alert(msg);
						}
					}
				});
		}
	</script>
</head>

<body>

<div id="carousel_container" class="carousel slide full_height">
	<div class="carousel-inner full_height">
		<div id="lanrenzhijia_home" class="lanrenzhijia item active" tag="home" progress="150">
			<div id="main">
				<div id="splash">
					<div class="container splash-container">
						<span style="color: #681414;font-size:56px;font-weight: bold;">Zero Xanadu Seasons</span>
						<div id="splash_introduction" class="ani_step_2">
							<ul>
								<li>每个程序员都可以成为架构师，</li>
								<li>反复地搭建相同的框架，</li>
								<li>无尽地编写相似的代码，</li>
								<li>大量基础和资源信息表的增删改查来来回回写了多少遍，</li>
								<li>难道你的能力永远只停留在coding？</li>
								<li>。。。。。。</li>
								<li>再不从这种枯燥费时的情况解脱出来，你就真的out了!</li>
							</ul>			
						</div>
						<div id="download_btn_group" class="container ani_step_1">
							<div id="download_place_holder" class="horizental-item" ></div>
							<div class="horizental-item" style="color: #000000;font-size:16px;">
								我们存在的意义<br/>
								解决开发者花费大量的时间去编写重复的代码<br/>
								从一个coder晋升为一个designer<br/>
								提高效率，节约成本，让开发者有更多的精力去创造更有价值的东西。
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="lanrenzhijia_intro" class="lanrenzhijia item" tag="intro" progress="300">
			<div id="main">
				<div id="splash" class="ani_step_1">
					<div class="container splash-container">
						<img src="images/intro_splash.png" alt="平台介绍"/>					</div>
				</div>
			</div>
		</div>
		<div id="lanrenzhijia_gift" class="lanrenzhijia item" tag="gift" progress="450">
			<div id="main">
				<div id="splash">
					<div class="container splash-container ani_step_2">
						<img src="images/gift_splash.png" alt="X-coder_logo"/>					
					</div>
					<div id="splash_introduction" class="ani_step_2">
						<br/>
						<h2>X-coder代码生成器</h2>
						<p style="margin-top:18px;">java语言,适用于Java EE项目开发<br/>
						低耦合性,无需导入任何jar包，无需引入任何js文件，一个Jsp搞定<br/>
						简单易用，操作步骤简单，无脑下一步式操作<br/>
						DIY模板,支持用户定义自己的模板代码</p>
					</div>
					<div style="width:100%;text-align:center;">
					<a target="_blank" href="X-code/index.html"><button type="button" class="btn_6">了解详情</button></a>
					</div>				
				</div>
			</div>
		</div>
		<div id="lanrenzhijia_feedback" class="lanrenzhijia item" tag="feedback" progress="600">
			<div id="main">
				<div id="splash">
					<div class="container splash-container ani_step_2">
						<img src="images/feedback_splash.png" alt="试用申请"/>					</div>
					<div id="splash_introduction" class="ani_step_2">
						<h2>ZX快速开发平台试用申请！</h2>
						<p>
						姓名：<input id="name" placeholder="必须填写真实姓名" style="border: 2px solid #dddddd;width:200px;" maxlength="20"/>
						电话：<input id="tel" placeholder="必须填写真实电话" style="border: 2px solid #dddddd;width:200px;" maxlength="13"/><br/>
						邮箱：<input id="mail" placeholder="试用验证码将会发送到您的邮箱" style="border: 2px solid #dddddd;width:200px;" maxlength="100"/>
						Q  Q：<input id="qq" placeholder="便于我们在网上联系您" style="border: 2px solid #dddddd;width:200px;" maxlength="15"/><br/>
						备注：<input id="remark" placeholder="请说明您的用途" style="border: 2px solid #dddddd;width:470px;" maxlength="1000"/>
						</p>
					</div>
					<div style="width:100%;text-align:center;">
					<button type="button" class="btn_3" onclick="javascript:subInfo();">提 交</button>
					</div>
				</div>
			</div>
		</div>
		<div id="lanrenzhijia_related" class="lanrenzhijia item" tag="related" progress="750">
			<div id="main">
				<div id="splash" class="ani_step_1">
					<div class="container splash-container">
						<div class="horizental-item">
							<img id="related_demo" src="images/related_demo.png" alt="关于我" style="margin-top:110px;"/>
							</div>
						<div class="horizental-item">
							<div id="splash_introduction">
								<div class="container">
<pre>
作者简介：

黄家驹1962年6月10日出生在香港的一个劳工家庭，排行第四的
黄家驹有一个哥哥和两个姐姐，当黄家驹还未到两岁的时候，
家里增添了最后一个成员黄家强，他们一家七口住在九龙深水
埗苏屋邨徙置区内一个不到三十平方米的小单位。小时候的黄
家驹大部分时间都在户外活动，只是偶然从大姐的一些party中
接触到一些70年代的摇滚音乐，但是对他来说比较有印象的只
有Deep Purple及Led Zeppelin等比较重型的摇滚乐队。有一天，
黄家驹在电视中看到一位前卫英国歌手的音乐影带，他开始改
变黄家驹的命运，这位歌手就是著名的英国Glam Rock代表人
物David Bowie。

以上作者简介是在网上抄录的，
第一仅以纪念我最喜爱的beyond，第二是因为我没有自传！

以下是作者官方联系方式,其他方式均属冒充，谨防诈骗：
QQ：357817653	 昵称：绝境中的神    英文名：seasonszx
姓名：张旭	         性别：男	                    年龄：26
所在地：中国 陕西 西安			         职业：软件工程师

</pre>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="footer" >
    <div id="navbar">
		<div id="dash" ></div>
		<div id="progress"></div>
		<div id="navbtns" class="container" >
			<div class="navbtn">
				<a href="javascript:switchlanrenzhijia(0)">
					<img id="img_home" src="images/home_selected.png" alt="首页"/>
					<div>首页</div>
				</a>
			</div>
			<div class="navbtn">
				<a href="javascript:switchlanrenzhijia(1)">
					<img id="img_intro" src="images/intro.png" alt="ZX开发平台"/>
					<div>ZX开发平台</div>
				</a>
			</div>
			<div class="navbtn">
				<a href="javascript:switchlanrenzhijia(2)">
					<img id="img_gift" src="images/gift.png" alt="X-coder"/>
					<div>X-coder</div>
				</a>
			</div>
			<div class="navbtn">
				<a href="javascript:switchlanrenzhijia(3)">
					<img id="img_feedback" src="images/feedback.png" alt="在线体验"/>
					<div>在线体验</div>
				</a>
			</div>
			<div class="navbtn">
				<a href="javascript:switchlanrenzhijia(4)">
					<img id="img_related" src="images/related.png" alt="关于作者"/>
					<div>关于作者</div>
				</a>
			</div>
		</div>
    </div>
</div>
<div style="width:100%;text-align:center;">
©Copyright 2009 - 2014. All Rights Reserved to seasonszx.
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd6cd7d562b012445924528b321dd7b8d' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1252965714'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1252965714%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
</div>
</body>
</html>
<script src="js/placeholdem.min.js"></script>
<script>
			Placeholdem( document.querySelectorAll( '[placeholder]' ) );

			var fadeElems = document.body.querySelectorAll( '.fade' ),
				fadeElemsLength = fadeElems.length,
				i = 0,
				interval = 50;

				function incFade() {
					if( i < fadeElemsLength ) {
						fadeElems[ i ].className += ' fade-load';
						i++;
						setTimeout( incFade, interval );
					}
				}

				setTimeout( incFade, interval );
</script>
