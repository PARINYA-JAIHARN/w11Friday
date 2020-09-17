class Circle{
  float pntX = 100;
  float pntY = 400;
  float pntYlv1 = pntY; //to keep default Y point
  float pntYlv2 = pntY - 50; //to change Y point
  int status = 1; //to keep direction

  public Circle(){
  }

  void create(){ //draw circle
    fill(255);
    ellipse(this.pntX, this.pntY, 200, 200);
  }
  void run(){  //make circle move

    if(this.status == 0){ //move to right
      this.pntX += 5;
      if(this.pntX > 900){
        this.status = 1; // when out of loop, set new status
      }
    }

    if(this.status == 1){ //move to left
      this.pntX -= 5;
      if(this.pntX < 100){
        this.status = 0; // when out of loop, set new status
      }
    }

    if((keyPressed == true) && (key == CODED) && (keyCode == UP)) { //move circle up while pressing ARROW UP key
       this.pntY = this.pntYlv2;
    } 
    if((keyPressed == false) && (key == CODED) && (keyCode == UP)) { //move circle to default position
       this.pntY = this.pntYlv1;
    } 
    if((keyPressed == true) && (key == CODED) && (keyCode == DOWN)) { //to stop while pressing ARROW DOWN key
       if(this.status == 1){ // if move to left, then move to right 5 point
       this.pntX += 5;
       }
       if(this.status == 0){ // if move to right, then move to left 5 point
       this.pntX -= 5;
       }
    } 
    create();
  }
}

Circle mycircle; // create instance (object)

void setup()
{
  size(1000, 800);
  mycircle = new Circle();
}

void draw(){
  background(200);
  mycircle.run();
}
