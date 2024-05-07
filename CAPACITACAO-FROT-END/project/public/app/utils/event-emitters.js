const events = new Map();

export const EventEmitter = {
  on(event, listener) {
    if (!events.has(event)) events.set(event, []);
    events.get(event).push(listener);
  },
  emit(event, data) {
    const listeners = events.get(event);
    if (listeners) {
      listeners.forEach((listener) => listener(data));
    }
  },
  off(event, listener) {
    if (events.has(event)) {
      events.get(event).splice(events.get(event).indexOf(listener), 1);
    }
  },
};
