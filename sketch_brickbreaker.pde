PImage redbrick;
PImage graybrick;
PImage crackedgraybrick;
PImage fireballpower;
PImage bluebrick;
PImage pinkbrick;
PImage yellowbrick;
PImage blackbrick;
PImage crackedblackbrick1;
PImage crackedblackbrick2;
PImage crackedblackbrick3;
PImage darkgraybrick;
PImage crackeddarkgraybrick1;
PImage crackeddarkgraybrick2;
PImage pitchblackbrick;
PImage xoutimage;
PImage extralifeimage;
PImage ballspeedyimage;
PImage paddlebiggerimage;
PImage paddlesmallerimage;
PImage moremoneyimage;
PImage fireballbuyimage;
PImage randomdieimage;
ball current_ball;
paddle current_paddle;
brick[] current_bricks;
button[] buttons;
boolean dPressed = false;
boolean aPressed = false;
boolean go;
boolean displaystartingscreen;
boolean displayscreen2;
boolean displaybuyingscreen;
boolean displayrulesscreen;
ArrayList<falling_powers> falling_powers_list = new ArrayList<falling_powers>();
player current_player;
player buyingplayer;
int timersave;
int leveltimersave;
boolean gameover;
player player1;
player player2;
//for generating levels
int down;
float upgradechances;
String thingy;
void setup(){
  size(500, 500);
  noStroke();
  fill(0, 34, 255);
  frameRate(200);
  go = false;
  displaystartingscreen = true;
  displayscreen2 = false;
  displaybuyingscreen = false;
  displayrulesscreen = false;
  gameover = false;
  player1 = new player(3, true, 1, 0);
  player2 = new player(3, false, 1, 0);
  current_player = player1;
  //images
  redbrick = loadImage("redbrick.png");
  graybrick = loadImage("graybrick.png");
  crackedgraybrick = loadImage("crackedgraybrick.png");
  fireballpower = loadImage("fireball.png");
  bluebrick = loadImage("bluebrick.png");
  pinkbrick = loadImage("pinkbrick.png"); 
  yellowbrick = loadImage("yellowbrick.png");
  blackbrick = loadImage("blackbrick.png");
  crackedblackbrick1 = loadImage("crackedblackbrick1.png");
  crackedblackbrick2 = loadImage("crackedblackbrick2.png");
  crackedblackbrick3 = loadImage("crackedblackbrick3.png");
  darkgraybrick = loadImage("darkgraybrick.png");
  crackeddarkgraybrick1 = loadImage("crackeddarkgraybrick1.png");
  crackeddarkgraybrick2 = loadImage("crackeddarkgraybrick2.png");
  pitchblackbrick = loadImage("pitchblackbrick.png");
  xoutimage = loadImage("xout.png");
  extralifeimage = loadImage("extralife.png");
  ballspeedyimage = loadImage("ballspeedy.png");
  paddlebiggerimage = loadImage("paddlebigger.png");
  paddlesmallerimage = loadImage("paddlesmaller.png");
  moremoneyimage = loadImage("moremoney.png");
  fireballbuyimage = loadImage("fireballbuy.png");
  randomdieimage = loadImage("randomdie.png");
  float[] velo = {.6, .75};
  current_ball = new ball(velo, 300.0, 300.0, 10.0, 1);
  current_paddle = new paddle(250, 50, 400);
  
  buttons = new button[13];
  buttons[0] = new button("Two Player", 360, 350, 20, 80, 0);
  buttons[10] = new button("one Player", 60, 350, 20, 80, 10);
  buttons[11] = new button("Rules", 210, 350, 20, 80, 11);
  buttons[1] = new button("Continue", 400, 450, 30, 70, 1);
  buttons[2] = new button("Buy Extra Life", 35, 100, 50, 70, 2);
  buttons[3] = new button("Increase other players speed", 155, 100, 50, 70, 3);
  buttons[4] = new button("Increase paddle size", 275, 100, 50, 70, 4);
  buttons[5] = new button("More money", 395, 100, 50, 70, 5);
  buttons[6] = new button("Next Round Fire", 35, 200, 50, 70, 6);
  buttons[7] = new button("randomdying", 155, 200, 50, 70, 7);
  buttons[8] = new button("Decrease your speed", 275, 200, 50, 70, 8);
  buttons[9] = new button("Decrease other players paddle size", 395, 200, 50, 70, 9);
  buttons[12] = new button("Continue from rules", 465, 5, 30, 30, 12);
  buttons[0].isactive = true;
  buttons[10].isactive = true;
  buttons[11].isactive = true;
    
}
void draw(){
  //if (frameRate < 198){
  //System.out.println(""+frameRate);}
  if (displaystartingscreen == true){
    startingscreenloop();}
  if (displayscreen2 == true){
    screen2loop();}
  if (go == true){
    mainloop();}
  if (displaybuyingscreen == true){
    buyingscreenloop();}
  if (gameover == true){
    gameoverloop();}
  if (displayrulesscreen == true){
    rulesscreenloop();}
 
  }
 
 
  
  
