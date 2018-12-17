/* @pjs preload="data/bg1.jpg,data/star1.png"; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM:
 * DATE:
 */
 
public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private Ball ball;

public Brick[] redBricks = new Brick[10];
public Brick[] orangesBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];
// TODO: put the rest of the rows here

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public int paddleX;
public int paddleY;
public int level = 3;
public int lives = 3;
public int points = 0;
private SoundFile  beep;
private SoundFile kill;
private PImage bg;
private SoundFile brick;

private PImage extraLife;
private float  elX;
private float elY;
private boolean isExtraLifeActive=false;
private float  elSpeedY = 1.0;
int numBalls = 12;
private  Ball[] balls = new Ball[2];

private boolean playerDidWin = false;


public void setupLevel()
{
  elX = random(0, width - 30);
  elY = -30;
  elSpeedY = 1.0;
  
  for (int i = 0; i< numBalls; i++){
    //balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
    
  }

  if (level ==1)
  {

    // TODO: create the red bricks
    for (int i =0; i < redBricks.length; i++)
    {
      Brick b = new Brick(48 * i, 5+75, color(255, 0, 0));
      redBricks[i] = b;
    }

    // TODO: create the oranges bricks
    for (int i =0; i < orangesBricks.length; i++)
    {
      Brick b = new Brick(48 * i, 105, color(255, 115, 11));
      orangesBricks[i] = b;
    }

    // TODO: create the yellow bricks
    for (int i =0; i < yellowBricks.length; i++)
    {
      Brick b = new Brick(48 * i, 55+75, color(252, 252, 11));
      yellowBricks[i] = b;
    }

    // TODO: create the green bricks
    for (int i =0; i < greenBricks.length; i++)
    {
      Brick b = new Brick(48 * i, 80+75, color(12, 245, 74));
      greenBricks[i] = b;
    }
    // TODO: create the blue bricks
    for (int i =0; i < blueBricks.length; i++)
    {
      Brick b = new Brick(48 * i, 105+75, color(12, 82, 245));
      blueBricks[i] = b;
    }
  } else if (level==2)
  {
    redBricks[0] = new Brick(48, 72, color(255, 115, 11));
    redBricks[1] = new Brick(144, 72, color(12, 245, 7));
    redBricks[2] = new Brick(240, 72, color(255, 115, 11));
    redBricks[3] = new Brick(336, 72, color(12, 245, 7));
    redBricks[4] = new Brick(432, 72, color(255, 115, 11));
    redBricks[5] = new Brick(0, 96, color(12, 245, 7));
    redBricks[6] = new Brick(96, 96, color(255, 115, 11));
    redBricks[7] = new Brick(192, 96, color(12, 245, 7));
    redBricks[8] = new Brick(288, 96, color(255, 115, 11));
    redBricks[9] = new Brick(384, 96, color(12, 245, 7));
    orangesBricks[1] = new Brick(48, 120, color(255, 115, 11));
    orangesBricks[2] = new Brick(144, 120, color(12, 245, 7));
    orangesBricks[3] = new Brick(240, 120, color(255, 115, 11));
    orangesBricks[4] = new Brick(336, 120, color(12, 245, 7));
    orangesBricks[5] = new Brick(432, 120, color(255, 115, 11));
    orangesBricks[6] = new Brick(0, 144, color(12, 245, 7));
    orangesBricks[7] = new Brick(96, 144, color(255, 115, 11));
    orangesBricks[8] = new Brick(192, 144, color(12, 245, 7));
    orangesBricks[9] = new Brick(288, 144, color(255, 115, 11));
    yellowBricks[1] = new Brick(384, 144, color(12, 245, 7));
    yellowBricks[2] = new Brick(48, 168, color(255, 115, 11));
    yellowBricks[3] = new Brick(144, 168, color(12, 245, 7));
    yellowBricks[4] = new Brick(240, 168, color(255, 115, 11));
    yellowBricks[5] = new Brick(336, 168, color(12, 245, 7));
    yellowBricks[6] = new Brick(432, 168, color(255, 115, 11));
    yellowBricks[7] = new Brick(0, 192, color(12, 245, 7));
    yellowBricks[8] = new Brick(96, 192, color(255, 115, 11));
    yellowBricks[9] = new Brick(192, 192, color(12, 245, 7));
    greenBricks[1] = new Brick(288, 192, color(255, 115, 11));
    greenBricks[2] = new Brick(384, 192, color(12, 245, 7));
    greenBricks[3] = new Brick(48, 216, color(255, 115, 11));
    greenBricks[4] = new Brick(144, 216, color(12, 245, 7));
    greenBricks[5] = new Brick(240, 216, color(255, 115, 11));
    greenBricks[6] = new Brick(336, 216, color(12, 245, 7));
    greenBricks[7] = new Brick(432, 216, color(255, 115, 11));
    yellowBricks[8] = new Brick(0, 240, color(12, 245, 7));
    yellowBricks[9] = new Brick(96, 240, color(255, 115, 11));
    blueBricks[1] = new Brick(192, 240, color(12, 245, 7));
    blueBricks[2] = new Brick(288, 240, color(255, 115, 11));
    blueBricks[3] = new Brick(384, 240, color(12, 245, 7));
  } else if (level==3)
  {
    redBricks[0] = new Brick(96, 96, color(255, 0, 0));
    redBricks[1] = new Brick(144, 120, color(12, 245, 74));
    redBricks[2] = new Brick(192, 144, color(255, 0, 0));
    redBricks[3] = new Brick(240, 144, color(12, 245, 74));
    redBricks[4] = new Brick(288, 144, color(255, 0, 0));
    redBricks[5] = new Brick(336, 120, color(12, 245, 74));
    redBricks[6] = new Brick(384, 96, color(255, 0, 0));
    redBricks[7] = new Brick(240, 168, color(12, 245, 74));
    redBricks[8] = new Brick(192, 192, color(255, 0, 0));
    redBricks[8] = new Brick(288, 192, color(12, 245, 74));
    redBricks[9] = new Brick(144, 216, color(255, 0, 0));
    orangesBricks[1] = new Brick(336, 216, color(12, 245, 74));
    orangesBricks[2] = new Brick(192, 192, color(255, 0, 0));
    orangesBricks[3] = new Brick(192, 192, color(12, 245, 74));
    orangesBricks[4] = new Brick(96, 240, color(255, 0, 0));
    orangesBricks[5] = new Brick(384, 240, color(12, 245, 74));
    orangesBricks[6] = new Brick(96, 264, color(255, 0, 0));
    orangesBricks[7] = new Brick(384, 264, color(12, 245, 74));
    orangesBricks[8] = new Brick(96, 288, color(255, 0, 0));
    orangesBricks[9] = new Brick(384, 288, color(12, 245, 74));
    yellowBricks[1] = new Brick(96, 312, color(255, 0, 0));
    yellowBricks[2] = new Brick(384, 312, color(12, 245, 74));
    yellowBricks[3] = new Brick(144, 288, color(255, 0, 0));
    yellowBricks[4] = new Brick(192, 288, color(12, 245, 74));
    yellowBricks[5] = new Brick(240, 288, color(255, 0, 0));
    yellowBricks[6] = new Brick(288, 288, color(12, 245, 74));
    yellowBricks[7] = new Brick(336, 288, color(255, 0, 0));
  } else if (level==4)
  {
    redBricks[1] = new Brick(192, 72, color(252, 252, 11));
    redBricks[2] = new Brick(240, 72, color(12, 245, 74));
    redBricks[3] = new Brick(48, 96, color(252, 252, 11));
    redBricks[4] = new Brick(384, 96, color(12, 245, 74));
    redBricks[5] = new Brick(48, 192, color(252, 252, 11));
    redBricks[6] = new Brick(384, 192, color(12, 245, 74));
    redBricks[7] = new Brick(48, 216, color(252, 252, 11));
    redBricks[8] = new Brick(384, 216, color(12, 245, 74));
    redBricks[9] = new Brick(48, 336, color(252, 252, 11));
    orangesBricks[1] = new Brick(384, 336, color(12, 245, 74));
    orangesBricks[2] = new Brick(192, 384, color(252, 252, 11));
    orangesBricks[3] = new Brick(240, 384, color(12, 245, 74));
    orangesBricks[4] = new Brick(144, 144, color(252, 252, 11));
    orangesBricks[5] = new Brick(192, 144, color(12, 245, 74));
    orangesBricks[6] = new Brick(240, 144, color(252, 252, 11));
    orangesBricks[7] = new Brick(288, 144, color(12, 245, 74));
    orangesBricks[8] = new Brick(144, 168, color(252, 252, 11));
    orangesBricks[9] = new Brick(288, 168, color(12, 245, 74));
    yellowBricks[1] = new Brick(144, 192, color(252, 252, 11));
    yellowBricks[2] = new Brick(288, 192, color(12, 245, 74));
    yellowBricks[3] = new Brick(144, 216, color(252, 252, 11));
    yellowBricks[4] = new Brick(288, 216, color(12, 245, 74));
    yellowBricks[5] = new Brick(144, 240, color(252, 252, 11));
    yellowBricks[6] = new Brick(288, 240, color(12, 245, 74));
    yellowBricks[7] = new Brick(192, 264, color(252, 252, 11));
    yellowBricks[8] = new Brick(240, 264, color(12, 245, 74));
    yellowBricks[9] = new Brick(144, 264, color(252, 252, 11));
    greenBricks[1] = new Brick(288, 264, color(12, 245, 74));
  } else if (level==5)
  {
    redBricks[1] = new Brick(48, 96, color(255, 115, 11));
    redBricks[2] = new Brick(48, 120, color(12, 82, 245));
    redBricks[4] = new Brick(144, 96, color(255, 115, 11));
    redBricks[5] = new Brick(144, 120, color(12, 82, 245));
    redBricks[6] = new Brick(240, 96, color(255, 115, 11));
    redBricks[7] = new Brick(240, 120, color(12, 82, 245));
    redBricks[8] = new Brick(336, 96, color(255, 115, 11));
    redBricks[9] = new Brick(336, 120, color(12, 82, 245));
    yellowBricks[1] = new Brick(48, 216, color(255, 115, 11));
    yellowBricks[2] = new Brick(48, 240, color(12, 82, 245));
    yellowBricks[3] = new Brick(144, 216, color(255, 115, 11));
    yellowBricks[4] = new Brick(144, 240, color(12, 82, 245));
    yellowBricks[5] = new Brick(240, 216, color(255, 115, 11));
    yellowBricks[6] = new Brick(240, 240, color(12, 82, 245));
    yellowBricks[7] = new Brick(336, 216, color(255, 115, 11));
    yellowBricks[8] = new Brick(336, 240, color(12, 82, 245));
    yellowBricks[9] = new Brick(48, 288, color(255, 115, 11));
    greenBricks[1] = new Brick(48, 312, color(12, 82, 245));
    greenBricks[2] = new Brick(144, 288, color(255, 115, 11));
    greenBricks[3] = new Brick(144, 312, color(12, 82, 245));
    greenBricks[4] = new Brick(240, 288, color(255, 115, 11));
    greenBricks[5] = new Brick(240, 312, color(12, 82, 245));
    greenBricks[6] = new Brick(336, 288, color(255, 115, 11));
    greenBricks[7] = new Brick(336, 312, color(12, 82, 245));
  } 
}


