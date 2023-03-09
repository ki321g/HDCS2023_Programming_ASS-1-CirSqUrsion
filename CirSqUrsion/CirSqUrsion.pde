/* CirSqUrsion (Circle Square Recursion)
 * Note: This Sketch show the use of Circles, Sqaures combined with the use of Recursive Functions
 * Student Name: Kieron Garvey
 * Student#: 96358157
 * Date: 18/02/2023
 * Version: 1.0
 */
//import javax.swing.*;

// Global Variables
int  valueMouseDraggedX, valueMouseDraggedY, frameCountWait, displayMode, changeDraw, gridX, gridY, noSaves;
float gridWidth, gridHeight;

//Strings i will be using
String sketchTitle = "CirSqUrsion"; // Name of my Sketch.
String myName = "   Kieron Garvey     ";
String myStudentNumber = "       96358157  ";

/* Method Name: setup
 * Summary: The setup Method sets up the Sketch
 * Parameters: NONE
 * Returns: NOTHING
 */
void setup() {
  size(1280, 720);
  surface.setLocation(0, 0); // Opens Sketch in the Center of the screen.
  surface.setTitle(sketchTitle); // Sets the Name in the Title Bar

  // Initialize Global Variables
  valueMouseDraggedX = 0;
  valueMouseDraggedY = 0;
  frameCountWait = 1;
  displayMode = 3;
  changeDraw = 0;
  gridX = 16;
  gridY = 9;
  noSaves = 0;
  // size of each grid element
  gridWidth = width/gridX;
  gridHeight = height/gridY;

  // draw frame and drawing
  createBorder();
  startDrawing();
}

/* Method Name: draw
 * Summary: The draw Method is executed 60 times a second
 * Parameters: NONE
 * Returns: NOTHING
 */
void draw() {

  /* changeDraw is set to 1 in mousePressed()
   * when changeDraw = 1 it allows the code
   * from line 71 to 79 to execute on every frame.
   *
   * The code
   *    1) recreates the Border on the drawing.
   *    2) recreates the actual drawing.
   *    3) creates a transparent rectangle overlawing the drawing.
   *    4) draws a movable drawing ontop of the overlaw.
   *    5) the movable drawing moves when the mouse is dragged in mouseDragged it moves in
   *        X direction by trimming the myStudentNumber string and moving it
   *          valueMouseDraggedX + the length of myStudentNumber trimmed if mouseX < pmouseX
   *          valueMouseDraggedX - the length of myStudentNumber trimmed if mouseX > pmouseX
   *        Y direction by trimming the myStudentNumber string and it valueMouseDraggedX + the length of myStudentNumber trimmed
   *          valueMouseDraggedY + the length of myStudentNumber trimmed if mouseY < pmouseY
   *          valueMouseDraggedY - the length of myStudentNumber trimmed if mouseY > pmouseY
   */
  if (changeDraw == 1) {
    createBorder();
    startDrawing();

    setColor(1, 4, 150); // Sets Fill Color
    rect(gridWidth, gridHeight, 1120, 560);

    drawOverlayedMovableImage((width/2)/2+valueMouseDraggedX, (height/2)/2+valueMouseDraggedY, gridWidth*2, gridHeight*2, 1); // Draws movable drawing
  } // end if

  /*  Line 90 to 124 changes type of drawing
   *
   *  If 1, 2, 3, 4 or 5 key is pressed
   *    1) Drawing draws squares.
   *    2) Drawing draws Circles.
   *    3) Drawing draws squares & Circles. (Large Circles Always have 4 small squares behind them on purpose)
   *    4) Drawing draws squares & Circles & changes every 60 frames.
   *    5) Drawing draws squares & Circles in same grid. Looks like it is flashing
   */
  if (keyPressed) {
    if (key == '1') {
      displayMode = 1;
      changeDraw = 0;
      startDrawing();
    } else if (key == '2') {
      displayMode = 2;
      changeDraw = 0;
      startDrawing();
    } else if (key == '3') {
      displayMode = 3;
      changeDraw = 0;
      startDrawing();
    } else if (key == '4') {
      displayMode = 4;
      changeDraw = 0;
    } else if (key == '5') {
      changeDraw = 0;
      displayMode = 5;
    }
  } // end if

  // The below if statement changes the drawing every 60 frames
  if (frameCount == (60*frameCountWait)) {
    if (displayMode == 4) {  // KeyPressed = 4
      startDrawing();
    } // end if
    frameCountWait++;
  }

  if (displayMode == 5) {  // KeyPressed = 5
    if (changeDraw != 2) {
      displayMode5();
    }
  } // end if...else
}