void mainloop(){
  background(255, 255, 255);
  noStroke();
  current_ball.collisions();
  current_ball.update();
  current_paddle.update();
  for (int i = 0; i < current_bricks.length; i++){
    current_bricks[i].update();}
  for (int j = 0; j < falling_powers_list.size(); j++){
    if (falling_powers_list.get(j).dead == true){
      falling_powers_list.remove(j);}
    else{
      falling_powers_list.get(j).update();
      falling_powers_list.get(j).collisions();}
    }      
  if (dPressed){
    current_paddle.moveRight();
    }
  else if(aPressed){
    current_paddle.moveLeft();}
  textSize(16);
  String thing;
  if (current_player == player1){
    thing = "Player1";}
  else{
    thing = "Player2";}
  text(thing + " " + current_player.lives + "lives", 10, 490);
  text("Time: " + (millis()-leveltimersave)/1000, 420, 490);}
  
void startingscreenloop(){
  background(255, 255, 255);
  textSize(40);
  text("Brick Breaker", 120, 100);
  textSize(14);
  text("One Player", 62, 390);
  text("Rules", 228, 390);
  text("Two Player", 364, 390);
  image(graybrick, 90, 150);
  image(graybrick, 130, 150);
  image(graybrick, 170, 150);
  image(graybrick, 210, 150);
  image(graybrick, 250, 150);
  image(graybrick, 290, 150);
  image(graybrick, 330, 150);
  image(yellowbrick, 370, 150);
  
  image(graybrick, 90, 160);
  image(redbrick, 130, 160);
  image(graybrick, 170, 160);
  image(graybrick, 210, 160);
  image(graybrick, 250, 160);
  image(graybrick, 290, 160);
  image(crackeddarkgraybrick2, 330, 160);
  image(graybrick, 370, 160);
  
  image(crackedgraybrick, 90, 170);
  image(graybrick, 130, 170);
  image(graybrick, 170, 170);
  image(graybrick, 210, 170);
  image(bluebrick, 250, 170);
  image(graybrick, 290, 170);
  image(graybrick, 330, 170);
  image(graybrick, 370, 170);
  
  image(graybrick, 90, 180);
  image(graybrick, 130, 180);
  image(graybrick, 170, 180);
  image(crackeddarkgraybrick2, 210, 180);
  image(graybrick, 250, 180);
  image(graybrick, 290, 180);
  image(redbrick, 330, 180);
  image(graybrick, 370, 180);
  
  image(graybrick, 90, 190);
  image(yellowbrick, 130, 190);
  image(graybrick, 170, 190);
  image(graybrick, 210, 190);
  image(graybrick, 250, 190);
  image(crackedgraybrick, 290, 190);
  image(graybrick, 330, 190);
  image(graybrick, 370, 190);
  
  image(crackeddarkgraybrick2, 90, 200);
  image(graybrick, 130, 200);
  image(graybrick, 170, 200);
  image(graybrick, 210, 200);
  image(graybrick, 250, 200);
  image(graybrick, 290, 200);
  image(graybrick, 330, 200);
  image(graybrick, 370, 200);
  fill(0, 0, 255);
  ellipse(270, 270, 10, 10);
  fill(0, 0, 0);
  rect(260, 290, 50, 10, 5);
  fill(0, 34, 255);
  for (int i = 0; i < buttons.length; i++){
    if (buttons[i].isactive){
      buttons[i].drawbutton();}}
  fill(0, 0, 0);
  }
  
