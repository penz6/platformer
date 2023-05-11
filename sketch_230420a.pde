//import sounds because its not native
import processing.sound.*;


float yposStart;
float ypos;
float xpos;
float speed = 0;
float gravity = 0.1;
float sidespeed = 0;
PImage sprite;
PImage platform;
PImage backround;
SoundFile jump;
SoundFile music;
Platform plat = new Platform();
int screen = 0;
//level int
int level = 0;

void setup() {
  size(500, 800);
  xpos = width/2;
  ypos = height-20;
  //initial platforms
  plat.drawNewStage();
  //sprites
  sprite = loadImage("sprite.png");
  platform = loadImage("platform.png");
  backround = loadImage("backround.png");
  //sounds
  jump = new SoundFile(this, "jump.wav");
  music = new SoundFile(this, "backround.mp3");
  //loop backround music
  //takes a solid minute to load because it has to decode the mp3 allegely
  music.loop();
  
   
}
//decalre player
//draw (loops while canvas is open)

void draw() {
  // Display the contents of the current screen
  if (screen == 0) {
    screenzero();
  } else if (screen == 1) {
    screenone();
}
}


//screen zero
void screenzero(){
  background(0);
  textAlign(CENTER);
  text("Don't stop moving; The Game!\n\nClick to start", width/2, height/2);
}

//screen one
void screenone() {
  //System.out.println("Ypos:"+ypos+" Height:"+(height-50));
  background(backround);
  stroke(0);
  // text
  textAlign(CENTER);
  textSize(50); 
  text("Level: " + level, width/2, 50);
  //character
  image(sprite, xpos, ypos,20,20);
  //System.out.println("Sidespeed: " + sidespeed);
  //bottom
  if (ypos>=height-22) {
    speed = 0;
    //System.out.println("Bottom");
  }
  //rising
   else if (ypos<height-22 && plat.checkCollision()==false) {
    speed = speed+gravity;
    ypos = ypos+speed;
   }
   //side
   xpos+=sidespeed;
   //collision?
   if(xpos>width-20){
     sidespeed=0;
     xpos = width-20;
    }
    else if(xpos<0){
      sidespeed = 0;
      xpos = 0;
    }
    for(int j = 1; j<8;j++){
      image(platform,plat.arrx.get(j),plat.arry.get(j),100,10);
    }
    //check collision
    if(plat.checkCollision() == true){
      speed = 0;
    }
    if(ypos<0){
       ypos = height-25;
       background(255);
       stroke(0);
       plat.drawNewStage();
    }
}
    

//mouse click
public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (screen==0) {
    screen = 1;
  }
}

  
  
  
  
  //key imputs
  void keyPressed() {
    //jump
    if (key == ' ' && speed==0) {
      ypos = ypos-5;
      speed = -5;
      jump.play();
    }
    else if(key=='a'){
      //speed at witch the player moves
      while(sidespeed>-4){
        sidespeed-=0.1;
        //System.out.println(sidespeed);
    }
    }
    else if(key=='d'){
      //System.out.println(sidespeed+"d");
      //speed at witch the player moves
      while(sidespeed<4){
        sidespeed+=0.1;
    }
  }
  }