/* Method Name: startDrawing
 * Summary: Custom Method that Starts Drawing the Image
 * Parameters: NONE
 * Returns: NOTHING
 */
void startDrawing() {
  // Draws & fills 80x80 sqaures
  drawGrid(gridWidth, gridHeight, 14, 7, 1); // Fills Canvas (Sketch Frame - Border) with Grid gridWidth*gridHeight (example 80x80)
  // Draws & fills 160x160 Randomly positioned sqaures
  draw2x2();
}

/* Method Name: displayText
 *
 * Summary: Custom Method that displays text on the screen
 * Parameters:
 *      text2Display :- Sets the Text to display.
 *      colorText   :- Sets the color to used.
 *                        0 - 4 from Color Pallete.
 *                        5 is White for Text.
 *      sizeText     :- Sets the size of the Text.
 *      xPosText     :- Sets the X Position.
 *      yPosText     :- Sets the Y Position.
 * Returns: NOTHING
 */
void displayText (String text2Display, int colorText, int sizeText, float xPosText, float yPosText) {
  setColor(1, colorText, 255);
  textSize(sizeText);
  text(text2Display, xPosText, yPosText);
}

///* Method Name: mouseMoved
// *
//  */
//void mouseMoved() {
//  if (displayMode == 5) {
//    if (mouseX < pmouseX) {
//      changeDraw = 0;
//      createBorder();
//      displayMode5();
//    } else  if (mouseX > pmouseX) {
//      changeDraw = 2;
//      createBorder();
//      displayMode5();
//    }
//  }
//}

void mouseWheel() {
  if (displayMode == 5 ) {
    saveCreation(); // saveFrame(sketchTitle + "_####.png");
  }
}

/* Method Name: mouseClicked
 * Summary: The mouseCLicked Method is triggered when a mouse button is clicked
 *       
 * Parameters: NONE
 * Returns: NOTHING
 */
void mouseClicked() {
  if ( mouseButton == LEFT && displayMode == 5 ) {
    changeDraw = 2;
    createBorder();
    displayMode5();
  } else if ( mouseButton == RIGHT && displayMode == 5 ) {
    changeDraw = 0;
    createBorder();
    displayMode5();
  } else  if ( mouseButton == RIGHT ) {
    //Commented out as i was using JOptionPane
    //String str;
    //int i = 1;
    //int notCanceled = 0;

    //while (i != 5 || i == 0) {
    //  str = userInput();
    //  if (str == null) {
    //    JOptionPane.showMessageDialog(null, "You pressed Cancel. \n\nTry Again!");
    //    // str = userInput();
    //    notCanceled = 1;
    //    i = 5;
    //  } else if (str.length() < 5) {
    //    JOptionPane.showMessageDialog(null, "The String you entered was too small you entered " + str.length() + " characters and we only accept 5. \n\nTry Again!");
    //    str = userInput();
    //    i = str.length();
    //  } else if (str.length() > 5) {
    //    JOptionPane.showMessageDialog(null, "The String you entered was too large you entered " + str.length() + " characters and we only accept 5. \n\nTry Again!");
    //    str = userInput();
    //    i = str.length();
    //  }
    //  if ( notCanceled == 0) {
    //    if (str.length() == 5) {
    //      JOptionPane.showMessageDialog(null, "The String you entered is: " + str);
    //      saveFrame(sketchTitle + "_" + str + "_####.png");
    //      i = str.length();
    //    }
    //  }
    //}
    saveCreation(); // saveFrame(sketchTitle + "_####.png");
  } // end if
}

//Commented out as i was using JOptionPane
//String userInput() {
//  String str = JOptionPane.showInputDialog("Your PNG image will be named \n\n\""
//    + sketchTitle + "_*****_#####.png\""
//    +"\n\n Where  ***** is the five characters you enter and ##### is the current frame number"
//    +"\n\n Enter 5 Characters and Press OK:");
//  return str;
//}

