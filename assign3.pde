PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;

int numFrames=5;
int currentFrame;
PImage [] images= new PImage [numFrames];



//gamestate
final int GAME_START=1;
final int GAME_RUN=2;
final int GAME_LOSE=3;
int gamestate;


int bgX,enemyY1,enemyY2,enemyY3;
int hpWidth;
int treasureX,treasureY;
int fighterX,fighterY;
int start1X, start2X;
int count;
int timeWidth;
int speed;


boolean isPlaying=false;
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;


//HP
int a;
//enemy
final int SPACING=60;
final int COUNT=5;
int [] enemy1= new int [6];
int [] enemy2x= new int [6];
int [] enemy2y= new int [6];
int [] enemy3x= new int [4];
int [] enemy3y= new int [4];





void setup () 

{
  size(640,480) ; 
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  
  for(int i=0; i<numFrames;i++){
    images[i]=loadImage("img/flame"+(i+1)+".png");
  }
  frameRate(100);
  currentFrame=0;
  
  
  bgX=0;
  start1X=0;
  a=2;
  
  treasureX=floor(random(0,640));
  treasureY=floor(random(0,480));
  fighterX=floor(random(0,640));
  fighterY=floor(random(0,480));
  
  //enemy
  enemyY1=floor(random(50,430));
  enemyY2=floor(random(0,180));
  enemyY3=floor(random(100,380));
  
  
  speed=5;
  gamestate=GAME_START;
  count=0;  
  timeWidth=190;
 
}

void draw() {
  
switch(gamestate){ 
  case GAME_START:
    image(start2,0,0);
    if(mouseX>207 && mouseX<463 && mouseY>326&& mouseY<421 ){
      image(start1,0,0);
      if(mousePressed){
        gamestate=GAME_RUN;
      }
    }
   break;
  
  
  case GAME_RUN:
  if(isPlaying=true){
    
    if(upPressed==true){
      fighterY-=speed;}
    if(downPressed==true){
      fighterY+= speed;}
    if(leftPressed==true){
      fighterX-=speed;}
    if(rightPressed==true){
      fighterX+=speed;}
      
    //boundary detection
    if(fighterX<0){
      fighterX=0;}
    if(fighterX>584){
      fighterX=584 ;}
    if(fighterY<0){
      fighterY=0;}
    if(fighterY>429){
      fighterY=429;}
     
    //background  
    bgX+=2;
    image(bg2,bgX,0);
    image(bg1,bgX-bg2.width,0);
    image(bg2,bgX-bg2.width-bg1.width,0);
    bgX %=bg1.width+bg2.width;
    
    //fighter
    image(fighter,fighterX,fighterY);
   
    //hp
    stroke(255,0,0);
    fill(255,0,0);
    rect(41,25,a*19,19);
    image(hp,28,22);
    
    //teasure
    count++;
    image(treasure,treasureX,treasureY);
    if(count % 300 ==0){
      treasureX=floor(random(40,600));
      treasureY=floor(random(60,420));
    }

    //enemy 1
    for(int i=0; i<5; i++){
      enemy1[i]%=4.5*width;
      enemy1[i]+=3;
      enemy1[i+1]=enemy1[i]-SPACING;
      int y=enemyY1;
      image(enemy,enemy1[i],y);
        if (enemy1[i]==4.5*width){
        enemyY1 = floor(random(50,430));
        }
    }
    
    //enemy 2
    for(int i=0; i<5; i++){
      enemy2x[i]%=4.5*width;
      enemy2x[i]+=3;
      enemy2x[i+1]=enemy2x[i]-SPACING;
      enemy2y[i+1]=enemy2y[i]+SPACING;
      image(enemy,enemy2x[i]-1.5*width,enemy2y[i]+enemyY2);
        if(enemy2x[i]==4.5*width){
          enemyY2 = floor(random(0,180));
        }
      
    }
    
    //enemy3
    for(int i=0; i<3; i++){
      enemy3x[i]%=4.5*width;
      enemy3x[i]+=3;
      enemy3x[i+1]=enemy3x[i]-SPACING;
      enemy3y[i+1]=enemy3y[i]-SPACING;
      image(enemy,enemy3x[i]-3*width,enemy3y[i]+enemyY3);
      image(enemy,enemy3x[i]-3*width,enemy3y[i]+2*abs(enemy3y[i]-enemy3y[0])+enemyY3);
      image(enemy,enemy3x[i]-2*abs(enemy3x[i]-enemy3x[2])-3*width,enemy3y[i]+enemyY3);
      image(enemy,enemy3x[i]-2*abs(enemy3x[i]-enemy3x[2])-3*width,enemy3y[i]+2*abs(enemy3y[i]-enemy3y[0])+enemyY3);
      
      //image(enemy,enemy3x[i]-3*width,enemy3y[i]+enemyY3);
        if(enemy3x[i]==4.5*width){
          enemyY3=floor(random(100,380));
        }
    }
    



//enemy
/*
      for(int i=0; i<COUNT; i++){
      enemyX%=4.5*width;
      enemyX+=0.5;
      float x=enemyX-i*SPACING;
      float y=enemyY; 
      image(enemy,x,y);
        if(fighterX>=x&&
           fighterX<=x+50&&
           fighterY>=y&&
           fighterY<=y+50){
             a-=2;
             int f=(currentFrame++)% numFrames;                          
             image(images[f],x,y);
        
        }
      } 
    
      if (enemyX==4.5*width){
      enemyY = floor(random(100,230));
      }
         
    for(int j=0; j<COUNT; j++){
      enemyX%=4.5*width;
      float x=enemyX-j*SPACING;
      float y=enemyY+j*SPACING;
      image(enemy,x-1.5*width,y);
      }
      
    for(int k=0; k<COUNT; k++){
      enemyX%=4.5*width;
      float x=enemyX+k*SPACING;
      float y=enemyY-abs(2-k)*SPACING+4*SPACING;
        for(int i=0; i<COUNT; i++){
          enemyX%=4.5*width;
          float x1= enemyX+i*SPACING;
          float y1= enemyY+ abs(2-i)*SPACING;
          image(enemy,x-3*width,y);
          image(enemy,x1-3*width,y1);            
          }                    
      }
*/
  
    if( fighterX+30>=treasureX && 
        fighterX+30<= treasureX+41 && 
        fighterY+30 >= treasureY && 
        fighterY+30<= treasureY+41)
        {
        a+=1;
        treasureX=floor(random(40,600));
        treasureY=floor(random(60,420));
        count = 0;
      
      //cap
      if(a>=10){
        a=10;
      }
    }
      if(a<=0){
      gamestate=GAME_LOSE;
    }
    
    
  }
   break;
  
    
    case GAME_LOSE:
    image(end2,0,0);
      if(mouseX>=207 && mouseX<=463 && mouseY>= 275 && mouseY<=370){
        image(end1,0,0);
         if(mousePressed){
        gamestate=GAME_RUN;
        a=2;
        }
      }
      break;
    
    }
  
 } 



void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;
      case RIGHT:
        rightPressed=true;
        break;
    }
  }
  
}
  
  void keyReleased(){
    if(key==CODED){
      switch(keyCode){
        case UP:
        upPressed=false;
        break;
      case DOWN:
        downPressed=false;
        break;
      case LEFT:
        leftPressed=false;
        break;
      case RIGHT:
        rightPressed=false;
        break;
      }
    }
  }
  
