import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="category"
export default class extends Controller {
    static targets = ["subcategorySelect"]
    static values = {
        url: String,
        param: String
    }

    connect() {
        let element = document.getElementById('advertisement_category_id')
        let value = element.selectedOptions[0].value

        if (value !== "") {
            let params = new URLSearchParams()
            params.append(this.paramValue, value)
            params.append("target", this.subcategorySelectTarget.id)

            get(`${this.urlValue}?${params}`, {
                responseKind: "turbo-stream"
            })
        }
    }

    change(event) {
        let params = new URLSearchParams()
        params.append(this.paramValue, event.target.selectedOptions[0].value)
        params.append("target", this.subcategorySelectTarget.id)

        get(`${this.urlValue}?${params}`, {
            responseKind: "turbo-stream"
        })
    }
}