({
	handleClick1 : function(component, event, helper) {
		var btnClicked = event.getSource();
        var btnmsg = btnClicked.get("v.label");
        component.set("v.msg",btnmsg);
	},
    handleClick2 : function(component, event, helper) {
        console.log("This handler was called");
		component.set("v.msg",event.getSource().get("v.label"));
	}
})