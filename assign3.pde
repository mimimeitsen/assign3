PImage bg1;
PImage bg2;
PImage enemy;
PImage  fighter;

int x,speed;
float enemyX,enemyY,enemyA;
int fighterX,fighterY;


boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

final int COUNT=5;
final int SPACING=60;


void setup()
{

  size(640,480);
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  x=0;
  speed=5;
  fighterX=600;
  fighterY=240;
  enemyX=0;
  enemyY=floor(random(50,200));
  

}

void draw()
{
    //background
    x+=2;
    image(bg2,x,0);
    image(bg1,x-bg2.width,0);
    image(bg2,x-bg2.width-bg1.width,0);
    x %=bg1.width+bg2.width;
    
    //fighter
    image(fighter,fighterX,fighterY);
    //fighter.boundary detection
    if(fighterX<0){
      fighterX=0;}
    if(fighterX>584){
      fighterX=584 ;}
    if(fighterY<0){
      fighterY=0;}
    if(fighterY>429){
      fighterY=429;} 
      
    //enemy1(c)
    enemyX%=4.5*width;
    for(int i=0; i<COUNT; i++){
      float x=enemyX+i*SPACING;
      float y=enemyY;
      
      image(enemy,x,y);  
      enemyX+=0.2;
    }
    
    //enemy2(b)
    for(int j=0; j<COUNT; j++){
      float x=enemyX-j*SPACING;
      float y=enemyY+j*SPACING;
      image(enemy,x-1.5*width,y);
      enemyX+=0.2;
    }
    
    //enemy3(a)
    for(int k=0; k<COUNT; k++){
      float x=enemyX+k*SPACING;
      float y=enemyY-abs(2-k)*SPACING+4*SPACING;
        for(int i=0; i<COUNT; i++){
          float x1= enemyX+i*SPACING;
          float y1= enemyY+ abs(2-i)*SPACING;
          image(enemy,x-3*width,y);
          image(enemy,x1-3*width,y1);
          enemyX+=0.2;
        }
             
    }
    

    //pressing
    if(upPressed==true){
      fighterY-=speed;}
    if(downPressed==true){
      fighterY+= speed;}
    if(leftPressed==true){
      fighterX-=speed;}
    if(rightPressed==true){
      fighterX+=speed;} 
  
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
