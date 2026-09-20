<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="实验名称" prop="shiyanmingcheng">
							<el-input class="list_inp" v-model="form.shiyanmingcheng" placeholder="实验名称"
								 type="text" 								:readonly="!isAdd||disabledForm.shiyanmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实验日期" prop="shiyanriqi">
							<el-date-picker
								class="list_date"
								v-model="form.shiyanriqi"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.shiyanriqi?true:false"
								placeholder="请选择实验日期" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="科研账号" prop="keyanzhanghao">
							<el-input class="list_inp" v-model="form.keyanzhanghao" placeholder="科研账号"
								 type="text" 								:readonly="!isAdd||disabledForm.keyanzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="科研人员姓名" prop="keyanrenyuanxingming">
							<el-input class="list_inp" v-model="form.keyanrenyuanxingming" placeholder="科研人员姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.keyanrenyuanxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="数据类型" prop="shujuleixing">
							<el-input class="list_inp" v-model="form.shujuleixing" placeholder="数据类型"
								 type="text" 								:readonly="!isAdd||disabledForm.shujuleixing?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="数据单位" prop="shujudanwei">
							<el-input class="list_inp" v-model="form.shujudanwei" placeholder="数据单位"
								 type="text" 								:readonly="!isAdd||disabledForm.shujudanwei?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="样品名称" prop="yangpinmingcheng">
							<el-input class="list_inp" v-model="form.yangpinmingcheng" placeholder="样品名称"
								 type="text" 								:readonly="!isAdd||disabledForm.yangpinmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="原始数据" prop="yuanshishuju">
							<el-input class="list_inp" v-model="form.yuanshishuju" placeholder="原始数据"
								 type="text" 								:readonly="!isAdd||disabledForm.yuanshishuju?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="处理数据" prop="chulishuju">
							<el-input class="list_inp" v-model="form.chulishuju" placeholder="处理数据"
								 type="text" 								:readonly="!isAdd||disabledForm.chulishuju?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="误差范围" prop="wuchafanwei">
							<el-input class="list_inp" v-model="form.wuchafanwei" placeholder="误差范围"
								 type="text" 								:readonly="!isAdd||disabledForm.wuchafanwei?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="数据注释" prop="shujuzhushi">
							<el-input class="list_inp" v-model="form.shujuzhushi" placeholder="数据注释"
								 type="text" 								:readonly="!isAdd||disabledForm.shujuzhushi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实验条件" prop="shiyantiaojian">
							<el-input class="list_inp" v-model="form.shiyantiaojian" placeholder="实验条件"
								 type="text" 								:readonly="!isAdd||disabledForm.shiyantiaojian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="结论" prop="jielun">
							<el-input class="list_inp" v-model="form.jielun" placeholder="结论"
								 type="text" 								:readonly="!isAdd||disabledForm.jielun?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="实验状态" prop="shiyanzhuangtai">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.shiyanzhuangtai?true:false"
								v-model="form.shiyanzhuangtai" 
								placeholder="请选择实验状态"
								>
								<el-option v-for="(item,index) in shiyanzhuangtaiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'shiyanshuju'
	const formName = '实验数据'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		shiyanmingcheng : false,
		shiyanriqi : false,
		keyanzhanghao : false,
		keyanrenyuanxingming : false,
		shujuleixing : false,
		shujudanwei : false,
		yangpinmingcheng : false,
		yuanshishuju : false,
		chulishuju : false,
		wuchafanwei : false,
		shujuzhushi : false,
		shiyantiaojian : false,
		jielun : false,
		shiyanzhuangtai : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		shiyanmingcheng: [
		],
		shiyanriqi: [
		],
		keyanzhanghao: [
		],
		keyanrenyuanxingming: [
		],
		shujuleixing: [
		],
		shujudanwei: [
		],
		yangpinmingcheng: [
		],
		yuanshishuju: [
		],
		chulishuju: [
		],
		wuchafanwei: [
		],
		shujuzhushi: [
		],
		shiyantiaojian: [
		],
		jielun: [
		],
		shiyanzhuangtai: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//实验状态列表
	const shiyanzhuangtaiLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			shiyanmingcheng: '',
			shiyanriqi: '',
			keyanzhanghao: '',
			keyanrenyuanxingming: '',
			shujuleixing: '',
			shujudanwei: '',
			yangpinmingcheng: '',
			yuanshishuju: '',
			chulishuju: '',
			wuchafanwei: '',
			shujuzhushi: '',
			shiyantiaojian: '',
			jielun: '',
			shiyanzhuangtai: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='shiyanmingcheng'){
					form.value.shiyanmingcheng = row[x];
					disabledForm.value.shiyanmingcheng = true;
					continue;
				}
				if(x=='shiyanriqi'){
					form.value.shiyanriqi = row[x];
					disabledForm.value.shiyanriqi = true;
					continue;
				}
				if(x=='keyanzhanghao'){
					form.value.keyanzhanghao = row[x];
					disabledForm.value.keyanzhanghao = true;
					continue;
				}
				if(x=='keyanrenyuanxingming'){
					form.value.keyanrenyuanxingming = row[x];
					disabledForm.value.keyanrenyuanxingming = true;
					continue;
				}
				if(x=='shujuleixing'){
					form.value.shujuleixing = row[x];
					disabledForm.value.shujuleixing = true;
					continue;
				}
				if(x=='shujudanwei'){
					form.value.shujudanwei = row[x];
					disabledForm.value.shujudanwei = true;
					continue;
				}
				if(x=='yangpinmingcheng'){
					form.value.yangpinmingcheng = row[x];
					disabledForm.value.yangpinmingcheng = true;
					continue;
				}
				if(x=='yuanshishuju'){
					form.value.yuanshishuju = row[x];
					disabledForm.value.yuanshishuju = true;
					continue;
				}
				if(x=='chulishuju'){
					form.value.chulishuju = row[x];
					disabledForm.value.chulishuju = true;
					continue;
				}
				if(x=='wuchafanwei'){
					form.value.wuchafanwei = row[x];
					disabledForm.value.wuchafanwei = true;
					continue;
				}
				if(x=='shujuzhushi'){
					form.value.shujuzhushi = row[x];
					disabledForm.value.shujuzhushi = true;
					continue;
				}
				if(x=='shiyantiaojian'){
					form.value.shiyantiaojian = row[x];
					disabledForm.value.shiyantiaojian = true;
					continue;
				}
				if(x=='jielun'){
					form.value.jielun = row[x];
					disabledForm.value.jielun = true;
					continue;
				}
				if(x=='shiyanzhuangtai'){
					form.value.shiyanzhuangtai = row[x];
					disabledForm.value.shiyanzhuangtai = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('keyanzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.keyanzhanghao = json.keyanzhanghao
				disabledForm.value.keyanzhanghao = true;
			}
			if(json.hasOwnProperty('keyanrenyuanxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.keyanrenyuanxingming = json.keyanrenyuanxingming
				disabledForm.value.keyanrenyuanxingming = true;
			}
		})
		shiyanzhuangtaiLists.value = "已结束,进行中".split(',')
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
									emit('formModelChange')
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
							emit('formModelChange')
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 0px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #ddd;
					border-radius: 0px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				//日期选择器
				.list_date {
					border: 1px solid #ddd;
					border-radius: 0px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 下拉框
				.list_sel {
					border: 1px solid #ddd;
					border-radius: 0px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
							.el-input__wrapper{
								border: none;
								box-shadow: none;
								background: none;
								border-radius: 0;
								height: 100%;
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: #999;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 1px solid #f69a28;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: linear-gradient(270deg, rgba(246,154,40,1) 0%, rgba(255,186,101,1) 50%, rgba(246,154,40,1) 100%);
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
		}
	}
</style>