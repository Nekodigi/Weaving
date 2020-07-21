
int tSize = 100;//tile size
int w, h;
boolean[][] fullData;//full waving data
int type = 0;
int fOff = 0;//frame offset
float noiseS = 2;//noise scale
boolean showBack = true;


void setup() {
  //size(500, 500);
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  w = width/tSize+1;
  h = height/tSize+1;
  fullData = new boolean[w][h];
  background(360);
  noStroke();
  for (int i=0; i<w; i++) {
    for (int j=0; j<h; j++) {
      if (type==0)fullData[i][j] = (i+j)%2 == 0;//hiraori
      if (type==1)fullData[i][j] = (i+j)%3 == 0;
    }
  }
}

void keyPressed(){
  if(key == 'b'){
    showBack = !showBack;
  }
}

void mousePressed() {
  background(360);
  type++;
  if (type > 1)type = 0;
  fOff = frameCount;
  for (int i=0; i<w; i++) {
    for (int j=0; j<h; j++) {
      if (type==0)fullData[i][j] = (i+j)%2 == 0;//hiraori
      if (type==1)fullData[i][j] = (i+j)%3 == 0;//ayaori
      //if (type==2)fullData[i][j] = noise(i/noiseS, j/noiseS) > 0.5;
      //if (type==3)fullData[i][j] = random(2) > 1;
    }
  }
}

void draw() {
  for (int i=0; i<w; i++) {
    for (int j=0; j<h; j++) {
      boolean showV = (frameCount-fOff)/5>i+j;
      boolean showH = (frameCount-fOff)/5-w-h>i+j;
      if (fullData[i][j]) {
        fill(200, 50, 100);
        if (showH&showBack)rect(i*tSize, j*tSize+tSize*0.1, tSize, tSize*0.8);
        fill(250, 50, 100);
        if (showV)rect(i*tSize+tSize*0.1, j*tSize, tSize*0.8, tSize);
      } else {
        fill(250, 50, 100);
        if (showV&showBack)rect(i*tSize+tSize*0.1, j*tSize, tSize*0.8, tSize);
        fill(200, 50, 100);
        if (showH)rect(i*tSize, j*tSize+tSize*0.1, tSize, tSize*0.8);
      }
    }
  }
}
