import Rails from "@rails/ujs"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "output" ]
  static values = { url: String }

  connect() {
    this.fetchContent();
  }

  fetchContent() {
    const outputTarget = this.outputTarget;
    Rails.ajax({
      type: "GET",
      url: this.urlValue,
      success(data) {
        outputTarget.innerHTML = data.body.innerHTML;
      }
    })
  }

}
