<#assign contextPath=request.contextPath />
<#assign form=JspTaglibs["/WEB-INF/tag/spring-form.tld"]>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>user</title>
    <base id="base" href="${contextPath}">
    <#include "../../common/common.ftl">
    <script type="text/javascript"  charset="UTF-8">
        var searchUrl = "${contextPath}/user/list/data";
        var updateUrl = "${contextPath}/user/update";
        var insertUrl = "${contextPath}/user/insert";
        var deleteUrl = "${contextPath}/user/delete";
        $(function() {
            $('#dataList').datagrid({
                title:'列表',
                iconCls:'icon-edit',//图标
                //width: 700,
                height: 'auto',
                nowrap: false,
                striped: true,
                border: true,
                collapsible:false,//是否可折叠的
                fit: true,//自动大小
                url:'#',
                remoteSort:false,
                singleSelect:true,//是否单选
                pagination:true,//分页控件
                rownumbers:true,//行号
                url:searchUrl,
                toolbar:'#tb',
                columns:[[
                    {field:'id',title:'用户编号',width:100,align:'center'},
                    {field:'userName',title:'用户名称',width:100,align:'center'},
                    {field:'phone',title:'电话',width:100,align:'center'},
                    {field:'age',title:'年龄',width:200,align:'center'},
                    {field:'sex',title:'性别',width:300,align:'center'},
                    {field:'password',title:'密码',width:100,align:'center'},
                    {field:'secPassword',title:'确认密码',width:100,align:'center'}
                ]],

                onBeforeLoad: function (params) {
                    params.pageSize = params.rows
                    params.currentPage = params.page
                    delete params.rows
                    delete params.page
                }

            });

            //设置分页控件
            var p = $('#dataList').datagrid('getPager');
            $(p).pagination({
                pageSize: 10,//每页显示的记录条数，默认为10
                pageList: [10,20,30],//可以设置每页记录条数的列表
                beforePageText: '第',//页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            })
        });
    </script>
</head>

<body class="easyui-layout" >
<@form.form id="_csrf-form" cssStyle="display: none"/>
<div  region="center" >
    <div id='dataList'>
        <div id="tb" style="padding:5px;height:auto">
            <div style="margin-bottom:5px">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="showAddwindow({title:'新增'})">新增</a>|
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="showUpdate({title:'修改'});">修改</a>|
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delRowData({id:'id'});">删除</a>
            </div>
            <div>
                <form  id='searchForm' action="" method="post">
                    用户名称:
                    <input type="text" id="userName" name="userName"/>
                    电话:
                    <input type="text" id="phone" name="phone"/>
                    <input type="button" onclick="loadList(1);" value="查询"/>
                </form>
            </div>
        </div>
    </div>
</div>

<div style="visibility:hidden" >
    <div id="addwindow"  title="添加" style="width:600px;height:350px;padding:10px">
        <form id='addForm' action="" method="post">
            <table>
                <tr>
                    <td>用户名称:</td>
                    <td><input type="text" id="userName" name="userName" style="width:120px"/></td>
                    <td>电话号码:</td>
                    <td><input type="text" id="phone" name="phone" style="width:120px"/></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input type="text" id="sex" name="sex" style="width:120px"/></td>
                    <td>年龄:</td>
                    <td><input type="text" id="age" name="age" style="width:120px"/></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="text" id="password" name="password" style="width:120px"/></td>
                    <td>确认密码:</td>
                    <td><input type="text" id="secPassword" name="secPassword" style="width:120px"/></td>
                </tr>

            </table>
        </form>
    </div>
</div>

</body>
</html>
