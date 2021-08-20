import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  connect() {
    this.active = false;
    this.formTarget.style.height = "0";
    this.formTarget.style.overflow = "hidden";
    this.formTarget.style.transition = "height 0.2s ease-out";
  }

  expand(event) {
    if (this.active) {
      this.formTarget.style.height = "0";
      this.active = false;
    } else {
      // event.currentTarget.style.display = "none";
      this.formTarget.style.height = this.element.dataset.height;
      this.active = true;
    }
  }
}
