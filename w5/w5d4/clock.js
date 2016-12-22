class Clock {
  constructor() {
    let currentTime = new Date();
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds ++;
    if (this.seconds > 59){
      this.seconds = 0;
      this.minutes ++;
      if (this.minutes > 59){
        this.minutes = 0;
        this.hours ++;
        if (this.hours > 23){
          this.hours = 0;
        }
      }
    }

    this.printTime();
  }
}

const clock = new Clock();
