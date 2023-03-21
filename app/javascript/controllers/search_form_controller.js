// Connects to data-controller="search-form"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  submit() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 200)
  }
}
