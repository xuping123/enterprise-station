<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>ThinkCMF安装</title>
<link rel="stylesheet" href="/111/public/simpleboot/themes/flat/theme.min.css" />
<link rel="stylesheet" href="/111/public/install/css/install.css" />
<link rel="stylesheet" href="/111/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css" />

</head>
<body>
	<div class="wrap">
		<div class="header">
	<h1 class="logo">ThinkCMF 安装向导</h1>
	<div class="version"><?php echo (SIMPLEWIND_CMF_VERSION); ?></div>
</div>
		<section class="section">
			<div class="step">
				<ul class="unstyled">
					<li class="on"><em>1</em>检测环境</li>
					<li class="current"><em>2</em>创建数据</li>
					<li><em>3</em>完成安装</li>
				</ul>
			</div>
			<form id="js-install-form" action="/111/index.php?g=install&a=step4" method="post">
				<input type="hidden" name="force" value="0" />
				<div class="server">
					<table width="100%">
						<tr>
							<td class="td1" width="100">数据库信息</td>
							<td class="td1" width="200">&nbsp;</td>
							<td class="td1">&nbsp;</td>
						</tr>
						<tr>
							<td class="text-left">数据库服务器：</td>
							<td><input type="text" name="dbhost" id="dbhost" value="localhost" class="input"></td>
							<td>
								<div id="js-install-tip-dbhost">
									<span class="gray">数据库服务器地址，一般为localhost</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-left">数据库端口：</td>
							<td><input type="text" name="dbport" id="dbport" value="3306" class="input"></td>
							<td>
								<div id="js-install-tip-dbport">
									<span class="gray">数据库服务器端口，一般为3306</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-left">数据库用户名：</td>
							<td><input type="text" name="dbuser" id="dbuser" value="root" class="input"></td>
							<td><div id="js-install-tip-dbuser"></div></td>
						</tr>
						<tr>
							<td class="text-left">数据库密码：</td>
							<td><input type="password" name="dbpw" id="dbpw" value="" class="input" autoComplete="off" onblur="TestDbPwd()"></td>
							<td><div id="js-install-tip-dbpw"></div></td>
						</tr>
						<tr>
							<td class="text-left">数据库名：</td>
							<td><input type="text" name="dbname" id="dbname" value="ThinkCMF" class="input"></td>
							<td><div id="js-install-tip-dbname"></div></td>
						</tr>
						<tr>
							<td class="text-left">数据库表前缀：</td>
							<td><input type="text" name="dbprefix" id="dbprefix" value="cmf_" class="input"></td>
							<td>
								<div id="js-install-tip-dbprefix">
									<span class="gray">建议使用默认，同一数据库安装多个ThinkCMF时需修改</span>
								</div>
							</td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td class="td1" width="100">网站配置</td>
							<td class="td1" width="200">&nbsp;</td>
							<td class="td1">&nbsp;</td>
						</tr>
						<tr>
							<td class="text-left">网站名称：</td>
							<td><input type="text" name="sitename" value="ThinkCMF内容管理框架" class="input"></td>
							<td><div id="js-install-tip-sitename"></div></td>
						</tr>
						<tr>
							<td class="text-left">网站域名：</td>
							<td><input type="text" name="siteurl" value="<?php echo sp_get_host();?>/" class="input" autoComplete="off"></td>
							<td>
								<div id="js-install-tip-siteurl">
									<span class="gray">请以“/”结尾</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="text-left">关键词：</td>
							<td><input type="text" name="sitekeywords" value="ThinkCMF,php,内容管理框架,cmf,cms,简约风, simplewind,framework" class="input" autoComplete="off"></td>
							<td><div id="js-install-tip-sitekeywords"></div></td>
						</tr>
						<tr>
							<td class="text-left">描述：</td>
							<td><input type="text" name="siteinfo" class="input" value="ThinkCMF是简约风网络科技发布的一款用于快速开发的内容管理框架"></td>
							<td><div id="js-install-tip-siteinfo"></div></td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td class="td1" width="100">创始人信息</td>
							<td class="td1" width="200">&nbsp;</td>
							<td class="td1">&nbsp;</td>
						</tr>
						<tr>
							<td class="text-left">管理员帐号：</td>
							<td><input type="text" name="manager" value="admin" class="input"></td>
							<td><div id="js-install-tip-manager"></div></td>
						</tr>
						<tr>
							<td class="text-left">密码：</td>
							<td><input type="password" name="manager_pwd" id="js-manager-pwd" class="input" autoComplete="off"></td>
							<td><div id="js-install-tip-manager_pwd"></div></td>
						</tr>
						<tr>
							<td class="text-left">重复密码：</td>
							<td><input type="password" name="manager_ckpwd" class="input" autoComplete="off"></td>
							<td><div id="js-install-tip-manager_ckpwd"></div></td>
						</tr>
						<tr>
							<td class="text-left">Email：</td>
							<td><input type="text" name="manager_email" class="input" value=""></td>
							<td><div id="js-install-tip-manager_email"></div></td>
						</tr>
					</table>
					<div id="js-response-tips" style="display: none;"></div>
				</div>
				<div class="bottom text-center">
					<a href="/111/index.php?g=install&a=step2" class="btn btn-primary">上一步</a>
					<button type="submit" class="btn btn-primary">创建数据</button>
				</div>
			</form>
		</section>
		<script src="/111/public/js/jquery.js"></script>
		<script src="/111/public/js/validate.js"></script>
		<script src="/111/public/js/ajaxForm.js"></script>
		<script>
			function TestDbPwd() {
				var dbHost = $('#dbhost').val();
				var dbUser = $('#dbuser').val();
				var dbPwd = $('#dbpw').val();
				var dbName = $('#dbname').val();
				var dbPort = $('#dbport').val();
				data = {
					'DB_HOST' : dbHost,
					'DB_USER' : dbUser,
					'DB_PWD' : dbPwd,
					'DB_PORT' : dbPort
				};
				var url = "/111/index.php?g=install&a=testdbpwd";
				$.ajax({
					type : "POST",
					url : url,
					data : data,
					beforeSend : function() {
					},
					success : function(msg) {
						if (msg) {

						} else {
							$('#dbpw').val("");
							$('#js-install-tip-dbpw').html('<span for="dbname" generated="true" class="tips-error" style="">数据库链接配置失败</span>');
						}
					},
					complete : function() {
					},
					error : function() {
						$('#js-install-tip-dbpw').html('<span for="dbname" generated="true" class="tips-error" style="">数据库链接配置失败</span>');
						$('#dbpw').val("");
					}
				});
			}
			$(function() {
				//聚焦时默认提示
				var focus_tips = {
					dbhost : '数据库服务器地址，一般为localhost',
					dbport : '数据库服务器端口，一般为3306',
					dbuser : '',
					dbpw : '',
					dbname : '',
					dbprefix : '建议使用默认，同一数据库安装多个ThinkCMF时需修改',
					manager : '创始人帐号，拥有站点后台所有管理权限',
					manager_pwd : '',
					manager_ckpwd : '',
					sitename : '',
					siteurl : '请以“/”结尾',
					sitekeywords : '',
					siteinfo : '',
					manager_email : ''
				};

				var install_form = $("#js-install-form");

				//validate插件修改了remote ajax验证返回的response处理方式；增加密码强度提示 passwordRank
				install_form.validate({
					//debug : true,
					//onsubmit : false,
					errorPlacement : function(error, element) {
						//错误提示容器
						$('#js-install-tip-' + element[0].name).html(error);
					},
					errorElement : 'span',
					//invalidHandler : , 未验证通过 回调
					//ignore : '.ignore' 忽略验证
					//onkeyup : true,
					errorClass : 'tips-error',
					validClass : 'tips-error',
					onkeyup : false,
					focusInvalid : false,
					rules : {
						dbhost : {required : true},
						dbport : {required : true},
						dbuser : {required : true},
						/* dbpw: {required	: true}, */
						dbname : {required : true},
						dbprefix : {required : true},
						manager : {required : true},
						manager_pwd : {required : true},
						manager_ckpwd : {required : true,equalTo : '#js-manager-pwd'},
						manager_email : {required : true,email : true}
					},
					highlight : false,
					unhighlight : function(element, errorClass,validClass) {
						var tip_elem = $('#js-install-tip-'+ element.name);
						tip_elem.html('<span class="'+ validClass +'" data-text="text"><span>');
					},
					onfocusin : function(element) {
						var name = element.name;
						$('#js-install-tip-' + name).html('<span data-text="text">'+ focus_tips[name] + '</span>');
						$(element).parents('tr').addClass('current');
					},
					onfocusout : function(element) {
						var _this = this;
						$(element).parents('tr').removeClass('current');

						if (element.name === 'email') {
							//邮箱匹配点击后，延时处理
							setTimeout(function() {
								_this.element(element);
							}, 150);
						} else {
							_this.element(element);
						}

					},
					messages : {
						dbhost : {required : '数据库服务器地址不能为空'},
						dbport : {required : '数据库服务器端口不能为空'},
						dbuser : {required : '数据库用户名不能为空'},
						dbpw : {required : '数据库密码不能为空'},
						dbname : {required : '数据库名不能为空'},
						dbprefix : {required : '数据库表前缀不能为空'},
						manager : {required : '管理员帐号不能为空'},
						manager_pwd : {required : '密码不能为空'},
						manager_ckpwd : {required : '重复密码不能为空',equalTo : '两次输入的密码不一致,请重新输入.'},
						manager_email : {required : 'Email不能为空',email : '请输入正确的电子邮箱地址'}
					},
					submitHandler : function(form) {
						form.submit();
						return true;
					}
				});
			});
		</script>
	</div>
	<div class="footer">
	&copy; 2013-<?php echo date('Y');?> <a href="http://www.thinkcmf.com" target="_blank">ThinkCMF</a>简约风网络科技出品
</div>
</body>
</html>