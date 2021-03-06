var nodeTypes = {
	program: {children: ["type_decl_list", "global_var_list", "functions"]},
	type_decl_list: {children: ["type_decl_list", "type_decl"]},
	type_decl: {children: ["type_iden", "var_name_iden"]},
	var_name_iden: {children: ["identifier", "array_decl"]},
	identifier: {children: [], val: [{name: "val", type: "char*"}]},
	array_decl: {children: ["expr"]},
	base_type_lit: {children: [], val: [{name: "iden", type: "char*"}]},
	type_iden: {children: ["type"]},
	struct_def: {children: ["identifier", "var_list"]},
	var_list: {children: ["var_list", "var_decl"]},
	var_decl: {children: ["type_iden", "comma_iden_list"]},
	comma_iden_list: {children: ["comma_iden_list", "var_name_iden"]},
	assign_var_name_iden: {children: ["var_name_iden", "expr"]},
	expr: {children: ["left_expr", "operator", "right_expr"]},
	operator: {children: [], val: [{name: "type", type: "char*"}]},
	int_val: {children: [], val: [{name: "val", type: "int"}]},
	float_val: {children: [], val: [{name: "val", type: "float"}]},
	char_val: {children: [], val: [{name: "val", type: "char"}]},
	comma_iden_assign_list: {children: ["assign_var_name_iden", "comma_iden_assign_list"]},
	assign_var_decl: {children: ["type_iden", "comma_iden_assign_list"]},
	assign_var_list: {children: ["assign_var_list", "assign_var_decl"]},
	global_var_list: {children: ["assign_var_list"]},
	variable: {children: ["variable", "struct_member"]},
	non_rec_variable: {children: ["iden", "array_decl"]},
	array_defin: {children: ["comma_expr_list"]},
	comma_expr_list: {children: ["expr", "comma_expr_list"]},
	assignment: {children: ["variable", "expr"]},
	function_call: {children: ["iden", "expr_list"]},
	param_list: {children: ["param", "param_list"]},
	param: {children: ["type_iden", "iden"]},
	function_body: {children: ["stmt_list"]},
	function_def: {children: ["iden", "param_list", "function_body"]},
	function_def_list: {children: ["function_def", "function_def_list"]},
	stmt: {children: ["child"]},
	select_stmt: {children: ["expr", "if_block", "else_block"]},
	return_stmt: {children: ["expr"]},
	expr_or_epmpty: {children: ["expr"]},
	iter_stmt: {children: ["exp1", "exp2", "exp3", "stmt"]},
	stmt_list: {children: ["stmt", "stmt_list"]}

}

for(var name in nodeTypes){
	nodeTypes[name].name = name
	nodeTypes[name].enumType = name+"_t"
	if(!nodeTypes[name].val){
		nodeTypes[name].val = []
	}
}

// var recTypes = {}
// for(var name in nodeTypes){
// 	recTypes[name] = {children: {}, val: nodeTypes[name].val}
// 	nodeTypes[name].children.forEach(function(val){
// 		recTypes[name].children[val] = nodeTypes[val];
// 	})
// }

var ejs = require('ejs')
var fs = require('fs')
fs.readFile('nodes.jh', 'utf8', function (err,data) {
	if (err) {
		return console.log(err);
	}
	var out = ejs.render(data, {nodeTypes: nodeTypes});
	fs.writeFile("../nodes.h", out, function(err) {
	    if(err) {
	        console.log(err);
	    } else {
	        console.log("The file was saved!");
	    }
	}); 
});

fs.readFile('nodes.jc', 'utf8', function (err,data) {
	if (err) {
		return console.log(err);
	}
	var out = ejs.render(data, {nodeTypes: nodeTypes});
	//console.log(out);
	fs.writeFile("../nodes.c", out, function(err) {
	    if(err) {
	        console.log(err);
	    } else {
	        console.log("The file was saved!");
	    }
	}); 
});