void rulesscreenloop(){
  fill(0, 0, 0);
  background(255, 255, 255);
  textSize(40);
  text("Rules", 180, 50);
  textSize(16);
  text("Survive for longer than your opponent to win. Destroy all the", 20, 100);
  text("bricks in order to pass the level. Choose upgrades to make", 20, 120);
  text("your game easier or your opponents harder. Money can be", 20, 140);
  text("earned by breaking bricks and completing the level faster.", 20, 160);
  text("than your opponent", 20, 180);
  textSize(32);
  text("Brick Types: ", 150, 240);
  image(redbrick, 20, 300);
  textSize(10);
  text("Basic brick, one hit to destroy", 62, 309);
  image(graybrick, 230, 300);
  text("Two hits to destroy", 272, 309);
  image(darkgraybrick, 20, 340);
  text("Three hits to destroy", 62, 349);
  image(blackbrick, 230, 340);
  text("Four hits to destroy", 272, 349);
  image(pitchblackbrick, 20, 380);
  text("999 hits to destroy, level can be completed without destruction", 62, 389);
  //textSize(14);
  //text("Got it!", 50, 485);
  for (int i = 0; i < buttons.length; i++){
    if (buttons[i].isactive){
      buttons[i].drawbutton();}}
}

void screen2loop(){
  background(188, 188, 188);
  textSize(36);
  if (player1.lives == 0 && current_player == player1){
    gameover = true;}
  if (current_player == player1){
    text("Player 1", 50, 100);}
  else{
    text("Player 2", 50, 100);}
  if (millis()-timersave > 1000 && millis()-timersave <= 2000){
    textSize(36);
    text("THREE", 150, 200);}
  if (millis()-timersave > 2000 && millis()-timersave <= 3000){
    textSize(36);
    text("TWO", 250, 300);}
  if (millis()-timersave > 3000 && millis()-timersave <= 4000){
    textSize(36);
    text("ONE", 350, 400);}
  if (millis()-timersave>4000){
    //testing
    //current_player.level = 20;
    if (current_player.level == 1){
        current_bricks = new brick[10];
        current_bricks[0] = new brick(50, 90, 40, 10, 1, 0, 0);
        current_bricks[1] = new brick(90, 90, 40, 10, 1, 0, 1);
        current_bricks[2] = new brick(130, 90, 40, 10, 1, 0, 2);
        current_bricks[3] = new brick(170, 90, 40, 10, 1, 0, 3);
        current_bricks[4] = new brick(210, 90, 40, 10, 1, 0, 0);
        current_bricks[5] = new brick(250, 90, 40, 10, 1, 0, 1);
        current_bricks[6] = new brick(290, 90, 40, 10, 1, 0, 2);
        current_bricks[7] = new brick(330, 90, 40, 10, 1, 0, 3);
        current_bricks[8] = new brick(370, 90, 40, 10, 1, 0, 0);
        current_bricks[9] = new brick(410, 90, 40, 10, 1, 0, 1);

      }
    else if (current_player.level == 2){
        current_bricks = new brick[30];
        current_bricks[0] = new brick(50, 90, 40, 10, 1, 0, 0);
        current_bricks[1] = new brick(90, 90, 40, 10, 1, 0, 1);
        current_bricks[2] = new brick(130, 90, 40, 10, 1, 0, 2);
        current_bricks[3] = new brick(170, 90, 40, 10, 1, 0, 3);
        current_bricks[4] = new brick(210, 90, 40, 10, 1, 0, 0);
        current_bricks[5] = new brick(250, 90, 40, 10, 1, 0, 1);
        current_bricks[6] = new brick(290, 90, 40, 10, 1, 0, 2);
        current_bricks[7] = new brick(330, 90, 40, 10, 1, 0, 3);
        current_bricks[8] = new brick(370, 90, 40, 10, 1, 0, 0);
        current_bricks[9] = new brick(410, 90, 40, 10, 1, 0, 1);
        current_bricks[10] = new brick(50, 100, 40, 10, 1, 0, 0);
        current_bricks[11] = new brick(90, 100, 40, 10, 1, 0, 1);
        current_bricks[12] = new brick(130, 100, 40, 10, 1, 0, 2);
        current_bricks[13] = new brick(170, 100, 40, 10, 1, 0, 3);
        current_bricks[14] = new brick(210, 100, 40, 10, 1, 0, 0);
        current_bricks[15] = new brick(250, 100, 40, 10, 1, 0, 1);
        current_bricks[16] = new brick(290, 100, 40, 10, 1, 0, 2);
        current_bricks[17] = new brick(330, 100, 40, 10, 1, 0, 3);
        current_bricks[18] = new brick(370, 100, 40, 10, 1, 0, 0);
        current_bricks[19] = new brick(410, 100, 40, 10, 1, 0, 1);
        current_bricks[20] = new brick(50, 110, 40, 10, 1, 0, 0);
        current_bricks[21] = new brick(90, 110, 40, 10, 1, 0, 1);
        current_bricks[22] = new brick(130, 110, 40, 10, 1, 0, 2);
        current_bricks[23] = new brick(170, 110, 40, 10, 1, 0, 3);
        current_bricks[24] = new brick(210, 110, 40, 10, 1, 0, 0);
        current_bricks[25] = new brick(250, 110, 40, 10, 1, 0, 1);
        current_bricks[26] = new brick(290, 110, 40, 10, 1, 0, 2);
        current_bricks[27] = new brick(330, 110, 40, 10, 1, 0, 3);
        current_bricks[28] = new brick(370, 110, 40, 10, 1, 0, 0);
        current_bricks[29] = new brick(410, 110, 40, 10, 1, 0, 1);
      }
    else if (current_player.level == 3){
      current_bricks = new brick[19];
      current_bricks[0] = new brick(120, 100, 40, 10, 1, 0, 2);
      current_bricks[1] = new brick(120, 110, 40, 10, 1, 0, 2);
      current_bricks[2] = new brick(120, 120, 40, 10, 1, 0, 2);
      current_bricks[3] = new brick(120, 130, 40, 10, 1, 0, 2);
      current_bricks[4] = new brick(120, 140, 40, 10, 1, 0, 2);
      current_bricks[5] = new brick(340, 100, 40, 10, 1, 0, 2);
      current_bricks[6] = new brick(340, 110, 40, 10, 1, 0, 2);
      current_bricks[7] = new brick(340, 120, 40, 10, 1, 0, 2);
      current_bricks[8] = new brick(340, 130, 40, 10, 1, 0, 2);
      current_bricks[9] = new brick(340, 140, 40, 10, 1, 0, 2);
      current_bricks[10] = new brick(150, 300, 40, 10, 1, 0, 0);
      current_bricks[11] = new brick(190, 300, 40, 10, 1, 0, 0);
      current_bricks[12] = new brick(230, 300, 40, 10, 1, 0, 0);
      current_bricks[13] = new brick(270, 300, 40, 10, 1, 0, 0);
      current_bricks[14] = new brick(310, 300, 40, 10, 1, 0, 0);
      current_bricks[15] = new brick(130, 290, 40, 10, 1, 0, 0);
      current_bricks[16] = new brick(330, 290, 40, 10, 1, 0, 0);
      current_bricks[17] = new brick(350, 280, 40, 10, 1, 0, 0);
      current_bricks[18] = new brick(110, 280, 40, 10, 1, 0, 0);   
    }
    else if (current_player.level == 4){
      current_bricks = new brick[46];
      current_bricks[0] = new brick(50, 90, 40, 10, 1, 0, 0);
        current_bricks[1] = new brick(90, 90, 40, 10, 1, 0, 1);
        current_bricks[2] = new brick(130, 90, 40, 10, 1, 0, 2);
        current_bricks[3] = new brick(170, 90, 40, 10, 1, 0, 3);
        current_bricks[4] = new brick(210, 90, 40, 10, 1, 0, 0);
        current_bricks[5] = new brick(250, 90, 40, 10, 1, 0, 1);
        current_bricks[6] = new brick(290, 90, 40, 10, 1, 0, 2);
        current_bricks[7] = new brick(330, 90, 40, 10, 1, 0, 3);
        current_bricks[8] = new brick(370, 90, 40, 10, 1, 0, 0);
        current_bricks[9] = new brick(410, 90, 40, 10, 1, 0, 1);
        current_bricks[10] = new brick(50, 100, 40, 10, 1, 0, 0);
        current_bricks[11] = new brick(90, 100, 40, 10, 1, 0, 1);
        current_bricks[12] = new brick(130, 100, 40, 10, 1, 0, 2);
        current_bricks[13] = new brick(170, 100, 40, 10, 1, 0, 3);
        current_bricks[14] = new brick(210, 100, 40, 10, 1, 0, 0);
        current_bricks[15] = new brick(250, 100, 40, 10, 1, 0, 1);
        current_bricks[16] = new brick(290, 100, 40, 10, 1, 0, 2);
        current_bricks[17] = new brick(330, 100, 40, 10, 1, 0, 3);
        current_bricks[18] = new brick(370, 100, 40, 10, 1, 0, 0);
        current_bricks[19] = new brick(410, 100, 40, 10, 1, 0, 1);
        current_bricks[20] = new brick(50, 110, 40, 10, 1, 0, 0);
        current_bricks[21] = new brick(90, 110, 40, 10, 1, 0, 1);
        current_bricks[22] = new brick(130, 110, 40, 10, 1, 0, 2);
        current_bricks[23] = new brick(170, 110, 40, 10, 1, 0, 3);
        current_bricks[24] = new brick(210, 110, 40, 10, 1, 0, 0);
        current_bricks[25] = new brick(250, 110, 40, 10, 1, 0, 1);
        current_bricks[26] = new brick(290, 110, 40, 10, 1, 0, 2);
        current_bricks[27] = new brick(330, 110, 40, 10, 1, 0, 3);
        current_bricks[28] = new brick(370, 110, 40, 10, 1, 0, 0);
        current_bricks[29] = new brick(410, 110, 40, 10, 1, 0, 1);
        current_bricks[30] = new brick(410, 80, 40, 10, 1, 0, 1);
        current_bricks[31] = new brick(410, 70, 40, 10, 1, 0, 1);
        current_bricks[32] = new brick(410, 60, 40, 10, 1, 0, 1);
        current_bricks[33] = new brick(410, 50, 40, 10, 1, 0, 1);
        current_bricks[34] = new brick(50, 80, 40, 10, 1, 0, 0);
        current_bricks[35] = new brick(50, 70, 40, 10, 1, 0, 0);
        current_bricks[36] = new brick(50, 60, 40, 10, 1, 0, 0);
        current_bricks[37] = new brick(50, 50, 40, 10, 1, 0, 0);
        current_bricks[38] = new brick(170, 80, 40, 10, 1, 0, 3);
        current_bricks[39] = new brick(170, 70, 40, 10, 1, 0, 3);
        current_bricks[40] = new brick(170, 60, 40, 10, 1, 0, 3);
        current_bricks[41] = new brick(170, 50, 40, 10, 1, 0, 3);
        current_bricks[42] = new brick(290, 80, 40, 10, 1, 0, 2);
        current_bricks[43] = new brick(290, 70, 40, 10, 1, 0, 2);
        current_bricks[44] = new brick(290, 60, 40, 10, 1, 0, 2);
        current_bricks[45] = new brick(290, 50, 40, 10, 1, 0, 2);
    }
    else if (current_player.level == 5){
      current_bricks = new brick[33];
      current_bricks[1] = new brick(50, 90, 40, 10, 1, 0, 0);
      current_bricks[2] = new brick(90, 90, 40, 10, 1, 0, 0);
      current_bricks[3] = new brick(130, 90, 40, 10, 2, 1, 1);
      current_bricks[4] = new brick(170, 90, 40, 10, 2, 1, 1);
      current_bricks[5] = new brick(210, 90, 40, 10, 2, 1, 1);
      current_bricks[6] = new brick(250, 90, 40, 10, 2, 1, 1);
      current_bricks[7] = new brick(290, 90, 40, 10, 2, 1, 1);
      current_bricks[8] = new brick(330, 90, 40, 10, 2, 1, 1);
      current_bricks[9] = new brick(370, 90, 40, 10, 2, 1, 1);
      current_bricks[10] = new brick(410, 90, 40, 10, 1, 0, 0);
      current_bricks[11] = new brick(450, 90, 40, 10, 1, 0, 0);
      current_bricks[12] = new brick(50, 80, 40, 10, 2, 1, 1);
      current_bricks[13] = new brick(90, 80, 40, 10, 2, 1, 1);
      current_bricks[14] = new brick(130, 80, 40, 10, 2, 1, 1);
      current_bricks[15] = new brick(170, 80, 40, 10, 2, 1, 1);
      current_bricks[16] = new brick(210, 80, 40, 10, 2, 1, 1);
      current_bricks[17] = new brick(250, 80, 40, 10, 2, 1, 1);
      current_bricks[18] = new brick(290, 80, 40, 10, 2, 1, 1);
      current_bricks[19] = new brick(330, 80, 40, 10, 1, 0, 0);
      current_bricks[20] = new brick(370, 80, 40, 10, 1, 0, 0);
      current_bricks[21] = new brick(410, 80, 40, 10, 2, 1, 1);
      current_bricks[22] = new brick(450, 80, 40, 10, 2, 1, 1);
      current_bricks[23] = new brick(50, 70, 40, 10, 2, 1, 1);
      current_bricks[24] = new brick(90, 70, 40, 10, 2, 1, 1);
      current_bricks[25] = new brick(130, 70, 40, 10, 2, 1, 1);
      current_bricks[26] = new brick(170, 70, 40, 10, 2, 1, 1);
      current_bricks[27] = new brick(210, 70, 40, 10, 2, 1, 1);
      current_bricks[28] = new brick(250, 70, 40, 10, 2, 1, 1);
      current_bricks[29] = new brick(290, 70, 40, 10, 2, 1, 1);
      current_bricks[30] = new brick(330, 70, 40, 10, 1, 0, 0);
      current_bricks[31] = new brick(370, 70, 40, 10, 1, 0, 0);
      current_bricks[32] = new brick(410, 70, 40, 10, 2, 1, 1);
      current_bricks[0] = new brick(450, 70, 40, 10, 2, 1, 1);}
      else{
        if (current_player.level<60){
        down = (current_player.level*5);}
        else{
          down = 300;}
         //switch 6 if more levels added
        upgradechances = (float)current_player.level/((float)6);
        current_bricks = new brick[60];
        for (int i = 0; i < current_bricks.length; i++){
          current_bricks[i] = new brick(50 + 40*(i%10),down + 10*(i/10), 40, 10, 1, 0, int(random(0, 4)));}
        for (int i = 0; i < current_player.level/6; i++){
          for (int j = 0; j < current_bricks.length; j++){
            //System.out.println("UPgrade chances" + upgradechances);
            if (random(0, upgradechances)>1){
              if (current_bricks[j].brickhp<4){
                current_bricks[j].bricktype+=1;
                current_bricks[j].brickhp+=1;}}}}
  
 
  
  }
    current_paddle.paddlex = 250 - current_paddle.paddlelength/2;
    current_ball.ball_x = current_paddle.paddlex + (current_paddle.paddlelength/2);
    current_ball.ball_y = current_paddle.paddley - 6;
    current_ball.ball_velocity[0] = 0;
    current_ball.ball_velocity[1] = 0;
    go = true;
    current_paddle.paddlelength = current_player.paddlelength;
    leveltimersave = millis();
    mainloop();
    displayscreen2 = false;}
}

