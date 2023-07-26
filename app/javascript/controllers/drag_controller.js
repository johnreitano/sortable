import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onStart: this.start.bind(this),
      onEnd: this.end.bind(this),
      animation: 150,
      handle: '.drag-handle',
      ghostClass: 'bg-amber-100',
      selectedClass: 'bg-amber-100',
      dragClass: 'invisible',
    })
  }

  start(event) {
    this._originalOrder = this.sortable.toArray()
  }

  end(event) {
    let url = this.data.get('url').replace(':id', event.item.dataset.id)
    let formData = new FormData()
    formData.append('highlight_type[position]', event.newIndex)
    let container = this
    fetch(url, {
      body: formData,
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content,
      },
    }).then((response) => {
      if (!response.ok) {
        response.json().then((data) => {
          console.log(
            `got unexpected response from api with status ${response.status} and body `,
            data
          )
          container.sortable.sort(container._originalOrder)
        })
      }
    })
  }
}
