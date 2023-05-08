import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbomodal"
export default class extends Controller {
  static targets = ['modal'];

  connect() {
    this.modalTarget.classList.add('modal-window');
  }

  submitEnd(e) {
    if(e.detail.fetchResponse.redirected) {
      location.reload();
    }
  }

  closeWithKeyBoard(e) {
    if (e.code == "Escape") {
      this.hideModal();
    }
  }

  closeWithBackgroundClick(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return
    }

    this.hideModal();
  }

  hideModal() {
    this.element.parentElement.removeAttribute('src');
    this.element.remove();
  }
}
