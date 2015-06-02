trigger updateownerfield on Case (before update) {
    
    for(Case c:trigger.new){
    if(c.Status=='New'||c.Status=='Working'||c.Status=='Esculated'){
    c.OwnerId=c.CreatedById;
    }
    }

}