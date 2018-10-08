class Perceptron {

  float[] weights;
  final float LEARNING_CONSTANT = 0.001;

  Perceptron(int numberOfInputs) {
    initializeWeights(numberOfInputs);
  }

  // Randomize weights (-1, 1)
  void initializeWeights(int numberOfInputs) {
    weights = new float[numberOfInputs];
    for (int i = 0; i < numberOfInputs; i++) {
      weights[i] = random(-1, 1);
    }
  }

  int feedforward(float[] inputs) {
    float innerPotential = weightSum(inputs);
    return activate(innerPotential);
  }

  float weightSum(float[] inputs) {
    float weightedSum = weights[0];
    for (int i = 1; i < inputs.length; i++) {
      weightedSum += weights[i] * inputs[i];
    }
    return weightedSum;
  }
  
  int activate(float innerPotential) {
    return (innerPotential >= 0) ? 1 : 0;
  }
  
  void train(float[] inputs, int desired) {
    int guess = feedforward(inputs);
    float error = desired - guess;
    adjustWeights(error, inputs);
  }
  
  void adjustWeights(float error, float[] inputs) {
    for (int i = 0; i < inputs.length; i++) {
      weights[i] += LEARNING_CONSTANT * error * inputs[i];
    }
  }
  
  void drawLine() {
    // w0 + w1x + w2y = 0 
    float x0 = 0;
    float y0 = -weights[0]/weights[2];
    float x1 = width;
    float y1 = (-weights[0] - weights[1]*x1)/weights[2];
    pushStyle();
    stroke(200, 0, 0);
    line(x0, y0, x1, y1);
    popStyle();
  }
}
