import { LightningElement,track } from 'lwc';
import getResultsMap from '@salesforce/apex/fileUploadHandler.getResultsMap';
export default class FileUpload extends LightningElement {
    
    
    @track btnClick;
    @track columns=[];


    handleSave() {
        this.btnClick = 'Button Clicked';
        getResultsMap()
            .then(result => {
                this.columns = result['key1'];   
                console.log(this.columns) ;
            })
            .catch(error => {
                console.error(error);
    });
    }

   
}