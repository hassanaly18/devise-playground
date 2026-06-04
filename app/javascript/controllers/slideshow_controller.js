import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide" ]
  
  // 1. Declare values with automatic type casting (and optional defaults)
  static values = { index: { type: Number, default: 0 } }

  // 2. Action: Move forward
  next() {
    // If we're at the last slide, wrap around to the first slide
    if (this.indexValue >= this.slideTargets.length - 1) {
      this.indexValue = 0
    } else {
      this.indexValue++
    }
  }

  // 3. Action: Move backward
  previous() {
    // If we're at the first slide, wrap around to the last slide
    if (this.indexValue <= 0) {
      this.indexValue = this.slideTargets.length - 1
    } else {
      this.indexValue--
    }
  }

  // 4. The Magic Call-Back: Runs automatically when indexValue updates!
  indexValueChanged() {
    this.showCurrentSlide()
  }

  // 5. Internal logic to toggle visibility
  showCurrentSlide() {
    this.slideTargets.forEach((element, i) => {
      element.hidden = i !== this.indexValue
    })
  }
}