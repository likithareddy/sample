public class fileupload {

    public fileupload(ApexPages.StandardController controller) {
    Document d=(Document) controller.getRecord();
    d.folderid=UserInfo.getUserId();
    

    }

}