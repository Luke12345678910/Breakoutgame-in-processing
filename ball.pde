public class ball{
  private float[] ball_velocity;
  //center point(x, y) I think
  private float ball_x;
  private float ball_y;
  private float ball_radius;
  public int ball_damage;
  public boolean crash = false;
  public boolean fire;
  public boolean singlehitter;
  public ball(float[] ball_velo, float ballx, float bally, float ballradius, int balldamage){
  ball_x = ballx;
  ball_y = bally;
  ball_velocity = ball_velo;
  //actually width(double the radius)
  ball_radius = ballradius;
  ball_damage = balldamage;
  }
    
  public void collisions(){
  if (crash == true && ball_y < 390){
    crash = false;}
  //wall collisions
  if ((ball_x >= width - ball_radius/2 - ball_velocity[1]) || (ball_x<=ball_radius/2)){
    ball_velocity[0] = ball_velocity[0] * -1;}
  //floor collision
  if ((ball_y >= height + ball_radius/2)){
    current_player.lostlife();}
  //roof collision
  if ((ball_y <= ball_radius/2)){
    ball_velocity[1] = ball_velocity[1]*-1;}
  //brick collisions
  singlehitter = false;
  for (int i = 0; i < current_bricks.length; i++){
     if (ball_x >= current_bricks[i].brickx && ball_x <= current_bricks[i].brickx + current_bricks[i].bricklength && ball_y >= current_bricks[i].bricky-5 && ball_y <= current_bricks[i].bricky + current_bricks[i].brickheight + 5 && current_bricks[i].brickhp > 0 && !singlehitter){
       if (!(current_player.fire && current_bricks[i].bricktype != 5)){
       ball_velocity[1]*=-1;}
       current_bricks[i].gothit();
       singlehitter = true;}
     else if (ball_x >= current_bricks[i].brickx - 5 && ball_x <= current_bricks[i].brickx + current_bricks[i].bricklength + 5 && ball_y <= current_bricks[i].bricky + current_bricks[i].brickheight && ball_y >= current_bricks[i].bricky && current_bricks[i].brickhp > 0 && !singlehitter){
       if (!(current_player.fire && current_bricks[i].bricktype != 5)){
       ball_velocity[0]*=-1;}
       current_bricks[i].gothit();
       singlehitter = true;}
    //top left
     else if (Math.sqrt((ball_x-current_bricks[i].brickx)*(ball_x-current_bricks[i].brickx) + (ball_y-current_bricks[i].bricky)*(ball_y-current_bricks[i].bricky)) <= 5 && current_bricks[i].brickhp > 0 && !singlehitter){
      int brickchecker = 0;
      for (int j = 0; j<current_bricks.length; j++){
        if (((current_bricks[i].brickx-current_bricks[j].bricklength-current_bricks[j].brickx <= (current_ball.ball_radius/2) && current_bricks[i].brickx-current_bricks[j].bricklength-current_bricks[j].brickx >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].bricky == current_bricks[j].bricky) && current_bricks[j].brickhp>0)){
          brickchecker = 1;
          }
        if ((current_bricks[i].bricky-current_bricks[j].brickheight-current_bricks[j].bricky <= (current_ball.ball_radius/2) && current_bricks[i].bricky-current_bricks[j].brickheight-current_bricks[j].bricky >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].brickx == current_bricks[j].brickx) && current_bricks[j].brickhp>0){
          brickchecker = 2;
          }}
      if (brickchecker == 1){
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        current_ball.ball_velocity[1] *= -1;}
        current_bricks[i].gothit();
        }
      else if (brickchecker == 2){
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        current_ball.ball_velocity[0] *= -1;}
        current_bricks[i].gothit();
}
      else{
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        ball_velocity = normalize(calcbounce(2, i));}}
      current_bricks[i].gothit();
      singlehitter = true;        }
     //bottom left            
     else if (Math.sqrt((ball_x-current_bricks[i].brickx)*(ball_x-current_bricks[i].brickx) + (ball_y-(current_bricks[i].bricky + current_bricks[i].brickheight))*(ball_y-(current_bricks[i].bricky + current_bricks[i].brickheight))) <= 5 && current_bricks[i].brickhp > 0 && !singlehitter){
      int brickchecker = 0;
      for (int j = 0; j<current_bricks.length; j++){
        if (((current_bricks[i].brickx-current_bricks[j].bricklength-current_bricks[j].brickx <= (current_ball.ball_radius/2) && current_bricks[i].brickx-current_bricks[j].bricklength-current_bricks[j].brickx >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].bricky == current_bricks[j].bricky) && current_bricks[j].brickhp>0)){
          brickchecker = 1;
          
          }
        if ((current_bricks[j].bricky-current_bricks[j].brickheight-current_bricks[i].bricky <= (current_ball.ball_radius/2) && current_bricks[j].bricky-current_bricks[j].brickheight-current_bricks[i].bricky >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].brickx == current_bricks[j].brickx) && current_bricks[j].brickhp>0){
          brickchecker = 2;
          }}
        if (brickchecker == 1){
          if (!(current_player.fire && current_bricks[i].bricktype != 5)){
          current_ball.ball_velocity[1] *= -1;}
          current_bricks[i].gothit();
}
      else if (brickchecker == 2){
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        current_ball.ball_velocity[0] *= -1;}
        current_bricks[i].gothit();
}
      else{
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        ball_velocity = normalize(calcbounce(3, i));}}
        current_bricks[i].gothit();
       singlehitter = true;}    
     //top right
     else if (Math.sqrt((ball_x-(current_bricks[i].brickx + current_bricks[i].bricklength))*(ball_x-(current_bricks[i].brickx + current_bricks[i].bricklength)) + (ball_y-current_bricks[i].bricky)*(ball_y-current_bricks[i].bricky)) <= 5 && current_bricks[i].brickhp > 0 && !singlehitter){
      int brickchecker = 0;
      for (int j = 0; j<current_bricks.length; j++){
        if (((current_bricks[j].brickx-current_bricks[j].bricklength-current_bricks[i].brickx <= (current_ball.ball_radius/2) && current_bricks[j].brickx-current_bricks[j].bricklength-current_bricks[i].brickx >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].bricky == current_bricks[j].bricky) && current_bricks[j].brickhp>0)){
          brickchecker = 1;
          }
        if ((current_bricks[i].bricky-current_bricks[j].brickheight-current_bricks[j].bricky <= (current_ball.ball_radius/2) && current_bricks[i].bricky-current_bricks[j].brickheight-current_bricks[j].bricky >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].brickx == current_bricks[j].brickx) && current_bricks[j].brickhp>0){
          brickchecker = 2;
          }}
        if (brickchecker == 1){
          if (!(current_player.fire && current_bricks[i].bricktype != 5)){
          current_ball.ball_velocity[1] *= -1;}
          current_bricks[i].gothit();
}
        else if (brickchecker == 2){
          if (!(current_player.fire && current_bricks[i].bricktype != 5)){
          current_ball.ball_velocity[0] *= -1;}
          current_bricks[i].gothit();
}
      else{
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        ball_velocity = normalize(calcbounce(4, i));}}
        current_bricks[i].gothit();
        singlehitter = true;}
     //bottom right          
     else if (Math.sqrt((ball_x-(current_bricks[i].brickx + current_bricks[i].bricklength))*(ball_x-(current_bricks[i].brickx + current_bricks[i].bricklength)) + (ball_y-(current_bricks[i].bricky + current_bricks[i].brickheight))*(ball_y-(current_bricks[i].bricky + current_bricks[i].brickheight))) <= 5 && current_bricks[i].brickhp > 0 && !singlehitter){
      int brickchecker = 0;
      for (int j = 0; j<current_bricks.length; j++){
        if (((current_bricks[j].brickx-current_bricks[j].bricklength-current_bricks[i].brickx <= (current_ball.ball_radius/2) && current_bricks[j].brickx-current_bricks[j].bricklength-current_bricks[i].brickx >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].bricky == current_bricks[j].bricky) && current_bricks[j].brickhp>0)){
          brickchecker = 1;
          }
        if ((current_bricks[j].bricky-current_bricks[j].brickheight-current_bricks[i].bricky <= (current_ball.ball_radius/2) && current_bricks[j].bricky-current_bricks[j].brickheight-current_bricks[i].bricky >= -1*(current_ball.ball_radius/2)) && (current_bricks[i].brickx == current_bricks[j].brickx) && current_bricks[j].brickhp>0){
          brickchecker = 2;
          }}
      if (brickchecker == 1){
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        current_ball.ball_velocity[1] *= -1;}
        current_bricks[i].gothit();
}
      else if (brickchecker == 2){
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        current_ball.ball_velocity[0] *= -1;}
        current_bricks[i].gothit();
}
      else{
        if (!(current_player.fire && current_bricks[i].bricktype != 5)){
        ball_velocity = normalize(calcbounce(5, i));}}
        current_bricks[i].gothit();
        singlehitter = true;} 
     
      
    }
    
    
  
  //middle paddle collisions on top
  if (ball_y<=405 && ball_y >= 395 && ball_x>=(current_paddle.paddlex+5) && ball_x<=(current_paddle.paddlex + current_paddle.paddlelength - 5) && crash == false){
    ball_velocity[1] = ball_velocity[1]*-1;}
  //edge paddle collisions(lots of issues)(WILL BREAK IF RADIUS IS CHANGED ON BALL OR PADDLE)
  //left
  if ((ball_x >= current_paddle.paddlex - 5 && ball_x <= current_paddle.paddlex + 5) && (ball_y <= current_paddle.paddley + 5 && ball_y >= current_paddle.paddley - 5) && crash == false){
    //System.out.println("EDGE");
    if (((float)(Math.sqrt((ball_x-(current_paddle.paddlex+5))*(ball_x-(current_paddle.paddlex+5)) + (ball_y-(current_paddle.paddley+5))*(ball_y-(current_paddle.paddley+5))))) <= 10){
      ball_velocity = normalize(calcbounce(0, -1));
      crash = true;
      //System.out.println("OUTVELO" + ball_velocity[0] + "," + ball_velocity[1]);
    }}
  //right    
  if ((ball_x <= current_paddle.paddlex + current_paddle.paddlelength + 5 && ball_x >= current_paddle.paddlex + current_paddle.paddlelength - 5) && (ball_y <= current_paddle.paddley + 5 && ball_y >= current_paddle.paddley - 5) && crash == false){
    //System.out.println("EDGE");
    if (((float)(Math.sqrt((ball_x-(current_paddle.paddlex + current_paddle.paddlelength - 5))*(ball_x-(current_paddle.paddlex + current_paddle.paddlelength - 5)) + (ball_y-(current_paddle.paddley+5))*(ball_y-(current_paddle.paddley+5))))) <= 10){
      ball_velocity = normalize(calcbounce(1, -1));
      crash = true;}}    
    //System.out.println("EDGE!");
    //System.out.println("" + ball_x + "------" + ball_y + "-----" + current_paddle.paddlex + "------" + current_paddle.paddley);
    
      
    
    
  }
    
  private float[] calcbounce(int place, int brick){
  float[] tangencypoint = new float[2];
  float slope;
  float[] normal = new float[2];
  //right side paddle
  //ball_x > current_paddle.paddlex + (current_paddle.paddlelength/2
  if (place == 1){
    tangencypoint[0] = (ball_x+(current_paddle.paddlex + current_paddle.paddlelength-5))/2;
    tangencypoint[1] = (ball_y+(current_paddle.paddley+5))/2;
    slope = (ball_y-(current_paddle.paddley+5))/(Math.abs(ball_x-(current_paddle.paddlex + current_paddle.paddlelength - 5)));
    normal[0] = 1;
  }
  //left side paddle
  else if (place == 0){
    tangencypoint[0] = (ball_x+(current_paddle.paddlex+5))/2;
    tangencypoint[1] = (ball_y+(current_paddle.paddley+5))/2;
    slope = (ball_y-(current_paddle.paddley+5))/(ball_x-(current_paddle.paddlex+5));
    normal[0] = 1;}
  //top left brick  
  else if (place == 2){
    tangencypoint[0] = (current_bricks[brick].brickx);
    tangencypoint[1] = (current_bricks[brick].bricky);
    slope = Math.abs(((ball_y-current_bricks[brick].bricky)/(ball_x-current_bricks[brick].brickx)));
    normal[0] = 1;}
  //bottom left brick  
  else if (place == 3){
    tangencypoint[0] = (current_bricks[brick].brickx);
    tangencypoint[1] = (current_bricks[brick].bricky+current_bricks[brick].brickheight);
    slope = Math.abs(((ball_y-(current_bricks[brick].bricky + current_bricks[brick].brickheight))/(ball_x-current_bricks[brick].brickx)));
    normal[0] = -1;}
  //top right brick  
  else if (place == 4){
    tangencypoint[0] = (current_bricks[brick].brickx + current_bricks[brick].bricklength);
    tangencypoint[1] = (current_bricks[brick].bricky);
    slope = -1*Math.abs(((ball_y-current_bricks[brick].bricky)/(ball_x-(current_bricks[brick].brickx + current_bricks[brick].bricklength))));
    normal[0] = 1;}
  //bottom right brick  
  else{
    tangencypoint[0] = (current_bricks[brick].brickx + current_bricks[brick].bricklength);
    tangencypoint[1] = (current_bricks[brick].bricky + current_bricks[brick].brickheight);
    slope = -1*Math.abs(((ball_y-(current_bricks[brick].bricky + current_bricks[brick].brickheight))/(ball_x-(current_bricks[brick].brickx + current_bricks[brick].bricklength))));
    normal[0] = -1;}  
  //System.out.println("velo" + ball_velocity[0] + "," + ball_velocity[1]);
  
  normal[1] = slope;
  
  normal = normalize(normal); //returns a scaled vector 
  //System.out.println("normal: " + normal[0] + "," + normal[1]);
  float[] outs = new float[2];
  float scalar = 2*(ball_velocity[0]*-1*normal[0] + ball_velocity[1]*-1*normal[1]);
  outs[0] = normal[0]*scalar - ball_velocity[0]*-1;
  outs[1] = normal[1]*scalar + ball_velocity[1];
  return outs;
 
    
  }
  
  private float calcmagnitude(float one, float two){
    return (float)(Math.sqrt(one*one + (two*two)));}
    
    
  private float[] normalize(float[] banana){
  float[] out = new float[2];
  out[0] = banana[0]/calcmagnitude(banana[0], banana[1]);
  out[1] = banana[1]/calcmagnitude(banana[0], banana[1]);
  return out;}
    
  public void update(){
  ball_x = ball_x + ball_velocity[0]*current_player.ballspeedmultiplyer;
  ball_y = ball_y + ball_velocity[1]*current_player.ballspeedmultiplyer;
  if (current_player.fire){
    fill(255, 119, 0);}
  else if (current_player == player1){
    fill(0, 0, 255);}
  else{
    fill(0, 255, 0);}
  ellipse(ball_x, ball_y, ball_radius, ball_radius);}
}
