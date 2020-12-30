public class button{
  public float buttonx;
  public float buttony;
  public float buttonheight;
  public float buttonlength;
  public int buttonaction;
  public boolean isactive;
  public String buttonname;
  public player otherperson;
  
  public button(String namee, float button_x, float button_y, float button_height, float button_length, int button_action){
    buttonx = button_x;
    buttony = button_y;
    buttonheight = button_height;
    buttonlength = button_length;
    buttonaction = button_action;
    buttonname = namee;}
    
  public void onClick(){
    if (buttonaction == 0){
      displayscreen2 = true;
      displaystartingscreen = false;
      isactive = false;
      buttons[10].isactive = false;
      buttons[11].isactive = false;
      timersave = millis();}
    else if (buttonaction == 1){
      if (buyingplayer == player2){
        displayscreen2 = true;
        displaybuyingscreen = false;
        isactive = false;
        timersave = millis();
        buyingplayer = player1;}
      else{
        buyingplayer = player2;}
      }
    else if (buttonaction == 2){
      if (buyingplayer.coins >= 10){
        buyingplayer.lives += 1;
        buyingplayer.coins -= 10;}
      }
    else if (buttonaction == 3){
      if (buyingplayer.coins >= 20){
        buyingplayer.speedups+=1;
        if (buyingplayer == player1){
          player2.ballspeedmultiplyer += 0.1;}
        else{
          player1.ballspeedmultiplyer += 0.1;}
        buyingplayer.coins -= 5;}
      }
    else if (buttonaction == 4){
      if (buyingplayer.coins >= 5 && buyingplayer.paddlelength<200){
        buyingplayer.paddleups += 1;
        buyingplayer.paddlelength += 10;
        buyingplayer.coins -= 5;}
      }
    else if (buttonaction == 5){
      if (buyingplayer.coins >= 20){
        buyingplayer.moneyups+=1;
        buyingplayer.moneymultiplyer += 1;
        buyingplayer.coins -= 100;}
      }
    else if (buttonaction == 6){
      if (buyingplayer.coins>=70 && buyingplayer.fire == false){
        buyingplayer.coins-=120;
        buyingplayer.fire = true;}
    }
    else if (buttonaction == 7){
      if (buyingplayer.coins>=10 && buyingplayer.randomdying<10){
        buyingplayer.coins-=10;
        buyingplayer.randomdying += 1;}
    }
    else if (buttonaction == 9){
      if (buyingplayer == player1){
        otherperson = player2;}
      else{
        otherperson = player1;}
      if (buyingplayer.coins >= 5 && otherperson.paddlelength>20){
        buyingplayer.otherpaddledowns += 1;
        if (buyingplayer == player1){
          player2.paddlelength -= 10;}
        else{
          player1.paddlelength -= 10;}
        buyingplayer.coins -= 4;}
      }
    else if (buttonaction == 8){
      if (buyingplayer.coins >= 20){
        buyingplayer.speeddowns += 1;
        buyingplayer.ballspeedmultiplyer -= 0.1;
        buyingplayer.coins -= 5;}
      }
    else if (buttonaction == 11){
      displayrulesscreen = true;
      displaystartingscreen = false;
      buttons[0].isactive = false;
      buttons[10].isactive = false;
      buttons[11].isactive = false;
      buttons[12].isactive = true;
    }
    else if (buttonaction == 12){
      displayrulesscreen = false;
      displaystartingscreen = true;
      buttons[0].isactive = true;
      buttons[10].isactive = true;
      buttons[11].isactive = true;
      buttons[12].isactive = false;
    }
  
}
      
  public boolean isClicked(){
    if (isactive && mouseX >= buttonx && mouseX <= buttonx+buttonlength && mouseY >= buttony && mouseY <= buttony+buttonheight){
      return(true);}
    else{
      return(false);}
  }
  
  public void drawbutton(){
    if (buttonaction == 2){
      image(extralifeimage, buttonx, buttony);}
    else if (buttonaction == 12){
      image(xoutimage, buttonx, buttony);}
    else if (buttonaction == 3 || buttonaction == 8){
      image(ballspeedyimage, buttonx, buttony);}
    else if (buttonaction == 4){
      image(paddlebiggerimage, buttonx, buttony);}
    else if (buttonaction == 9){
      image(paddlesmallerimage, buttonx, buttony);}
    else if (buttonaction == 5){
      image(moremoneyimage, buttonx, buttony);}
    else if (buttonaction == 6){
      image(fireballbuyimage, buttonx, buttony);}
    else if (buttonaction == 7){
      image(randomdieimage, buttonx, buttony);}
    else{
    fill(0, 0, 255);
    rect(buttonx, buttony, buttonlength, buttonheight);}
}
  
}
  
