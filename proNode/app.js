var nodeTypes = {
	program: {children: ["type_decl_list"]},
	type_decl_list: {children: ["type_decl_list", "type_decl"]},
	type_decl: {children: ["type_iden", "var_name_iden"]},
	var_name_iden: {children: ["identifier", "array_decl"]},
	identifier: {children: [], val: [{name: "val", type: "char*"}]},
	array_decl: {children: [], val: [{name: "size", type: "int"}]},
	base_type_lit: {children: [], val: [{name: "iden", type: "char*"}]},
	type_iden: {children: ["base_type_lit", "identifier", "struct_def"], val: [{name: "type", type: "int"}]},
	struct_def: {children: ["identifier", "var_list"]},
	var_list: {children: ["var_list", "var_decl"]},
	var_decl: {children: ["type_iden", "comma_iden_list"]},
	comma_iden_list: {children: ["comma_iden_list", "var_name_iden"]},
}

var typeNames = []
for(var name in nodeTypes){
	typeNames.push(name)
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
	var out = ejs.render(data, {typeNames: typeNames, nodeTypes: nodeTypes});
	fs.writeFile("nodes.h", out, function(err) {
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
	var out = ejs.render(data, {typeNames: typeNames, nodeTypes: nodeTypes});
	//console.log(out);
	fs.writeFile("nodes.c", out, function(err) {
	    if(err) {
	        console.log(err);
	    } else {
	        console.log("The file was saved!");
	    }
	}); 
});
