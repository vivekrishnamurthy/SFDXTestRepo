({
	packItem : function(component, event, helper) {
        
        var btnsrc = event.getSource();
		component.set("v.item","true");
        btnsrc.set("v.disabled",true);
        let chkbox = component.find('checkbox');
        chkbox.set("v.checked",false);
	},
    EnableBtn : function(component, event, helper) {
    	let btn = component.find("btn");
        btn.set("v.disabled",false);
        console.log("this is logged");
    }
})