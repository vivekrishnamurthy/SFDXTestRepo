import { LightningElement, api, wire, track } from "lwc";

/* eslint-disable no-irregular-whitespace */
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import returnstring from '@salesforce/apex/LoadPerfMetrics.returnstring';
import getmetadata from '@salesforce/apex/LoadPerfMetrics.getmetadata';
import lbl1 from '@salesforce/label/c.samplelabel';
import lbl2 from '@salesforce/label/c.Custom_Name';
import readlabel from './helloWorld_local';

    export default class HelloWorld extends LightningElement {  
        @api name = 'Vivek'  ;
        @track title = 'Developer';
        @track data;
        @track error;
        @track mdata;
        @api obj;
        @api objectApiName;
        @api recordId;
        @api locallabel;
        //@track keyval = [{id:1,value:'Col1'},{id:2,value:'Col2'}];
        
        label = {
            lbl1,lbl2,
        };

        connectedCallback()
        {
            this.locallabel = readlabel.getlabelname;
        }

        list = [
            {
                id:'123',
                name:'abc'
            },
            {
                id:'456',
                name:'xyz'
            }
        ];

        
        
        handleclick()
        {
            /* eslint-disable no-console*/
            /* eslint-disable no-irregular-whitespace */
            console.log('This is hit');            
            this.name = 'akdjfhjdhfkldhaklfhdklfkldj';
            this.title = 'jsdkfhjklsdhfsdfklsdfkl';

            const event = new ShowToastEvent({
                            title: 'Message Title',
                            message: 'Please read this carefully',
                            
                        });
                this.dispatchEvent(event);
        }

        handleclick1()
        {
            returnstring().then(result=>{
                console.log('Returnstring-> '+result);
            })
            .catch(error=>{
                this.error = error;
            });
        }

        @wire(getmetadata,{recordId: "$recordId", objectInfo: "$objectApiName"}) 
        wiredfun({ data,error })
        {
            if(data)
            {
                this.obj = data;
                
                /* eslint-disable no-console*/
               //console.log(this.title);
               console.log('Res--> '+data);
            } 
           if(error)
            {
                this.error = error; 
                /* eslint-disable no-console*/
                 console.log(this.error)   ;
           }
        } 

        
        
       
    }