/* Method Name: mousePressed
 * Summary: The mousePressed Method in my code triggers an overlay and places a drawing in the center of the GRID
 *          this action only occurs when the LEFT mouse button is pressed.
 * Parameters: NONE
 * Returns: NOTHING
 */
void mousePressed() {
  if (mouseButton == LEFT  && displayMode != 5 ) {
    changeDraw = 1;
  } //else if (mouseButton == LEFT) {
  //   changeDraw = 2;
  // }
}

/* Method Name: mouseReleased
 * Summary: The mouseReleased Method in my code resets the drawing.
 * Parameters: NONE
 * Returns: NOTHING
 */
void mouseReleased() {
  if ( mouseButton == LEFT ) {
    changeDraw = 0;
    valueMouseDraggedX = 0;
    valueMouseDraggedY = 0;
    createBorder();
    startDrawing();
  }
}

/* Method Name: mouseDragged
 * Summary: The mouseDragged Method allows you to move the overlayed drawing create in mousePressed.
 *          Comments in DRAW() Method between Lines 59 and 75 describe how this function moves the overlayed drawing.
 * Parameters: NONE
 * Returns: NOTHING
 */
void mouseDragged() {
  if (mouseX < pmouseX) {
    valueMouseDraggedX = valueMouseDraggedX - myStudentNumber.trim().length();
  } else  if (mouseX > pmouseX) {
    valueMouseDraggedX = valueMouseDraggedX +  myStudentNumber.trim().length();
  } else if (mouseY < pmouseY) {
    valueMouseDraggedY = valueMouseDraggedY -  myStudentNumber.trim().length();
  } else  if (mouseY > pmouseY) {
    valueMouseDraggedY = valueMouseDraggedY +  myStudentNumber.trim().length();
  }
}

/* Method Name: setColor
 * Summary: Custom Method that sets the color it is
 *          used to set the color for Stroke & Fill
 * Parameters:
 *      setMethod  :- Sets if Stroke (0) or Fill (1).
 *      setColor  :- Sets the color to used.
 *                        0 - 4 from Color Pallete.
 *                        5 is White for Text.
 *     setAlpha    :- Sets the Alpha value for Fill & Stroke
 *Color Pallete :  https://color.adobe.com/Digital-photo-manipulation-of-a-white-parrot-color-theme-21316486/
 * Returns: NOTHING
 */
void setColor (int setMethod, int setColor, int setAlpha) {
  int myColor =  #ffffff;

  if (setColor == 0) {
    myColor = #A2CDF2;
  } else if (setColor == 1) {
    myColor = #D9BB29;
  } else if (setColor == 2) {
    myColor = #730202;
  } else if (setColor == 3) {
    myColor = #D91A1A;
  } else if (setColor == 4) {
    myColor = #0D0D0D;
  } else if (setColor == 5) {
    myColor = #FFFFFF;
  } // end if...else if

  if (setMethod == 0) {
    stroke(myColor, setAlpha);
  } else if (setMethod == 1) {
    fill(myColor, setAlpha);
  } // end if...else if
}

/* Method Name: createBorder
 * Summary: Custom Method that creates the border
 * Parameters: NONE
 * Returns: NOTHING
 */
void createBorder() {
  noStroke();

  for (int i = 0; i < gridY; i++) { // used to select row to draw border on
    for (int j = 0; j < gridX; j++) { // used to select column to draw border on
      if ( i == 0 && j == 0) { // Top Left Corner
        drawBorderItem(j, i, "leftTopCorner");
      } else if ( i == 0 && j > 0 && j < 15) { // Top Horizontal
        drawBorderItem(j, i, "topHorizontal");
        if (j <= 13) { 
          String returnedString = returnCharAtPosFromString(myName, j-1); // returns letter to display
          displayText (returnedString, 5, 60, 45 + (80 * j), 58); // Display's Student Name on first ROW. One Character in each column
        } // end if
      } else if ( i == 0 && j == 15) { // Top Right Corner
        drawBorderItem(j, i, "rightTopCorner");
      } else if ( i > 0 && i < 8 && j == 0) { // Left Veritical
        drawBorderItem(j, i, "leftVertical");
      } else if ( i == 8 && j == 0) { // Bottom Left Corner
        drawBorderItem(j, i, "leftBottomCorner");
      } else if ( i == 8 && j > 0 && j < 15) { // Bottom Horizontal
        drawBorderItem(j, i, "bottomHorizontal");
        if (j > 3 && j < 12) {
          String returnedString = returnCharAtPosFromString(myStudentNumber, j-4); // returns number to display
          displayText (returnedString, 5, 60, 30 + (80 * j), height - 18); // Display's Student Number on Last ROW. One Character in each column
        }  // end if
      } else if ( i == 8 && j == 15) { // Bottom Right Corner
        drawBorderItem(j, i, "rightBottomCorner");
      } else if ( i > 0 && i < 8 && j == 15) { // Right Veritical
        drawBorderItem(j, i, "rightVertical");
      } // end if...else if
    } // end for j
  } // end for i
}


