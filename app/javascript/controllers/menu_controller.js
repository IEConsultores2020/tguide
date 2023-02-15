import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["dropdown"];static targets = ["dropdown"];
  connect() {
      console.log("menu controller connected")
    }

  toggleDropdown() {
        this.dropdownTarget.classList.toggle("hidden")
    }
  }
