({
    doInit : function(component, event, helper) {
        var action =component.get("c.returnAcc");
        action.setCallback(this, function(a){             
            component.set("v.accountlist", a.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})