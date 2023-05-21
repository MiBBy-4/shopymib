import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="region"
export default class extends Controller {
  static targets = ["citySelect"]
  static values = {
    url: String,
    param: String
  }

  connect() {
    let element = document.getElementById('advertisement_region_id')
    let value = element.selectedOptions[0].value

    if (value !== "") {
      let params = new URLSearchParams()
      params.append(this.paramValue, value)
      params.append("target", this.citySelectTarget.id)

      get(`${this.urlValue}?${params}`, {
        responseKind: "turbo-stream"
      })
    }
  }

  change(event) {
    let params = new URLSearchParams()
    params.append(this.paramValue, event.target.selectedOptions[0].value)
    params.append("target", this.citySelectTarget.id)

    get(`${this.urlValue}?${params}`, {
      responseKind: "turbo-stream"
    })
  }
}
