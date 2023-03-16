int score = 0;
boolean gameOver = false;


// Array of the target 
int numTargets = 7;
int[] targetX = new int[numTargets];
int[] targetY = new int[numTargets];
int targetSize = 20;
int targetSpeed = 2;
  

// The Catcher
int catcherX;
int catcherY;
int catcherSize = 70;

void setup() {
  size(900, 650);
  resetGame();
  
}

void draw() {
  background(47,79,79);
  
  // the targets falling 
  for (int i = 0; i < numTargets; i++) {
    targetY[i] += targetSpeed;
    if (targetY[i] > height - targetSize/2) {
      targetY[i] = -targetSize/2;
      targetX[i] = int(random(targetSize/2, width-targetSize/2));
      gameOver = true;
    }
  
    
    // The collision with the catcher
    if (dist(catcherX, catcherY, targetX[i], targetY[i]) < targetSize/2 + catcherSize/2) {
      targetY[i] = -targetSize/2;
      score++;
      targetSpeed += 0.2;
    }
        
    // the targets form, and draw 
    fill(255,215,0);
    ellipse(targetX[i], targetY[i], targetSize, targetSize);
  }
  
  // movement of the catcher 
  catcherX = mouseX;
  catcherY = height - catcherSize/2;
  
  // draw the catcher
  fill(144,238,144);
  rectMode(CENTER);
  rect(catcherX, catcherY, catcherSize, catcherSize);
  
  // display the scoreboard
  fill(0);
  textSize(24);
  text("Score: " + score, 10, 30);
  
  // display game over message if applicable
  if (gameOver) {
    textSize(32);
    text("Game Over", width/2, height/2 - 50);
    textSize(24);
    text("Final Score: " + score, width/2, height/2 + 50);
    text("Click to play again", width/2, height/2 + 100);
  }
}

void mouseClicked() {
  if (gameOver) {
    resetGame();
  }
}

void resetGame() {
  // reset the targets
  for (int i = 0; i < numTargets; i++) {
    targetX[i] = int(random(targetSize/2, width-targetSize/2));
    targetY[i] = -i * targetSize;
  }
  targetSpeed = 2;
  
  // reset the catcher position and score/game over boolean
  catcherX = width/2;
  catcherY = height - catcherSize/2;
  score = 0;
  gameOver = false;
}
