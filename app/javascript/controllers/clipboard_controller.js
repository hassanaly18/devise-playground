import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // 1. Define the target name
  static targets = [ "source" ]

  static classes = [ "supported" ]

  connect() {
    // Feature test: check if the browser supports the modern clipboard API
    if ("clipboard" in navigator) {
      // Add the "clipboard--supported" class to the controller element (this.element)
      this.element.classList.add(this.supportedClass)
    }
  }

  // 2. The action method triggered by the click
  copy(event) {
    // Stop the link from jumping to the top of the page
    event.preventDefault()

    // Grab the text from the target and write it to the system clipboard
    navigator.clipboard.writeText(this.sourceTarget.value)
    
    console.log("Copied:", this.sourceTarget.value)
  }
}