/* Method Name: returnCharAtPosFromString
 * Summary: This Method returns a character from the string do display in the border.
 *       on the image
 * Parameters:
 *      passedInString  :- Passing in the X axis (Horizontal) starting Point
 *      charPosition    :- Passing in the Y axis (Vertical) starting Point
 * Returns:
 *      returnString    :- Character at position charPosition in passedInString
 */
String returnCharAtPosFromString(String passedInString, int charPosition) {
  String returnString = str(passedInString.trim().charAt(charPosition)).toUpperCase();
  return returnString;
}


/* Method Name: drawBorderItem
 * Summary: This Method Draws each item in the border.
 *       on the image
 * Parameters:
 *      xPosition        :- Passing in the X axis (Horizontal) starting Point
 *      yPosition        :- Passing in the Y axis (Vertical) starting Point
 *      numberOfGridsX   :- How many boxes in on the X axis (Horizontal) are drawing.
 *      numberOfGridsY   :- How many boxes in on the Y axis (Vertical) are drawing.
 *      sizeObject       :- Grid size if one section of the grid or more.
 *                              1 would be one box in the grid 80x80
 *                              2 would be four boxes of the grid 160x160
 * Returns: NOTHING
 */
void drawBorderItem(int jPosition, int iPosition, String itemPosition) {
  for (int i = 0; i <= 4; i++) {  // start for rightTopCorner
    setColor(1, i, 255);

    if (itemPosition == "leftTopCorner") {
      rect(15*i, 15*i, 80 - (15*i), 80- (15*i)); // Top Left Cornor
    } else if (itemPosition == "rightTopCorner") {
      rect(0 + (80 * jPosition), (15*i), 80 - (15*i), 80 - (15*i));  // Top Right Cornor
    } else if (itemPosition == "topHorizontal") {
      rect(0 + (80 * jPosition), 0+(15*i), 80, 80);  // Top Horizontal
    } else if (itemPosition == "leftVertical") {
      rect(0+(15*i), 0 + (80*iPosition), 80, 80);  // Top Left Verticle
    } else if (itemPosition == "leftBottomCorner") {
      rect(15*i, 0 + (80*iPosition), 80 - (15*i), 80- (15*i));  // Bottom Left Cornor
    } else if (itemPosition == "bottomHorizontal") {
      rect(0 + (80 * jPosition), 0 + (80*iPosition), 80, 80 - (15*i));  // Bottom Horizontal
    } else if (itemPosition == "rightBottomCorner") {
      rect(0 + (80 * jPosition), 0 + (80*iPosition), 80 - (15*i), 80 - (15*i));  // Bottom Right Cornor
    } else if (itemPosition == "rightVertical") {
      rect(0 + (80 * jPosition), 0 + (80*iPosition), 80 - (15*i), 80);  // Top Right Verticle
    } // end if...else if
  } // end for
}

/* Method Name: drawGrid
 * Summary: This Method creartes the border
 *       on the image
 * Parameters:
 *      xPosition        :- Passing in the X axis (Horizontal) starting Point
 *      yPosition        :- Passing in the Y axis (Vertical) starting Point
 *      numberOfGridsX   :- How many boxes in on the X axis (Horizontal) are drawing.
 *      numberOfGridsY   :- How many boxes in on the Y axis (Vertical) are drawing.
 *      sizeObject       :- Grid size if one section of the grid or more.
 *                              1 would be one box in the grid 80x80
 *                              2 would be four boxes of the grid 160x160
 * Returns: NOTHING
 */
