import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {

    name;
    city;
    showdata = false;

    getchilddata(event) {
        this.name = event.detail.Name;
        this.city = event.detail.City;

        if (this.name != null) {
            this.showdata = true;
        }
    }

}