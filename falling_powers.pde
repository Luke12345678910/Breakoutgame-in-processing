public class falling_powers{
  public float powerx;
  public float powery;
  public float power_speed;
  public int type;
  public boolean dead;
 
  public falling_powers(float powersx, float powersy, float speed, int types){
  powerx = powersx;
  powery = powersy;
  type = types;
  power_speed = speed;
  dead = false;}
 
  public void collisions(){
  //if ball goes below screen
  if (powery > height){
    dead = true;}
  //paddle collisions
  if (powery<=405 && powery >= 395 && powerx>=(current_paddle.paddlex+5) && 
  powerx<=(current_paddle.paddlex + current_paddle.paddlelength - 5)){
    if (type == 0){
        current_player.fire = true;}
    dead = true;}
  //left
  if ((powerx >= current_paddle.paddlex - 5 && powerx <= current_paddle.paddlex + 5) && 
  (powery <= current_paddle.paddley + 5 && powery >= current_paddle.paddley - 5)){
    if (((float)(Math.sqrt((powerx-(current_paddle.paddlex+5))*(powerx-(current_paddle.paddlex+5)) + 
    (powery-(current_paddle.paddley+5))*(powery-(current_paddle.paddley+5))))) <= 10){
      if (type == 0){
        current_player.fire = true;}
      dead = true;}}
  //right    
  if ((powerx <= current_paddle.paddlex + current_paddle.paddlelength + 5 && 
  powerx >= current_paddle.paddlex + current_paddle.paddlelength - 5) && 
  (powery <= current_paddle.paddley + 5 && powery >= current_paddle.paddley - 5)){
    if (((float)(Math.sqrt((powerx-(current_paddle.paddlex + current_paddle.paddlelength - 5))*
    (powerx-(current_paddle.paddlex + current_paddle.paddlelength - 5)) + (powery-(current_paddle.paddley+5))*
    (powery-(current_paddle.paddley+5))))) <= 10){
      if (type == 0){
        current_player.fire = true;}
      dead = true;}}
  }  
    
  public void update(){
  powery += power_speed;
  image(fireballpower, powerx, powery);}
    
   
}
