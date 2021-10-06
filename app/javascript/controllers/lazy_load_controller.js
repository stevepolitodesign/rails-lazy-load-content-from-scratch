import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output"];
  static values = { url: String };

  connect() {
    this.fetchContent();
  }

  fetchContent() {
    const request = new Request(this.urlValue);
    const errorMessage = "Could not load data";
    fetch(request)
      .then((response) => {
        if (response.status === 200) {
          response.text().then((text) => (this.outputTarget.innerHTML = text));
        } else {
          this.outputTarget.innerHTML = errorMessage;
        }
      })
      .catch((error) => {
        this.outputTarget.innerHTML = errorMessage;
      });
  }
}
