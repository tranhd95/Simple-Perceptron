class Point {
  
  float[] position;
  int answer;
  color fillColor;
  
  Point(float x, float y, int answer) {
    position = new float[3];
    position[0] = 1; // bias - always 1
    position[1] = x;
    position[2] = y;
    this.answer = answer;
  }
  
  void draw() {
    pushStyle();
      fill(fillColor);
      if (answer == 0) {
        ellipse(position[1], position[2], 10, 10);  
      } else {
        rect(position[1], position[2], 10, 10); 
      }
    popStyle();
  }
 
}
