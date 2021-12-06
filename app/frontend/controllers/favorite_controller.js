import { Controller } from "stimulus"
import httpClient from "lib/http/client"

export default class extends Controller {
  static targets = ["btn"]
  static values = {
    liked: Boolean,
    courseId: Number,
  }

  connect() {
    if (this.likedValue) {
      this.btnTarget.classList.add("favorited")
    }
  }

  like() {
    const courseID = this.courseIDValue
    const likeBtn = this.btnTarget

    httpClient.post(`/api/v1/courses/${courseID}/like`).then(({ data }) => {
      if (data.result === "like") {
        likeBtn.classList.add("favorited")
      } else {
        likeBtn.classList.remove("favorited")
      }
    })
  }
}
