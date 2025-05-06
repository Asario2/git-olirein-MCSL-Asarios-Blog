import { reactive } from 'vue';

export const toastBus = reactive({
  events: [],
  on(event, callback) {
    this.events.push({ event, callback });
  },
  off(event, callback) {
    this.events = this.events.filter(e => !(e.event === event && e.callback === callback));
  },
  emit(event, data) {
    this.events.filter(e => e.event === event).forEach(e => e.callback(data));
  },
});
