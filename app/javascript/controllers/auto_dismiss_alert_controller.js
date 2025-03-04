import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-dismiss-alert"
export default class extends Controller {
  connect() {
    setTimeout(()=> {
      this.element.remove();
    }, 2000)
  }
}
