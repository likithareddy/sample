trigger alleventsoftriggers on Account (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(trigger.isbefore){
        if(trigger.isinsert){
            system.debug('---------------------------U R DOING THE BEFORE INSERT-------------------------');
        }
        else if(trigger.isupdate){
            system.debug('--------------------------U R DOING THE BEFORE UPDATE-------------------------');
        }
        else {
            system.debug('--------------------------U R DOING THE BEFORE DELETE--------------------------');
        }}
        else
        {
            if(trigger.isinsert){
                system.debug('--------------------U R DOING THE AFTER INSERT------------------------------');
            }
            else if(trigger.isupdate){
                system.debug('--------------------U R DOING THE AFTER UPDATE-----------------------------');
            }
            else if(trigger.isdelete){
                system.debug('-------------------U R DOING THE AFTER DELETE-------------------------------');
            }
            else{
                system.debug('-------------------U R DOING THE AFTER UNDELETE---------------------------');
            }
        }
    }