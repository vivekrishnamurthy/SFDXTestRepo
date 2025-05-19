import { LightningElement, track } from "lwc";

export default class modalPopup extends LightningElement {
  @track openmodel = false;
  openmodal() {
    this.openmodel = true;
  }
  closeModal() {
    this.openmodel = false;
  }
  saveMethod() {
    //alert("save method invoked");
    try {
      let inputElements = this.template.querySelectorAll("lightning-input");
      inputElements.forEach(element => {
        if (element != null) {
          this.setAttributeValues(element);
        }
      });
    } catch (error) {
    } finally {
      this.closeModal();
    }
  }

  setAttributeValues(element) {
    let eleValue = element.value;
    let eleName = element.name;

    for (let key in this.selectedValues) {
      if (key != null) {
        if (key === eleName + "__c") {
          this.selectedValues[key] = eleValue;
        }
      }
    }
  }
}