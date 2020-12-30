public class player{
  public int lives;
  public ArrayList<Integer> effects = new ArrayList<Integer>();
  public boolean playing;
  public int level;
  public int coins;
  public int leveltime;
  public float ballspeedmultiplyer = 1;
  public float paddlelength = 50;
  public int moneymultiplyer = 1;
  public boolean fire = false;
  public int speedups = 0;
  public int paddleups = 0;
  public int moneyups = 0;
  public int randomdying = 0;
  public int speeddowns = 0;
  public int otherpaddledowns = 0;
  public player(int live, boolean play, int levels, int coinss){
    lives = live;
    playing = play;
    level = levels;
    coins = coinss;}
  
  public void lostlife(){
    lives -= 1;
    if (lives == 0){
    if (current_player == player2){
      if (player1.lives != 0){
            gameover = true;}
      else{
        player1.lives = 1;
        player2.lives = 1;
        falling_powers_list.clear();
        go = false;
        current_player.fire = false;
        player1.level = player2.level;
        displayscreen2 = true;
        current_player = player1;
        timersave = millis();

      }
            
            
    }
    else{
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 0, 0);
      background(255, 255, 255);
      current_player = player2;
      displayscreen2 = true;
      timersave = millis();
      falling_powers_list.clear();
      go = false;
      current_player.fire = false;}


    }
    current_paddle.paddlex = 250 - current_paddle.paddlelength/2;
    current_ball.ball_x = current_paddle.paddlex + (current_paddle.paddlelength/2);
    current_ball.ball_y = current_paddle.paddley - 6;
    current_player.leveltime = leveltimersave;
    current_ball.ball_velocity[0] = 0;
    current_ball.ball_velocity[1] = 0;}
    

      
      
      
      
}
