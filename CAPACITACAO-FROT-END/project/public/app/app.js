import { log, timeouPromise } from "./utils/promise-helpers.js";
import './utils/array-helpers.js';
import { notasService as service } from "./nota/service.js";
import { debounceTime, partialize, takeUntil, pipe } from "./utils/operators.js";



const operations = pipe(
  partialize(takeUntil,3),
  partialize(debounceTime,500) 
);


const action = operations(() =>
timeouPromise (200, service.sumItems('2143'))
  .then(console.log)
  .catch(console.log)
);

document
.querySelector('#myButton')
.onclick = action;

