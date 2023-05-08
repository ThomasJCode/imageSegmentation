void setup() {
  size(400, 267);
  noLoop();
}

void draw() {
  PImage img = loadImage ("grilo.jpg");
  PImage aux = createImage (img.width, img.height, RGB);

  // Filtro de escala de cinza
  for (int y=0; y < img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int pos = y*img.width + x;
      img.pixels[pos] = color(blue(img.pixels[pos]));
    }
  }

  //Filtro de brilho
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = blue(img.pixels[pos])*3;
      if (valor > 255) valor = 255;
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }


  //Filtro de limiarização
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y*width + x;

      if (blue(aux.pixels[pos]) > 150 &&  y < 230)
        aux.pixels[pos] = color(255);
      else
        aux.pixels[pos] = color(0);
    }
  }




  image(aux, 0, 0);
  save("griloSeg.jpg");
}