void drawGrid(float xPosition, float yPosition, int numberOfGridsX, int numberOfGridsY, int sizeObject) {
  int switchOverlay = 0;
  strokeWeight(1);

  for (int i=1; i <= numberOfGridsX; i++) { // Draws grid numberOfGridsX wide
    for (int j=1; j <= numberOfGridsY; j++) { // Draws grid numberOfGridsY high

      if (displayMode == 1) { // All squares
        switchOverlay = 0;
      } else if (displayMode == 2) { // All Circles
        switchOverlay = 1;
      } else if (displayMode == 3 || displayMode == 4) { // All Mix of (3) Squares & Circles (4) Changes Drawing every 60 frames
        switchOverlay = int(random(0, 2));
      } else if (displayMode == 5) {
        switchOverlay = 5;
      }

      randomColor(255); // Gets Random Color setting alpha to 255
      rect(xPosition + (gridWidth * (i-1)), yPosition+ (gridHeight * (j-1)), 80 * sizeObject, 80 * sizeObject);

      if (sizeObject == 1 && switchOverlay == 0) {
        drawSquares(80 * i, 80 *j, 80, 4, 9);
      } else if (sizeObject == 1 && switchOverlay == 1) {
        drawCircles(80 * i+40, 80 *j+40, 80);
      } else if (sizeObject == 2 && switchOverlay == 0) {
        drawSquares(int(xPosition + (gridWidth * (i-1))), int(yPosition+ (gridHeight * (j-1))), 160, 4, 18);
      } else if (sizeObject == 2 && switchOverlay == 1 || switchOverlay == 5) {
        backgroundCircle(int(xPosition), int(yPosition), i, j);
        drawCircles(int(xPosition + (gridWidth * (i-1))+80), int(yPosition+ (gridHeight * (j-1))+80), 160);
      }// end if....else if
    } // end for j
  } // end for i
}

/* Method Name: backgroundCircle
 * Summary: Custom Method that draws background for Circle
 * Parameters: NONE
 *      xPos        :- Passing in the current xPosition drawGrid()
 *      yPos        :- Passing in the current yPosition drawGrid()
 *      i           :- Passed in current i Value from the loop running in drawGrid()
 *      j           :- Passed in current j Value from the loop running in drawGrid()
 * Returns: NOTHING
 */
void backgroundCircle(int xPos, int yPos, int i, int j) {
  int x = 0, z = 0;
  while (x <= 1) {
    while (z <= 1) {
      drawSquares(int(xPos + (gridWidth * (i-1))+(80*x)), int(yPos+ (gridHeight * (j-1))+(80*z)), 80, 4, 18); //draws 4 boxes behind 2x2 circle
      z++;
    }
    z=0;
    x++;
  }
}

/* Method Name: randomColor
 * Summary: Custom Method that sets a random color,
 *          it calls setColor with a random number
 *          between 0 and 5
 * Parameters: NONE
 * Returns: NOTHING
 */
void randomColor(int setAlpha) {
  int setBackgound = int(random(0, 5));
  setColor(1, setBackgound, setAlpha); // Sets Fill Color
}

/* Method Name: drawOverlayedMovableImage
 * Summary: Function demostrates Recursion by drawing items
 *          in the current grid. Its a function that calls
 *          itself.
 * Parameters:
 *      xPos :- X Position of the square
 *      yPos :- Y Position of the square
 *      objectWidth :- Width of the square
 *      objectHeight :- Height of the square
 *      level :- Keeps calling while this value > 0
 * Returns: NOTHING
 */
