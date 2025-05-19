import { LightningElement, api, wire } from "lwc";

import getmetadata from '@salesforce/apex/LoadPerfMetrics.getmetadata';
import lbl from "@salesforce/label/c.samplelabel";

export default class HelloWorld extends LightningElement {

    @api objectApiName;
    @api recordId;
    @api obj;

    label = {
        lbl,
    };

    @wire(getmetadata, { recordId: "$recordId", objectInfo: "$objectApiName" })
    wiredfun({ data, error }) {
        if (data) {
            this.obj = data;

            /* eslint-disable no-console*/
            //console.log(this.title);
            console.log('Res--> ' + data);
        }
        if (error) {
            this.error = error;
            /* eslint-disable no-console*/
            console.log(this.error);
        }
    }




}