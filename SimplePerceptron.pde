int trainingDataCount = 1500;
Point[] trainingData;

Perceptron perceptron;

void setup() {
  size(800, 800);
  background(255);
  generatePoints(trainingDataCount);
  perceptron = new Perceptron(3);
}

void draw() {
  background(255);
  drawPoints();
  //drawLine();
  trainPerceptron(perceptron, trainingData);
  perceptron.drawLine();
}

void generatePoints(int numberOfPoints) {
  trainingData = new Point[numberOfPoints];
  for (int i = 0; i < numberOfPoints; i++) {
    float x = random(0, width);
    float y = random(0, height);
    int answer = lineFunction(x) < y ? 0 : 1;
    trainingData[i] = new Point(x, y, answer);
    trainingData[i].fillColor = color(120);
  }
}

void drawPoints() {
  float correct = 0;
  for (int i = 0; i < trainingData.length; i++) {
    int guess = perceptron.feedforward(trainingData[i].position);
    pushStyle();
    if (guess == trainingData[i].answer) {
      correct += 1;
      
      trainingData[i].fillColor = color(0, 255, 0);
    } else {
      trainingData[i].fillColor = color(120);
    }
    trainingData[i].draw();
    popStyle();
  }
  drawPercentage(correct/trainingData.length);
}

void drawPercentage(float percentage) {
  pushStyle();
  textSize(32);
  fill(255, 0, 0);
  stroke(0);
  text(int(percentage*100) + " %", 50, 50);
  popStyle();
}

float lineFunction(float x) {
  return 0.225*x + 350;
}

void drawLine() {
  line(0, lineFunction(0), width, lineFunction(width));
}

void trainPerceptron(Perceptron p, Point[] trainingData) {
  for (int i = 0; i < trainingData.length; i++) {
    float[] inputVector = trainingData[i].position;
    int answer = trainingData[i].answer;
    p.train(inputVector, answer);
  }
}
