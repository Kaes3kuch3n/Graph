int[] pointX = new int[17]; //Array for x-coordinates
int[] pointY = new int[17]; //Array for y-coordinates
boolean connectPoints = false; //If points should be connected

void setup() {
  
  size(1200, 600); //window size
  
}

void draw(){
  
  background(0, 0, 0); //Background-color
  
  stroke(255, 0, 0); //line- and point-color
  strokeWeight(1); //line-weight
  line(width / 2, 0, width / 2, height); //x-axis
  line(0, height / 2, width, height / 2); //y-axis
  stroke(0, 255, 0); //line- and point-color
  
  //Draw points
  int c = 0;
  for(int i = -8; i <= 8; i++) {
    point(calcX(i), calcY(0.2 * (i * i * i) - 2 * i - 1.5));
    pointX[c] = calcX(i);
    pointY[c] = calcY(0.2 * (i * i * i) - 2 * i - 1.5);
    c++;
  }
  
  //Draw connections
  if(connectPoints) {
    for(int i = 0; i < 16; i++) {
      line(pointX[i], pointY[i], pointX[i+1], pointY[i+1]);
    }
  }
  
}

//Switch draw mode
void keyPressed() {
  if(key == TAB) {
    connectPoints = !connectPoints;
  }
}

//Calculate x-coordinates of point
int calcX(float coordX) {
  float posX = ((width / 2) / 8) * coordX + width / 2;
  return Math.round(posX);
}

//Calculate y-coordinates of point
int calcY(float coordY) {
  float posY = -((height / 2) / 5) * coordY + height / 2;
  return Math.round(posY);
}
