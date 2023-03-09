/* Reflection

Student Name: Kieron Garvey
Student#: 96358157

Part A  - Mark (5/5)
=========================

Having completed my assignment to the detailed rubic in relation to 

Comments - Mark 1/5
  1) Line comments examples: Lines 26,27,112,338, 334
  2) Multiline comments examples: Lines 54 to 70, 81 to 89
  3) Multiline comments are at the start of methods example: line 540 to 551,564 to 573,601 to 610,671 to 680

Indentation/Formatting - Mark 1/5 
  1) all my work has been indented and formatted correctly.
  2) examples on lines 90 to 110, 330 to 358
  
Naming - 1/5
  I used camel case for most of the names for variables and methods. I also kept the naming meaningful.
  1) Lines 327 has method called createBorder for creating the border items
  2) Line 390 has drawBorderItem which draws each item
  3) Line 11 has the following variables declared which are self-explanatory 
      valueMouseDraggedX, valueMouseDraggedY, frameCountWait,
  
Inclusion of Readme. Mark - 1/5
  My Assignment contains a Readme tab.
  
    
Inclusion of Reflection. Mark - 1/5
  My Assignment contains a Reflection tab.


Part B - Mark (2 /2)
=========================
I sized and positioned the display window correctly.

Sizing set as 1280*720 on Line 25 - 1/2
Positioning set to 0,0 which is the top left hand corner of the screen on Line 26  - 1/2 


Part C - setup() and draw() - Mark (X /5)
==================================================
My Animation is is working. The Setup and draw are fully functional - 5/5
line 24 - draw() - Mark 2.5/5
line 52 - setup()- Mark 2.5/5


Part D - If statements - Mark (10 /10)
==================================================
I have multiple if statements with multiple branches. Also, I have multiple nested if statements and nested if 
statements contained within nested for loops.

line 90 to 110 - contains a nested if starting on line 90 and checks if a key is pressed. The inner second if starting on 
line 91 contains multiple branches and checks to see if 1, 2, 3, 4 or 5 is the key that was pressed. - Mark 2/10

line 113 to 118 is another simple example of a nested if. The first if starting on line 113 checks to see if the 
framecount is 60*frameCountWait which with frameRate at 60 this executes every second. The inner second if on 114 
executes the startDrawing method to change the drawing if displayMode equals 4- Mark 1/10

line 188 to 227 - is an example of an if statement that contains multple conditions on each branch checking which mouseButton was 
clicked and on some branches if displayMode equals 5 - Mark 2/10 

line 332 to 356 is an example of a nested if statement contained within a nested for loop (first for is on line 330 
and inner second for starts on line 331). There are two nested ifs within two of the branches first one on line 336 to 339 and 
the second one is on 348 to 351. This if decides which part of the border is to be drawn and the what letters to display. - Mark 2/10

line 394 to 410 is an example of an if statement it uses a value passed into the method to decide which rectangle type 
needs to be drawn. - Mark 1/10

line 434 to 442 is another example of an if statement within a nested for loop. This if decides based on the displaymode 
if we draw rectangles, circles or both - Mark 1/10

line 447 to 456 is another example of an if statement within a nested for loop (first for loop starts on line 431 and second on 432). 
The if decides what to draw based on what sizeObject and switchOverlay have been set to - Mark 1/10

Part E - Loops - Mark (20 /20)
==================================================
I have multiple examples of loops and nested loops within my code.

1) I have multiple for loops 
  - Starting at line 391 draws the four rectangles in the border items - Mark 3/20
  - Starting at lines 639 runs for a randomly(set on 636) set number of times to draw the 2x2 grid items and 
    ensures the grids don’t overlap- Mark 3/20
    
2) I have a nested While loop with first loop on line 472 and inside loop on line 473 which draws a sqaures in the 
    grid as a background for circles. - Mark 2/20
    
3) I have multiple nested for loops
  - Starting with first for loop on line 330 and inside loop on line 331 is used for positioning the borders - Mark 4/20
  - Starting with first for loop on line 431 and inside loop on line 432 is used for creating rest of grid inside 
    the border. - Mark 4/20
  - Starting with first for loop on line 593 and inside loop on line 594 loop is used for creating the grid 
    inside the border when key 5 has been pressed so i could demonstrate the Translate method. - Mark 4/20

Part F - Bespoke Method - Mark (20 /20)
==================================================
Im recording a perfect mark for this as I have multiple bespoke methods. I used Recursive methods to call other 
recursive methods. I passed values to and returned values from different methods.

I have 16 bespoke methods all which completely different tasks, some are passed different parameter values, some 
return values and others don’t get passed or return anything.

I am marking my results on the following Methods

1) Method with no parameters and no return value can be found on1) 

    Line Called on line & Description
    ---- ----------------------------
    132   44, 73, 94, 98 & 102 (this method is called elsewhere also). This is a Bespoke Method that Starts Drawing the Image - Mark 1/20
    
    327  43, 72, 190, 194 & 263 (this method is called elsewhere also). This is a Bespoke Method that creates the border - Mark 1/20
    
    631  136 & 598. This is a Bespoke Method that Starts Drawing the 2x2 Grid Squares- Mark 2/20

2) Method with multiple parameters can be found on

    Line Called on line & Description
    ---- ----------------------------
    152   338 & 350 This method is used to display the text on the screen- Mark 2/20
    
    298   75, 153, 392 & 491. This method is used to set the colour to use. - Mark 2/20
    
    390   333, 335 & 341 (this method is called elsewhere also) This Method Draws each item in the border - Mark 2/20
    
    470    454 this method draws a background for Circle- Mark 2/20
    
    506    78, 527, 529,531, 533 & 535 Method demonstrates Recursion by drawing items which are movable on the screen - Mark 2/20
    
    552   448,450, 474, 559 & 615 (method is called elsewhere also) Method demonstrates Recursion by drawing squares - Mark 2/20
    
    574   450, 455, 581 & 616 (method is called elsewhere also) Method demonstrates Recursion by drawing Circles - Mark 2/20
    
    611   595 & 621  Recursive Method that uses the Translate function to create and fill the grid. It calls 
    multiple other recursive functions while running - Mark 2/20

3) Method with parameters passed to it and returns a value can be found on

    Line Called on line & Description
    ---- ----------------------------
    371   337 & 349. Method returns a character from the string do display in the border. - Mark 1/20
    
    681  645. Method that checks if 2x2 Grid is overlapped - Mark 1/20

Part G - Processing Method calls - Mark (10 /10)
==================================================
I have called over 10 Processing methods. I am recording an excellent mar for this at 100%. A few examples 
of where i used the Processing Methods are

  1) noStroke() on line 328- Mark 1/10
  2) translate() on line 613 & 617 - Mark 1/10
  3) ellipse() on line 578 - Mark 1/10
  4) rect() on line 397,399 & 401 - Mark 1/10
  5) random() on line 439 & 490 - Mark 1/10
  6) int() on line 439 & 455  - Mark 1/10
  7) str() on line 372 - Mark 1/10
  8) fill() on line 318 - Mark 1/10
  9) stroke() on line 316 - Mark 1/10
  10) saveframe() on line 177 - Mark 1/10

Part H - Mouse Methods - Mark (10 /10)
==================================================
I am recording 100% for Mouse methods as i used 5 in total and changed up what some of them done based on what key had 
been pressed before hand.

  1) mouseWheel() on line 175 - Mark 2/10
    -if you have pressed key 5 and move the mouseWheel it saves the frame as png.
  2) mouseClicked() on line 187 - Mark 2/10
    - right mouse button saves the frame as png.
    - if you have pressed key 5 the left mouse button it stops the moving image and the right mouse button it starts 
      the moving image.
  3) mousePressed() on line 245 - Mark 2/10
    - Displays the movable image
  4) mouseReleased() on line 258 - Mark 2/10
    - Removes the movable image
  5) mouseDragged() on line 274 - Mark 2/10
    - Moves the movable image

Part I - String Methods- Mark (10 /10)
==================================================
I used 5 different types of string methods. I’m giving myself 100% excellent mark. I  managed to do something 
smart to stop a bug in my program with the use of indexOf() instead of needing a string. 

The draw2x2() method on line 631 trys to create a random amount (between 0 and 20) of larger grid items on my 
drawing. A string called overlapCheckString is created on 633 and assigned a blank string.

The method then loops through the number randomly selected in a for loop on line 639 randomly selecting an x and y position 
to place the larger grid item.

A string called newCheck is created on line 643 and assigned the values of the random x Position (line 640) and the @ symbol followed 
by the random y Position (line 641).

The method then pass both overlapCheckString and newCheck to a bespoke method called overlapCheck on line 645. This method 
uses indexOf() to search the overlapCheckString and if it contains newCheck we return a value 1. 

If 1 is returned i don’t draw the new larger grid item and move the loop on to check my next random position to place the 
larger grid item. On line 657 i add all positions that would cause an overlap to overlapCheckString.
  
  1) length() on line 276, 278, 280,281 & 282  - Mark 2/10
        I used the length of the myStudentNumber string after trimming the leading and trailing spaces to move my movable image. 
  2) trim() on line 276, 278, 280,281, 282 & 372  - Mark 2/10
        Used to trim the strings
  3) charAt() on line 372  - Mark 2/10
        Returned the character at a given position
  4) toUpperCase() on line 372  - Mark 2/10
       Changed characters to uppercase
  5) indexOf() on line 684  - Mark 2/10
      returned a value if the string contained a string. -1 if not present.
  
Part J - Saves PNG file - Mark (3/3)
==================================================
My program saves the display in a PNG file on a right mouse click. Also, if the key 5 is pressed right click stops the moving 
drawing and then mouseWheel save the image. 

Save Method on line 696
Called from line 177 (right clicked) & line 226(when key 5 is pressed and mousewheel moved)

- Mark 3/3

Part K - Mark (5/5)
==================================================
I have a great looking image which can be changed based on the user interaction by selecting 1, 2, 3, 4 or 5. It will draw only 
squares (1), only circles(2), draw both in different grids(3 or 4 but 4 will change the image every 60 frames) and also in the 
same grid(5) all based on what the user selects. The cell contents uses colours, transparency, randomness, text, shapes overlayed 
on each other. It’s also interactive - if mousePressed and mouseDragged the overlay image moves around the screen. I will be displaying 
it on my GigHub Account!

Overall mark
==================================================
Total :- 5+2+5+10+20+20+10+10+10+3+5=100
*/
