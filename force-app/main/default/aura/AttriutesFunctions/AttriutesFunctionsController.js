({
	chooseColor : function(component, event, helper) 
    {
        var colour = component.get("v.selectedColor");
        //alert(colour);
		component.set("v.DisplayColor",colour);
		alert(component.getName())        
	},
    
    chooseSecondColor : function(component, event, helper) 
    {
        var testcmp = component.find("SecondColor");
        //alert(testcmp.get("v.value"));
        component.set("v.SecColor",testcmp.get("v.value"));
        //testcmp.set("v.value","Good choice");
    }
})