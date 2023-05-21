import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ['list']

  drop() {
    this.listTarget.classList.toggle('hidden')
  }
}
