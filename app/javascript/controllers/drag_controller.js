import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
      animation: 150,
      ghostClass: 'bg-info',
      dragClass: 'invisible',
    })
  }

  end(event) {
    let url = this.data.get('url').replace(':id', event.item.dataset.id)
    let formData = new FormData()
    formData.append('highlight[position]', event.newIndex)
    fetch(url, {
      body: formData,
      method: 'PATCH',
      // dataType: 'script',
      // credentials: 'include',
      headers: {
        'X-CSRF-Token': document.querySelector("[name='csrf-token']").content,
      },
    })
  }
}
