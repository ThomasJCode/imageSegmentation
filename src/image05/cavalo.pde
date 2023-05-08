void setup() {
  size(400, 267);
  noLoop();
}

void draw() {
  PImage img = loadImage ("cavalo.jpg");
  PImage aux = createImage (img.width, img.height, RGB);

  // Filtro de escala de cinza
  for (int y=0; y < img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int pos = y*img.width + x;
      img.pixels[pos] = color(green(img.pixels[pos]));
    }
  }

  // Filtro de Brilho
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = green(img.pixels[pos])*0.6;
      if (valor > 255) valor = 255;
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }

  //Filtro de limiarização
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y*width + x;

      if (green(aux.pixels[pos]) > 75 &&  y < 267)
        aux.pixels[pos] = color(0);
      else
        aux.pixels[pos] = color(255);
    }
  }


  image(aux, 0, 0);
  save("cavaloSeg.jpg");
}
