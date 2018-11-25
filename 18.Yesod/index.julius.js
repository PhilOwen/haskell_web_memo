let ball = null;

function setup() {
  class Ball {
    constructor(x, y) {
      this.x = x;
      this.y = y;
      this.vx = 10;
      this.vy = -20;
      this.color = color(random(255), random(255), random(255));
      frameRate(5);
    }

    update() {
      let url = ['/next', this.x, this.y, this.vx, this.vy].join('/');
      loadJSON(url, json => {
        this.x = json.x;
        this.y = json.y;
        this.vx = json.vx;
        this.vy = json.vy;
        this.draw();
      });
    }

    draw() {
      fill(this.color);
      background(30);
      ellipse(this.x, this.y, 50, 50);
    }
  }

  ball = new Ball(100, 250);
  createCanvas(800, 600);
  noStroke();
}

function draw() {
  ball.update();
}

