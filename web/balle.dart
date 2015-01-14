import 'dart:html';
import 'dart:math';

CanvasRenderingContext2D ctx;
num lastTime = 0;
num width;
num height;

void main() {
  CanvasElement canvas = querySelector("#canvas");
  ctx = canvas.context2d;
  width = canvas.width;
  height = canvas.height;
  
  window.animationFrame.then(animate);
}



animate(num time){
  var fps = 1000 / (time - lastTime);
  lastTime = time;
  draw(fps);
  window.animationFrame.then(animate);
}

void draw(num fps) {

  var time = new DateTime.now().millisecondsSinceEpoch * 0.002;
  var x = sin( time ) * 96 + 128;
  var y = cos( time * 0.9 ) * 96 + 128;

  ctx..clearRect(0, 0, width, height)
      // background color 
      ..fillStyle = 'rgb(245,245,245)'
      ..fillRect( 0, 0, width, height )
      // FPS
      ..font = 'bold 10px Verdana'
      ..fillStyle = 'rgb(0,0,0)'
      ..fillText("Fps : $fps" , 5, 15)
     // draw ball
     ..beginPath()
     ..fillStyle = 'rgb(255,0,0)'
     ..arc( x, y, 10, 0, PI * 2, true )
     ..closePath()
     
     ..fill();

}


