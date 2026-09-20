<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="项目编号" prop="xiangmubianhao">
							<el-input class="list_inp" v-model="form.xiangmubianhao" :readonly="true" placeholder="项目编号" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="项目名称" prop="xiangmumingcheng">
							<el-input class="list_inp" v-model="form.xiangmumingcheng" placeholder="项目名称"
								 type="text" 								:readonly="!isAdd||disabledForm.xiangmumingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="项目负责人" prop="xiangmufuzeren">
							<el-input class="list_inp" v-model="form.xiangmufuzeren" placeholder="项目负责人"
								 type="text" 								:readonly="!isAdd||disabledForm.xiangmufuzeren?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="项目成员" prop="xiangmuchengyuan">
							<el-input class="list_inp" v-model="form.xiangmuchengyuan" placeholder="项目成员"
								 type="text" 								:readonly="!isAdd||disabledForm.xiangmuchengyuan?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="项目开始时间" prop="xiangmukaishishijian">
							<el-date-picker
								class="list_date"
								v-model="form.xiangmukaishishijian"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.xiangmukaishishijian?true:false"
								placeholder="请选择项目开始时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="项目结束时间" prop="xiangmujieshushijian">
							<el-date-picker
								class="list_date"
								v-model="form.xiangmujieshushijian"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.xiangmujieshushijian?true:false"
								placeholder="请选择项目结束时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="预算" prop="yusuan">
							<el-input class="list_inp" v-model.number="form.yusuan" placeholder="预算"
								 type="number" 								:readonly="!isAdd||disabledForm.yusuan?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="成果形式" prop="chengguoxingshi">
							<el-input class="list_inp" v-model="form.chengguoxingshi" placeholder="成果形式"
								 type="text" 								:readonly="!isAdd||disabledForm.chengguoxingshi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="研究内容" prop="yanjiuneirong">
							<el-input v-model="form.yanjiuneirong" placeholder="研究内容" type="textarea"
							:readonly="!isAdd||disabledForm.yanjiuneirong?true:false"
							/>
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
	const tableName = 'keyanxiangmu'
	const formName = '科研项目'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		xiangmubianhao : false,
		xiangmumingcheng : false,
		xiangmufuzeren : false,
		xiangmuchengyuan : false,
		xiangmukaishishijian : false,
		xiangmujieshushijian : false,
		yanjiuneirong : false,
		yusuan : false,
		chengguoxingshi : false,
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
		xiangmubianhao: [
		],
		xiangmumingcheng: [
		],
		xiangmufuzeren: [
		],
		xiangmuchengyuan: [
		],
		xiangmukaishishijian: [
		],
		xiangmujieshushijian: [
		],
		yanjiuneirong: [
		],
		yusuan: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		chengguoxingshi: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			xiangmubianhao: getUUID(),
			xiangmumingcheng: '',
			xiangmufuzeren: '',
			xiangmuchengyuan: '',
			xiangmukaishishijian: '',
			xiangmujieshushijian: '',
			yanjiuneirong: '',
			yusuan: '',
			chengguoxingshi: '',
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
				if(x=='xiangmubianhao'){
					form.value.xiangmubianhao = row[x];
					disabledForm.value.xiangmubianhao = true;
					continue;
				}
				if(x=='xiangmumingcheng'){
					form.value.xiangmumingcheng = row[x];
					disabledForm.value.xiangmumingcheng = true;
					continue;
				}
				if(x=='xiangmufuzeren'){
					form.value.xiangmufuzeren = row[x];
					disabledForm.value.xiangmufuzeren = true;
					continue;
				}
				if(x=='xiangmuchengyuan'){
					form.value.xiangmuchengyuan = row[x];
					disabledForm.value.xiangmuchengyuan = true;
					continue;
				}
				if(x=='xiangmukaishishijian'){
					form.value.xiangmukaishishijian = row[x];
					disabledForm.value.xiangmukaishishijian = true;
					continue;
				}
				if(x=='xiangmujieshushijian'){
					form.value.xiangmujieshushijian = row[x];
					disabledForm.value.xiangmujieshushijian = true;
					continue;
				}
				if(x=='yanjiuneirong'){
					form.value.yanjiuneirong = row[x];
					disabledForm.value.yanjiuneirong = true;
					continue;
				}
				if(x=='yusuan'){
					form.value.yusuan = row[x];
					disabledForm.value.yusuan = true;
					continue;
				}
				if(x=='chengguoxingshi'){
					form.value.chengguoxingshi = row[x];
					disabledForm.value.chengguoxingshi = true;
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
		})
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
				// 长文本
				.el-textarea__inner {
					border: 1px solid #ddd;
					border-radius: 0;
					padding: 12px;
					color: #333;
					width: auto;
					font-size: 14px;
					min-height: 180px;
					min-width: 800px;
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