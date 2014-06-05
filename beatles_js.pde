// @pjs preload must be used to preload the image
/* @pjs preload="0.jpg,1.jpg,2.jpg,3.jpg,4.jpg,5.jpg,6.jpg,7.jpg,8.jpg,9.jpg,10.jpg,11.jpg,12.jpg"; 
        crisp="true";
*/
ArrayList albums = new ArrayList(); 
//loading all the album covers
PImage[] covers = new PImage[13];
PFont font;


void setup() {

  size(800, 600);
  font = createFont("Helvetica", 24);
    
  for (int i = 0; i < covers.length; i++) {
    
    covers[i] = loadImage(str(i) + ".jpg");
    
  }    

  loadData();

  for(int i=0; i < albums.size() ; i++){
  
    Album a = (Album) albums.get(i);
    
    println(a.title + ", released in " + a.year + ", sold " + str(a.copies) + " copies");
  }    
    
}

void draw(){
  background(50);
  
  for(int i=0; i < albums.size() ; i++){
  
    Album a = albums.get(i);
    
    a.h = map(a.copies, 0, 19000000, 0, 400);
    a.xpos = i*60;
    a.ypos = 0;
    a.filename = covers[i];
  
    
     a.render();
  // a.textVis();
    
  }  
  
}

void loadData(){

  String sales = loadStrings("beatles.csv");
  
  for(int i=1; i < sales.length ; i++){
    //println(i + "=" + sales[i]);
        
    String [] oneNodeData = split(sales[i], ",");
    Album a = new Album();
    
    a.title = oneNodeData[0];
    a.year = oneNodeData[1];
    a.copies = oneNodeData[2];
    
    albums.add(a);
   
  }

  
}
class Album{

  String title;
  String year;
  int copies;  
  
  int fontSize;
  int fillcode;

  float xpos;
  float ypos;
  
  float h;
  
  PImage filename;

  void render(){
  
   
    
    noStroke();
    fill(0, fillcode, 0); //green
    rect(xpos, ypos, 50, h);
    
    
    
    if(mouseX >= xpos && mouseX <= xpos + 50){
      if(mouseY >=0 && mouseY <= h){
          fillcode = 125;
          
          image(filename, 20, 300);
          fill(0);
          textFont(font, 20);
          text(title, 20, height-50);
          text("Released in " + year + ", sold " + str(copies) + " copies", 20, height-30);
      }
    }
    else {
      fillcode = 200;
    }    
    
    
  }


}