void drawOverlayedMovableImage(float xPos, float yPos, float objectWidth, float objectHeight, int level) {
  strokeWeight(3);

  rect(xPos +gridWidth*3, yPos+gridHeight*1.25, objectWidth, objectHeight);

  /* This recursive function calls drawSquares() another recursive function
   * and draws 6 squares, it draws one 2x2 Square, then one smaller square
   * in each corner of the 2x2 square and the final one in the center
   * of the 2x2 square. Each one of the smaller squares are TRANSLUCENT
   * with alpha set to 0
   *
   * The Function then calls drawCircles() another recursive function
   * and draws the 5 Circles on the Movable Image
   */
  if (level == 1) {
    drawSquares(int(xPos +gridWidth*3), int(yPos+gridHeight*1.25), 160, 4, 18);
  } else {
    drawCircles(xPos + gridWidth*3 + 40, yPos+gridHeight*1.25+40, 80);
  }
  if (level >=1) {
    randomColor(0); // Sets square with alpha 0 (Transparent)
    drawOverlayedMovableImage(xPos -40, yPos -40, objectWidth * 0.5, objectHeight*0.5, level-1);// Top Left circle on transparent square
    randomColor(0); // Sets square with alpha 0 (Transparent)
    drawOverlayedMovableImage(xPos +120, yPos -40, objectWidth*0.5, objectHeight*0.5, level-1);// Top Right circle on transparent square
    randomColor(0); // Sets square with alpha 0 (Transparent)
    drawOverlayedMovableImage(xPos -40, yPos +120, objectWidth * 0.5, objectHeight*0.5, level-1);// Bottom Left circle on transparent square
    randomColor(0); // Sets square with alpha 0 (Transparent)
    drawOverlayedMovableImage(xPos+120, yPos+120, objectWidth*0.5, objectHeight*0.5, level-1);// Bottom Right circle on transparent square
    randomColor(0); // Sets square with alpha 0 (Transparent)
    drawOverlayedMovableImage(xPos +40, yPos+40, objectWidth * 0.5, objectHeight*0.5, level-1); // Center square
  } // end if
} // drawOverlayedMovableImage()


/* Method Name: drawSquares
 * Summary: Function demostrates Recursion by drawing squares
 *          in the current grid. Its a function that calls
 *          itself.
 * Parameters:
 *      xPosition        :- X Position of the square
 *      yPosition        :- Y Position of the square
 *      size             :- Width & Height of the square
 *      gapBetweenBoxes  :- Space between each square
 *      level            :- Keeps calling while this value > 0
 * Returns: NOTHING
 */
void drawSquares(int xPosition, int yPosition, int size, int gapBetweenBoxes, int level) {
  randomColor(25 + (level*15)); // Sets Fill Color

  rect(xPosition, yPosition, size, size);
  if (level > 0) {
    int xPosNew = xPosition + gapBetweenBoxes;
    int yPosNew = yPosition + gapBetweenBoxes;
    drawSquares(xPosNew, yPosNew, size - 2 * gapBetweenBoxes, gapBetweenBoxes, level - 1);
  } // end if
  noStroke();
} // drawSquares()

/* Method Name: drawCircles
 * Summary: Function demostrates Recursion by drawing Circles
 *          in the current grid. Its a function that calls
 *          itself.
 * Parameters:
 *      xPosition        :- X Position of the Circles
 *      yPosition        :- Y Position of the Circles
 *      diameter         :- diameter of the Circles
 * Returns: NOTHING
 */
void drawCircles(float xPosition, float yPosition, float diameter) {
  int randomTrans = int(random(0, 6));
  randomColor(100 + (randomTrans*15)); // Sets Fill Color
  noStroke();
  ellipse(xPosition, yPosition, diameter, diameter);

  if (diameter > 2) {
    drawCircles(xPosition, yPosition, diameter * 0.9);
  } // end if
} // drawCircles()


/* Method Name: displayMode5
 * Summary: Custom Method that draws grid using translate.
 * Parameters: NONE
 * Returns: NOTHING
 */
void displayMode5() {
  createBorder();
  for (int i = 0; i<= 13; i++) {
    for (int j =0; j<=6; j++) {
      drawTranslateGrid(i, j, 80, 4, 0);
    }
  }
  draw2x2();
}

/* Method Name: drawTranslateGrid
 * Summary: Function uses Translate function to create and fill the grid
 * Parameters:
 *      xPosition        :- X Position of the Circles
 *      yPosition        :- Y Position of the Circles
 *      size             :- diameter of the Circles
 *      gapBetweenBoxes  :- Gap between each box
 *      level            :- used to stop the recursive function
 * Returns: NOTHING
 */