public void setup()
{
  size(480, 480);
  //pixelDensity(2);

  kill = new SoundFile(this, "kill.mp3");
  beep = new SoundFile(this, "beep.mp3");
  brick = new SoundFile(this, "brick.wav");

  bg = loadImage("data/bg1.jpg");
  bg.resize(480, 480);

  extraLife = loadImage("data/star1.png");
  extraLife.resize(30, 30);

  elX = random(0, width - 30);
  kill.play();

  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  setupLevel();
}

public void draw()
{



  if (!isGameOver)
  {
    background(bg);

    image(extraLife, elX, elY);
    elY += elSpeedY;

    if (elY>height)
    {
      elY=0;
      elX=random(0, width-30);
    }

    if (areAllBricksBroken())
    {
      level++;
      if (level<6)
      {
        setupLevel();
        hasGameStarted = false;

        ball.setX(width / 2);
        ball.setY(height - PADDLE_HEIGHT - BALL_RADIUS);
        ball.setSpeedX(0);
        ball.setSpeedY(0);
      }else
      {
        gameOver(true);
      }
      
    }


    // Draw the ball.
    ball.drawBall();

    // Draw the paddle.
    fill(170, 0, 0);
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);

    // draw points
    fill(255, 255, 255);
    textSize(30);
    text("Lives: " + lives, 285, 50);
    text("Score: " + points, 10, 50);

    // TODO: check for wall collisions
    if (isOutOfBounds())
    {
      stroke(0);
      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;


      ball.setSpeedX(0);
      ball.setSpeedY(0);

      ball.setX(width / 2);
      ball.setY(height - PADDLE_HEIGHT - BALL_RADIUS);

      lives--;


      hasGameStarted = false;
    }
    if (didHitSide())
    {
      ball.reverseSpeedX();
    }

    if (checkForCollisions())
    {
      points+= random(0, 10);
      brick.play();
      ball.reverseSpeedY();
    }
    if (isBallCollidingWithPaddle())
    {
      ball.reverseSpeedY();
      beep.play();
    }
    if (didHitTop()) {
      ball.reverseSpeedY();
    }

    if (collidingWithExtraLife())
    {
      elX = -100;
      elY = -100;
      elSpeedY = 0;
      lives  +=1;
    }

    // TODO: draw the bricks
    for (int i =0; i< redBricks.length; i++)
    {
      if (redBricks[i] != null)
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i =0; i< orangesBricks.length; i++)
    {
      if (orangesBricks[i] != null)
      {
        Brick myBrick = orangesBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i =0; i< yellowBricks.length; i++)
    {
      if (yellowBricks[i] != null)
      {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i =0; i< greenBricks.length; i++)
    {
      if (greenBricks[i] != null)
      {
        Brick myBrick = greenBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i = 0; i< blueBricks.length; i++)
    {
      if (blueBricks[i] != null)
      {
        Brick myBrick = blueBricks[i];
        myBrick.drawBrick();
      }
    }
  } else
  {
    if (playerDidWin)
    {
      fill(115, 255, 0);
      textSize(32);
      textAlign(CENTER);
      text("You Win!", width / 2, height / 2);
    } else
    {
      fill(255, 255, 255);
      textSize(32);
      textAlign(CENTER);
      text("You Win!", width/2, height / 2);
    }
  }
  if (lives == 0)
  {
    gameOver(false);
  }
}

public void mouseMoved(MouseEvent event)
{
  int x = mouseX;
  paddleX = x - PADDLE_WIDTH / 2;

  if (!hasGameStarted)
  {
    ball.setX(x);
  }
}

public void mouseReleased(MouseEvent event)
{
  if (!hasGameStarted)
  {
    ball.setSpeedX(5);
    ball.setSpeedY(-3);
    hasGameStarted = true;
  }
  if (isGameOver)
  {
    restartGame();
  }
}

/**
 * Return true if the ball has hit the left or right sides.
 */
public boolean didHitSide()
{
  // TODO
  if (ball.getX() < 0 || ball.getX() > width)
  {
    return true;
  }
  return false;
}

/**
 * Return true if the ball has hit the top side.
 */
public boolean didHitTop()
{
  // TODO
  if (ball.getY() < 0)
  {
    return true;
  }
  return false;
}

/**
 * Return true with the ball passed through the bottom.
 */
public boolean isOutOfBounds()
{
  // TODO
  if (ball.getY() > height)
  {
    return true;
  }

  return false;
}

/**
 * Return true when the ball is colliding with the paddle.
 */
public boolean isBallCollidingWithPaddle()
{

  return isBallCollidingWithRect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
}

/**
 * Detects whether the ball is colliding with a brick.
 * Use a loop to check every brick for collisions.
 * If a brick has been hit, remove it and return true.
 * If not bricks are being hit, return false.
 */
public boolean checkForCollisions()
{
  for (int i = 0; i < redBricks.length; i++)
  {
    if (redBricks[i] != null)
    {
      Brick myBricks = redBricks[i];
      if (myBricks.isCollidingWithBall())
      {
        redBricks[i]=null;
        return true;
      }
    }
  }

  for (int i = 0; i < orangesBricks.length; i++)
  {
    if (orangesBricks[i] != null)
    {
      Brick myBricks = orangesBricks[i];
      if (myBricks.isCollidingWithBall())
      {
        orangesBricks[i]=null;
        return true;
      }
    }
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      Brick myBricks = yellowBricks[i];
      if (myBricks.isCollidingWithBall())
      {
        yellowBricks[i]=null;
        return true;
      }
    }
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      Brick myBricks = greenBricks[i];
      if (myBricks.isCollidingWithBall())
      {
        greenBricks[i]=null;
        return true;
      }
    }
  }
  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
    {
      Brick myBricks = blueBricks[i];
      if (myBricks.isCollidingWithBall())
      {
        blueBricks[i]=null;
        return true;
      }
    }
  }
  return false;
}


/**
 * Loops over every brick. If an unbroken brick is found, true false.
 * If every brick has been broken, return true.
 */
public boolean areAllBricksBroken()
{
  for (int i = 0; i < redBricks.length; i++)
  {

    if (redBricks[i] !=null)
      return false;
  }




  for (int i = 0; i < orangesBricks.length; i++)
  {
    if (orangesBricks[i] !=null)
      return false;
  }

  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] !=null)
      return false;
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] !=null)
      return false;
  }

  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] !=null)
      return false;
  }

  return true;
}


/**
 * Ends the game. 
 * If param `didWin` is true, congratulate the use, else boo them.
 * Prompt the user to click to restart the game.
 * Ensure that the text is centered on the screen.
 * Remember to set `isGameOver` to true.
 */
public void gameOver(boolean didWin)
{
  // TODO
  isGameOver = didWin;
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  hasGameStarted = false;
  isGameOver = false;
}

public boolean collidingWithExtraLife()
{
  return isBallCollidingWithRect(elX, elY, extraLife.width, extraLife.height);
}
