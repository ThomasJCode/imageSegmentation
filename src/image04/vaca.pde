void setup() {
  size(400, 299);
  noLoop();
}

void draw() {
  PImage img = loadImage ("vaca.jpg");
  PImage aux = createImage (img.width, img.height, RGB);

  // Filtro de escala de cinza
  for(int y=0; y < img.height; y++) {
    for(int x=0; x < img.width; x++) {
       int pos = y*img.width + x;
       img.pixels[pos] = color(blue(img.pixels[pos]));
    }
  }
  
    
  //Filtro de média
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y*img.width + x;
      int jan = 6;
      int qntd = 0;
      float media = 0;

      for (int i = jan*(-1); i<= jan; i++) {
        for (int j = jan*(-1); j <= jan; j++) {
          int nx = x + j;
            int ny = y + i;

            if (ny >= 0 && ny < aux.height && nx >= 0 && nx < aux.width) {
            int pos_aux = ny*aux.width + nx;
              media += blue(img.pixels[pos_aux]);
              qntd++;
          }
        }
      }
      media = media / qntd;
      aux.pixels[pos] = color(media);
    }
  }
  
  
  //Filtro de limiarização
  for(int y = 0; y < img.height; y++){
    for(int x = 0; x < img.width; x++){
      int pos = y*width + x;
    
      if(blue(aux.pixels[pos]) > 75 &&  y < 299)
        aux.pixels[pos] = color(255);
        else
        aux.pixels[pos] = color(0);
    }
  }
    


  
  image(aux, 0, 0);
  save("vacaSeg.jpg");
}
