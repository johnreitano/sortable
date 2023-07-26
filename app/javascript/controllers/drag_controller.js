import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
      animation: 150,
      handle: '.drag-handle',
      ghostClass: 'bg-amber-100',
      selectedClass: 'bg-amber-100',
      dragClass: 'invisible',
    })
  }

  end(event) {
    let url = this.data.get('url').replace(':id', event.item.dataset.id)
    let formData = new FormData()
    formData.append('highlight_type[position]', event.newIndex)
    fetch(url, {
      body: formData,
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content,
      },
    }).then((response) => {
      if (!response.ok) {
        response
          .json()
          .then((data) =>
            console.log(
              `got unexpected response from api with status ${response.status} and body `,
              data
            )
          )
      }
    })
  }
}
