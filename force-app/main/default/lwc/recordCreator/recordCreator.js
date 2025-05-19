import { LightningElement, track } from 'lwc';

export default class RecordCreator extends LightningElement {
    @track recType = "012KY000000sbllYAA"
    @track objApiName = "Book__c"
    @track layoutType = "Full"
    @track columnCount = "10"
    @track mode = "create"
}