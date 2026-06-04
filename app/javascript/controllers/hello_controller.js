import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // 1. Tell Stimulus which targets to look for in the HTML
  static targets = [ "name" ]

  // 2. This runs automatically when the controller connects to the HTML
  connect() {
    console.log("Hello Controller is connected to the DOM!")
  }

  // 3. This is the action triggered by the button click
  greet() {
    // Read the value from the input field
    const typedName = this.nameTarget.value
    
    // Print it to the console!
    console.log(`Hello, ${typedName}! Welcome to Stimulus.`)
  }
}