import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["output"];
  static values = { url: String };

  connect() {
    this.request = new Request(this.urlValue)
    this.fetchContent(this.request);
  }

  fetchContent(request) {
    fetch(request)
      .then((response) => {
        if (response.status === 200) {
          response.text().then((text) => (this.renderContent(text)));
        } else {
          this.renderContent("Could not load data");
        }
      })
      .catch((error) => {
        this.renderContent("Could not load data");
      });
      
  }

  renderContent(content) {
    this.outputTarget.innerHTML = content
    this.dispatchEvent("lazy_load:complete")
  }

  dispatchEvent(eventName) {
    const event = new Event(eventName);
    document.dispatchEvent(event);
  }

}
