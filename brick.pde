public class brick {
  //Top left(x, y) I think
  public float brickx;
  public float bricky;
  public int brickhp;
  public int brickcolor;
  public int bricktype;
  public float bricklength;
  public float brickheight;
 
  public brick(float bricksx, float bricksy, float brickslength,  float bricksheight, int brickshp, int bricktypee, int brickcolorr) {
  brickx = bricksx;
  bricky = bricksy;
  bricklength = brickslength;
  brickheight = bricksheight;
  brickhp = brickshp;
  bricktype = bricktypee;
  brickcolor = brickcolorr;
  }
 
  public void update(){
  if (brickhp > 0){
    //rect(brickx, bricky, bricklength, brickheight);
    if (bricktype == 0){
      if (brickcolor == 0){  
        image(redbrick, brickx, bricky);}
      else if (brickcolor == 1){  
        image(bluebrick, brickx, bricky);}
      else if (brickcolor == 2){  
        image(pinkbrick, brickx, bricky);}
      else if (brickcolor == 3){  
        image(yellowbrick, brickx, bricky);}
      
    }
    else if (bricktype == 1){
      if (brickhp == 1){
        image(crackedgraybrick, brickx, bricky);}
      else if (brickhp == 2){
        image(graybrick, brickx, bricky);}}
    else if (bricktype == 2){
      if (brickhp == 1){
        image(crackeddarkgraybrick2, brickx, bricky);}
      else if (brickhp == 2){
        image(crackeddarkgraybrick1, brickx, bricky);}
      else{
        image(darkgraybrick, brickx, bricky);}}
    else if (bricktype == 3){
      if (brickhp == 1){
        image(crackedblackbrick3, brickx, bricky);}
      else if (brickhp == 2){
        image(crackedblackbrick2, brickx, bricky);}
      else if (brickhp == 3){
        image(crackedblackbrick1, brickx, bricky);}
      else{
        image(blackbrick, brickx, bricky);}}
    else{
      image(pitchblackbrick, brickx, bricky);}
  }
  
  }
  
  public void gothit(){
  //randomdying functionality
  if (brickhp == 1){
    if (current_player.randomdying>0){
      for (int i = 0; i<current_bricks.length; i++){
        if (random(100)<current_player.randomdying && current_bricks[i].bricktype != 5){
          current_player.coins += current_bricks[i].brickhp;
          current_bricks[i].brickhp = 0;}}}}
  current_player.coins+=current_player.moneymultiplyer;
    brickhp -= current_ball.ball_damage;
  if (brickhp == 0){
    if ((random(100)>97) && (brickhp == 0)){
      falling_powers_list.add(new falling_powers(brickx + (bricklength/2)-2.5, bricky, .5, 0));}}
  //levelcomplete
  boolean done = true;
  for (int i = 0; i<current_bricks.length; i++){
    if (current_bricks[i].brickhp>0){
      done = false;
      break;}}
  if (done == true){
    falling_powers_list.clear();
    go = false;
    current_player.fire = false;
    current_player.leveltime = millis()-leveltimersave;
    current_player.level += 1;
    if (player1.level == player2.level){
      if (player1.leveltime > player2.leveltime){
        player2.coins += (int)(player1.leveltime-player2.leveltime)/5000;
        }
      else{
        player1.coins += (int)(player2.leveltime-player1.leveltime)/5000;
        }
      
      displaybuyingscreen = true;
      buyingplayer = player1;
      buttons[1].isactive = true;
      buttons[2].isactive = true;
      buttons[3].isactive = true;
      buttons[4].isactive = true;
      buttons[5].isactive = true;
      buttons[6].isactive = true;
      buttons[7].isactive = true;
      buttons[8].isactive = true;
      buttons[9].isactive = true;}
    else{
      displayscreen2 = true;}
      
    
    if (current_player == player1){
      current_player = player2;}
    else{
      current_player = player1;
      }}
    timersave = millis();
  
  }
 }
