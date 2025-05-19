import { LightningElement } from 'lwc';

export default class Child extends LightningElement {

    name = 'Vivek';
    city = 'Bng';

    pushdetails() {
        const evt = new CustomEvent('sendchilddata', {
            detail: {
                Name: this.name,
                City: this.city,
            }
        });
        this.dispatchEvent(evt);
    }
}