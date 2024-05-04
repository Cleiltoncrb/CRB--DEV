export const handleStatus = res => res.ok 
? res.json() 
: Promise.reject(res.statusText);

export const log = param => {
  console.log(param);
  return param;
};

export const timeouPromise = (milliseconds, promise) => {
  const timeout = new Promise((resolve, reject) => 
    setTimeout(() => 
    reject(`Limite da promisse excedido (Limite: ${milliseconds} ms)`),
    milliseconds)); 
  return Promise.race(
      [timeout, promise]
  );
};

export const delay = milliseconds => data =>
  new Promise((resolve, reject) => 
    setTimeout(() => resolve(data), milliseconds));

export const retry = (retries, milliseconds, fn) =>
  fn().cath(error => {
    console.log(retries);
    return delay(milliseconds)().then(() =>
          retries > 1 
          ? retry(--retries, milliseconds, fn) 
          : Promise.reject(error))
  });