void buyingscreenloop(){
  if (buyingplayer == player1){
    background(188, 188, 188);}
  else{
    background(188, 188, 188);}
  fill(11, 122, 190);
  textSize(20);
  fill(0, 0, 0);
  if (buyingplayer == player1){
    text("Player 1: Choose your upgrades!", 80, 50);}
  else{
    text("Player 2: Choose your upgrades!", 80, 50);}
  textSize(12);
  text("Owned: " + buyingplayer.lives, 37, 160);
  text("Owned: " + buyingplayer.speedups, 157, 160);
  text("Owned: " + buyingplayer.paddleups, 277, 160);
  text("Owned: " + buyingplayer.moneyups, 397, 160);
  text("Owned: " + buyingplayer.fire, 37, 260);
  text("Owned: " + buyingplayer.randomdying, 157, 260);
  text("Owned: " + buyingplayer.speeddowns, 277, 260);
  text("Owned: " + buyingplayer.otherpaddledowns, 397, 260);
  
  text("Extra life", 39, 89);
  text( "10 coins", 40, 99);
  text("Speedy Ball", 159, 89);
  text( "20 coins", 160, 99);
  text("Large Paddle", 279, 89);
  text( "5 coins", 280, 99);
  text("More Money", 399, 89);
  text( "20 coins", 400, 99);
  text("Fireball(1 Round)", 39, 189);
  text( "70 coins", 40, 199);
  text("Chain Reaction", 159, 189);
  text( "10 coins", 160, 199);
  text("Slow Ball", 279, 189);
  text( "20 coins", 280, 199);
  text("Small Paddle", 399, 189);
  text( "5 coins", 400, 199);
  for (int i = 0; i < buttons.length; i++){
    if (buttons[i].isactive){
      buttons[i].drawbutton();}}
  fill(0, 0, 0);
  if (buyingplayer == player1){
    thingy = "Player1";
    }
  else{
    thingy = "Player2";}
  text(thingy + " :" + buyingplayer.coins + "coins", 10, 490);
  
  
}

