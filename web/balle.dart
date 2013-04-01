import 'dart:html';
import 'dart:math';

CanvasRenderingContext2D ctx;

void main() {
  CanvasElement canvas = document.query("#canvas");
  ctx = canvas.context2d;
  
  window.animationFrame.then(animate);
}

animate(num time){
  draw();
  window.animationFrame.then(animate);
}

void draw() {

  var time = new DateTime.now().millisecondsSinceEpoch * 0.002;
  var x = sin( time ) * 96 + 128;
  var y = cos( time * 0.9 ) * 96 + 128;

  ctx..fillStyle = 'rgb(245,245,245)'
     ..fillRect( 0, 0, 255, 255 )
     ..fillStyle = 'rgb(255,0,0)'
     ..beginPath()
     ..arc( x, y, 10, 0, PI * 2, true )
     ..closePath()
     ..fill();

}


