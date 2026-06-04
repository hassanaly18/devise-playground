import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// Override error handling to capture production bugs
application.handleError = (error, message, detail) => {
  console.warn(`[Stimulus Error] ${message}`, detail)
}

export { application }
