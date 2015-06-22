public class upsTrackingNumber{
public string trackingNumber{get;set;}
public string AccessLicenseNumber{get;set;}
public string UserId{get;set;}
public string password{get;set;}
public string response{get;set;}
public boolean show{get;set;}
//public string com{get;set;}


  

    public PageReference upsBuildXmlPackageIdentifier() {
    
    string str = upsTrackRequest();
   
    string com= upsBuildXmlMatch();
    
    response=com;
    //string ups=upsBuildXml();
        system.debug('::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'+com);
        system.debug ('###############################'+str) ;
        return null;
    }

    public string upsTrackRequest(){
        system.debug('I am here');
        
        
        AccessLicenseNumber=this.AccessLicenseNumber;
        UserId=this.UserId;
        password=this.password;
        trackingNumber=this.trackingNumber;
        
        system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+AccessLicenseNumber);
        system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+UserId);
        system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+password);
        system.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'+trackingNumber);
        
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();

        req.setEndpoint('https://onlinetools.ups.com/ups.app/xml/Track');
        req.setMethod('POST');
        req.setHeader('Accept', 'application/xml');
       string strBody = '<?xml version="1.0" ?>'+ '<AccessRequest xml:lang="en-US">'+ '<AccessLicenseNumber>'+this.AccessLicenseNumber+'</AccessLicenseNumber>'+'<UserId>'+this.UserId+'</UserId>'+'<Password>'+this.password+'</Password>'+'</AccessRequest>'+ '<?xml version="1.0" ?>'+ '<TrackRequest>'+ '<Request>'+ '<TransactionReference>'+ '<CustomerContext>'+'guidlikesubstance'+'</CustomerContext>'+ '</TransactionReference>'+ '<RequestAction>'+'Track'+'</RequestAction>'+ '</Request>'+ '<TrackingNumber>'+this.trackingNumber+'</TrackingNumber>'+ '</TrackRequest>';  
            system.debug ('++++++++++++++++++++++++++++++++++++++++++'+strBody);
        req.setBody(strBody);
        //req.setCompressed(true); // otherwise we hit a limit of 32000
        try {
            system.debug('Before call out');
            res = http.send(req);
            system.debug(res.getBody());
           // response=res.getBody();
              
            return res.getBody();
        } catch(System.CalloutException e) {
            System.debug('Callout response: '+e);
            System.debug(res.toString());
        }
        return strBody;
    }
     public string upsBuildXml(){
     
     system.debug('Hai Likitha How R u');
        
        string xml = '<?xml version="1.0" ?>'+
         '<AccessRequest xml:lang="en-US">' +
         '<AccessLicenseNumber>'+this.AccessLicenseNumber+'</AccessLicenseNumber>'+
         ' <UserId>'+this.UserId+'</UserId>'+
          '<Password>'+this.Password+'</Password>'+
           '</AccessRequest>'+ 
           '<?xml version="1.0" ?>'+
            '<TrackRequest>'+
             '<Request>'+ '<TransactionReference>'+
             ' <CustomerContext>'+
             'guidlikesubstance'+'</CustomerContext>'+ '</TransactionReference>'+' <RequestAction>'+'Track'+'</RequestAction>'+ '</Request>'+ '<TrackingNumber>'+this.TrackingNumber+'</TrackingNumber>'+ '</TrackRequest>'; 
        
        //system.debug('---------------------------------xml---------------------------------------'+trackingNumber);
        // system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+xml);
        
       // string xml=this.upsBuildXmlPackageIdentifier(trackingNumber);
        system.debug('***********************************************************'+xml);
     
      return xml;
     
    }
       
        
    public string upsBuildXmlMatch(){ 
    trackingNumber=this.trackingNumber; 
    system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+trackingNumber);          
        string str;
        
        
        Pattern p = Pattern.compile('1Z[0-9][0-9][0-9][0-9][0-9][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
        system.debug('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'+p);
        
        Matcher pm = p.matcher(trackingNumber);
        system.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'+pm);
        
        boolean result = pm.matches();
        
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+result);
        
        
        if( pm.matches() ){
           str= '<TrackingNumber>' + trackingNumber + '</TrackingNumber>';
           system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+str);
            }
        else
        {
           str='<ReferenceNumber>' + '<Value>' + 'The trackingNumber that u have entered is not valid,Please Enter a valid trackingNumber' + '</Value>' + '</ReferenceNumber>';
           
           system.debug('<ReferenceNumber>' + '<Value>' + 'The trackingNumber that u have entered is not valid,Please Enter a valid trackingNumber' + '</Value>' + '</ReferenceNumber>'); 
                    
        } 
        show=true; 
        return str;                
    }
    //
//Generated by AdminBooster
//


}