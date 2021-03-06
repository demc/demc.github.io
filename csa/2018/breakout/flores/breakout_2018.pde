/* @pjs preload="data/space.jpg,data/ship.png"; */

/**
 * FALL 2018 SEMESTER FINAL PROJECT - BREAKOUT
 * TEAM: Jeffrey/Kevin
 * DATE: 12/3/18
 */
private PImage space;

private SoundFile song1;
private SoundFile song2;

public final int BALL_RADIUS = 8;
public final int BALL_DIAMETER = BALL_RADIUS * 2;
public final int PADDLE_WIDTH = 100;
public final int PADDLE_HEIGHT = 10;
public final int BRICK_WIDTH = 44;
public final int BRICK_HEIGHT = 20;

private Ball ball;

public Brick[] redBricks = new Brick[10];
public Brick[] orangeBricks = new Brick[10];
public Brick[] yellowBricks = new Brick[10];
public Brick[] greenBricks = new Brick[10];
public Brick[] blueBricks = new Brick[10];
// TODO: put the rest of the rows here

public boolean hasGameStarted = false;
public boolean isGameOver = false;
public int paddleX;
public int paddleY;
private int lives = 3;
private PImage Obstical;
private float elX;
public int points = 0;

private float elY;
private boolean isOnstical=false;
private float elSpeedX= 1.0;


public void setup()
{
  size(480, 480);
  //pixelDensity(2);

  // Initial ball position
  ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);

  paddleX = width / 2 - PADDLE_WIDTH / 2;
  paddleY = height - PADDLE_HEIGHT;

  space = loadImage("data/space.jpg");
  space.resize(480, 480);
  song1 = new SoundFile(this, "song1.mp3");
  song2 = new SoundFile(this, "play.mp3");
  
  song2.play();
  
  Obstical =  loadImage("data/ship.png");
  Obstical.resize(90, 90);
  elY = random(0, width - 30);






  // TODO: create the red bricks
  for (int i = 0; i < redBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 0, color(255, 0, 0));
    redBricks[i] = b;
  }

  // TODO: create the oranges bricks
  for (int i = 0; i < orangeBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 25, color(255, 145, 0));
    orangeBricks[i] = b;
  }
  // TODO: create the yellow bricks
  for (int i = 0; i < yellowBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 50, color(250, 255, 0));
    yellowBricks[i] = b;
  }
  // TODO: create the green bricks
  for (int i = 0; i < greenBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 75, color(33, 255, 0));
    greenBricks[i] = b;
  }
  // TODO: create the blue bricks
  for (int i = 0; i < blueBricks.length; i++)
  {
    Brick b = new Brick(48 * i, 100, color(0, 95, 255));
    blueBricks[i] = b;
  }
}

public void draw()
{
  if (!isGameOver)
  {
    background(space); 
    image(Obstical, elX, elY);
    elX += elSpeedX;
    
    if(elX > width)
    {
     elX = 0;
     elY = random(0,height/2);
    }

    // Draw the ball.
    ball.drawBall();

    // Draw the paddle.
    fill(165, 42, 42);
    rect(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);

    // TODO: check for wall collisions
    if (didHitSide())
    {
      ball.reverseSpeedX();
    }
    if (didHitTop())
    {
      ball.reverseSpeedY();
    }
    if (isBallCollidingWithPaddle())
    {
      ball.reverseSpeedY();
    }
    if (isOutOfBounds())
    {
      if(collidingwidthObstical())
      {
        lives --;
        
      }
      ball = new Ball(width / 2, height - PADDLE_HEIGHT - BALL_RADIUS);
      paddleX = width / 2 - PADDLE_WIDTH / 2;
      paddleY = height - PADDLE_HEIGHT;
      hasGameStarted = false;
      lives--;

      if (lives == 0)
      {
        gameOver(false);
        song1.play();
      }
      
    }

      textSize(32);
      fill(255);
      text("Score:" + points ,20,450);
      
    // TODO: draw the bricks
    for (int i = 0; i < redBricks.length; i++)
    {
      if (redBricks[i] != null)
      {
        Brick myBrick = redBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i = 0; i < orangeBricks.length; i++)
    {
      if (orangeBricks[i] != null)
      {
        Brick myBrick = orangeBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < yellowBricks.length; i++)
    {
      if (yellowBricks[i] != null)
      {
        Brick myBrick = yellowBricks[i];
        myBrick.drawBrick();
      }
    }
    for (int i = 0; i < greenBricks.length; i++)
    {
      if (greenBricks[i] != null)
      {
        Brick myBrick = greenBricks[i];
        myBrick.drawBrick();
      }
    }

    for (int i = 0; i < blueBricks.length; i++)
    {
      if (blueBricks[i] != null)
      {
        Brick myBrick = blueBricks[i];
        myBrick.drawBrick();
      }
    }

    int side =checkForCollisions();
    if (side == 3)
    {
      ball.reverseSpeedY();
    } else if (side == 1 || side ==2)
    {
      ball.reverseSpeedX();
    }
  } else
  {
    background(0); 
    textAlign(CENTER);
    fill(255);
    text("GAME OVER", width / 2, height / 2);
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
    ball.setSpeedX(random(-5, 6));
    ball.setSpeedY(-random(6, 6));
    hasGameStarted = true;
  }
}

/**
 * Return true if the ball has hit the left or right sides.
 */
public boolean didHitSide()
{
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
  if (ball.getY() > height )
  {
    return true ;
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
public int checkForCollisions()
{

  for (int i = 0; i < redBricks.length; i++)
  {
    if (redBricks[i] != null)
    {
      Brick myBrick = redBricks[i];
      int side = myBrick.isCollidingWithBall();
      if (side != 0)
      {
        redBricks[i]=null;
        return side;
      }
    }
  }
  for (int i = 0; i < orangeBricks.length; i++)
  {
    if (orangeBricks[i] != null)
    {
      Brick myBrick = orangeBricks[i];
      int side = myBrick.isCollidingWithBall();
      if (side != 0 )
      {
        orangeBricks[i]=null;
        return side;
      }
    }
  }
  for (int i = 0; i < yellowBricks.length; i++)
  {
    if (yellowBricks[i] != null)
    {
      Brick myBrick = yellowBricks[i];
      int side = myBrick.isCollidingWithBall();
      if (side !=0)
      {
        yellowBricks[i]=null;
        return side;
      }
    }
  }
  for (int i = 0; i < greenBricks.length; i++)
  {
    if (greenBricks[i] != null)
    {
      Brick myBrick = greenBricks[i];
      int side = myBrick.isCollidingWithBall();
      if (side !=0)
      {
        greenBricks[i]=null;
        return side;
      }
    }
  }
  for (int i = 0; i < blueBricks.length; i++)
  {
    if (blueBricks[i] != null)
    {
      Brick myBrick = blueBricks[i];
      int side =  myBrick.isCollidingWithBall();
      if (side !=0)
      {
        blueBricks[i]=null;
        return side;
      }
    }
  }

  return 0;
}


/**
 * Loops over every brick. If an unbroken brick is found, true false.
 * If every brick has been broken, return true.
 */
public boolean areAllBricksBroken()
{
  return false;
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
  isGameOver = true;
  song2.stop();
}

/**
 * Restarts the game by reseting all of the instance variables.
 */
public void restartGame()
{
  // TODO
}
public boolean collidingwidthObstical(){
  
 return isBallCollidingWithRect(elX, elY,Obstical.width,Obstical.height);
 
}
