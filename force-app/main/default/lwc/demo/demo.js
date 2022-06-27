import { LightningElement } from 'lwc';
export default class Demo extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}