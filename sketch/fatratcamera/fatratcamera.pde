import processing.sound.*;

AudioIn input;
Amplitude analyzer;

int timer = 0;
float volume = 0;

PImage [] baseImages = new PImage [35];
PImage [] talkImages = new PImage [35];

void setup() {
  size(1080,1080);
  frameRate(24);
  background(0);
  imageMode(CORNER);
  
  for (int i = 0; i<35; i++) {
    baseImages[i] = loadImage("data/base/base"+(21+i)+".png");
    talkImages[i] = loadImage("data/talk/talk"+(21+i)+".png"); 
  }

  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
}


void draw() {
  volume = analyzer.analyze();

  if (volume > 0.03) {
    image(talkImages[timer],0,0);
  } else {
    image(baseImages[timer],0,0);
  }
  
  timer++;
  if(timer >=35) {
    timer = 0;
  }
}
