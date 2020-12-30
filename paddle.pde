public class paddle {
  //Top left(x, y) I think
  public float paddlex;
  public float paddley;
  public float paddlelength;

  public paddle(float paddlexx, float paddlelength1, float paddleyy) {
  paddlex = paddlexx;
  paddlelength = paddlelength1;
  paddley = paddleyy;
  }
 
  public void moveRight(){
  if (paddlex < width - paddlelength && current_ball.ball_velocity[0] != 0){ 
  paddlex += 1.3;}}
    
  public void moveLeft(){
  if (paddlex > 0 && current_ball.ball_velocity[0] != 0){ 
  paddlex -= 1.3;}}  
 
  public void update(){
  //rectangle with rounded corners of radius 5
  if (current_player == player1){
    fill(0, 0, 0);}
  else{
    fill(0, 0, 0);}
  rect(paddlex, paddley, paddlelength, 10, 5);}
    
    
    
    
    
}