void drawTranslateGrid(int xPosition, int yPosition, int size, int gapBetweenBoxes, int level) {
  randomColor(25 + (level*15)); // Sets Fill Color
  translate(80 + (xPosition*80), 80 + (yPosition*80) );
  noStroke();
  drawSquares(0, 0, size, gapBetweenBoxes, 18);
  drawCircles(size/2, size/2, size);
  translate(-80 + (xPosition*-80), -80 + (yPosition*-80) );
  if (level > 0) {
    int xPosNew = xPosition + gapBetweenBoxes;
    int yPosNew = yPosition + gapBetweenBoxes;
    drawTranslateGrid(xPosNew, yPosNew, size - 2 * gapBetweenBoxes, gapBetweenBoxes, level - 1);
  } // end if
  noStroke();
} // drawTranslateGrid()

/* Method Name: draw2x2
 * Summary: Custom Method that Starts Drawing the 2x2 Grid Squares
 * Parameters: NONE
 * Returns: NOTHING
 */
void draw2x2() {

  String overlapCheckString = "";
  int overlapedGrid = 0; // used to check if 2x2Grid is overlapping

  int draw2x2 = int(random(0, 20)); // Randomly selects how many 2x2 Grids to draw
  if (draw2x2 != 0) { //Start if to skip if not to draw any 2x2

    for (int i = 0; i <= draw2x2; i++) { // for statment creates a 2x2Grid
      int randomPositionX = int(random(1, 13)); // randomly selects the xPosition in the Grid
      int randomPositionY = int(random(1, 7)); // randomly selects the yPosition in the Grid

      String newCheck = randomPositionX + "@" + randomPositionY; // Creates new string containing xPosition & yPosition in the grid

      overlapedGrid = overlapCheck(overlapCheckString, newCheck); // function called to check if newCheck overlaps with any of the previous 2x2Grids drawn

      //    println("newCheck: " + newCheck);                    // Used for error Checking printing to console
      //   println("overlapCheck: " + overlapCheck);            // Used for error Checking printing to console
      //     println("overlapedGrid: " + overlapedGrid + "\n");   // Used for error Checking printing to console

      // if grid hasnt overlapped we draw the grid. else nothing happens
      if (overlapedGrid != 1) {
        drawGrid(gridWidth * randomPositionX, gridHeight * randomPositionY, 1, 1, 2); // Draws 2x2 GRID Box
      }

      // used to track grid positions of all 2x2Grids that have been drawn and positions that would cause an overlap on new grid
      overlapCheckString = overlapCheckString + "--*Grid#" + i + "*--"
        + (randomPositionX - 1) + "@" + (randomPositionY - 1) + "_*_"
        + (randomPositionX - 1) + "@" + randomPositionY + "_*_"
        + (randomPositionX - 1) + "@" + (randomPositionY + 1) + "_*_"
        + randomPositionX + "@" + (randomPositionY - 1) + "_*_"
        + randomPositionX + "@" + randomPositionY + "_*_"
        + randomPositionX + "@" + (randomPositionY + 1) + "_*_"
        + (randomPositionX + 1) + "@" + (randomPositionY - 1) + "_*_"
        + (randomPositionX + 1) + "@" + randomPositionY + "_*_"
        + (randomPositionX + 1) + "@" + (randomPositionY + 1) + "_*_";
    } // end for
  } // end if
}

/* Method Name: overlapCheck
 * Summary: Custom Method that checks if 2x2 Grid is overlapped
 * Parameters:
 *      overlapedCheck :- String conatianing al X & Y coorinates to check
 *      toCheck        :- String conatianing current X & Y coorinates to check
 * Returns:
 *      isOverlapped   :- The position of toCheck if it is present in overlapedCheck
 *          isOverlapped = -1 if not present
 *          isOverlapped >= 0 if present
 */
int  overlapCheck(String overlapCheckString, String toCheck) {
  int isOverlapped = 0;

  if (overlapCheckString.indexOf(toCheck) >= 0) {
    isOverlapped = 1;
  }

  return isOverlapped;
}

/* Method Name: saveCreation
 * Summary: Custom Method saves the creation
 * Parameters: None
 * Returns:None
 */
void saveCreation() {
  if(noSaves >=1) {
    saveFrame(sketchTitle + "_" + noSaves + "_####.png");
    noSaves++;
  } else {
    saveFrame(sketchTitle + ".png");
    noSaves++;
  }
}
