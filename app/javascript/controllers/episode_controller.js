import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { path: String }
  static targets = ["audio"]

  async connect() {
    if (!this.pathValue) return

    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

    this.lastSavedAt = 0
    this.throttleInterval = 1000

    this.audioTarget.addEventListener("timeupdate", () => {
      const now = Date.now()
      if (now - this.lastSavedAt >= this.throttleInterval) {
        this.savePosition(this.audioTarget.currentTime)
        this.lastSavedAt = now
      }
    })

    await this.loadPosition()
  }

  async loadPosition() {
    const response = await fetch(`${this.pathValue}/load_position`)
    const data = await response.json()
    if (data.position) {
      this.audioTarget.currentTime = data.position
    }
  }

  savePosition(time) {
    fetch(`${this.pathValue}/save_position`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': this.csrfToken,
      },
      body: JSON.stringify({ position: time })
    })
  }
}