void gameoverloop(){
  background(221, 23, 223);
  text("GAME OVER", 100, 100);
  if (player1.lives == 0){
    text("PLAYER 2 WINS!", 200, 300);}
  else{
    text("PLAYER 1 WINS!", 200, 300);}}
  
void keyPressed(){
  if (keyCode == 'D'){
   dPressed = true;}
   
  if (keyCode == 'A'){
   aPressed = true;}
   
  if (keyCode == 'L'){
    player1.coins += 9999;
    player2.coins+= 9999;
}
   }
void keyReleased(){
  if (keyCode == 'D'){
  dPressed = false;}
    
  if (keyCode == 'A'){
  aPressed = false;}}
  
void mouseClicked(){
  for (int i = 0; i < buttons.length; i++){
    if (buttons[i].isClicked()){
      buttons[i].onClick();}}
  //starting ball shot
  if ((current_ball.ball_velocity[0] == 0 || !go) && !displaystartingscreen && !displayscreen2 && !gameover && !displaybuyingscreen && !displayrulesscreen){
    go = true;
    float[] outvelo = new float[2];
    outvelo[0] = mouseX - (current_paddle.paddlex + (current_paddle.paddlelength/2));
    outvelo[1] = mouseY - (current_paddle.paddley-5);
    current_ball.ball_velocity = current_ball.normalize(outvelo);
    }
}
