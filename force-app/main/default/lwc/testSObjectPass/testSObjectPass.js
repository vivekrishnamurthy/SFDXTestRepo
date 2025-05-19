import { LightningElement, wire, api } from 'lwc';
import getOppDetails from '@salesforce/apex/testSObjectLWC.getOppDetails';

export default class testSObjectPass extends LightningElement {
    @api obj;
    res;

    opp = {
        Name: "New testing Opp"
    };

    @wire(getOppDetails, { op: '$obj' })
    loaddata({ error, data }) {
        if (data) {
            console.log(data);
            this.res = data;
        } else if (error) {
            console.log(error);
        }
    }
    connectedCallback() {
        console.log(this.obj);
        //this.res = this.obj.Name;
    }
}