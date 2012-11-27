import 'dart:html';
import 'dart:math';

CanvasRenderingContext2D ctx;

void main() {
  CanvasElement canvas = document.query("#canvas");
  ctx = canvas.getContext("2d");
  
  window.requestAnimationFrame(animate);
}

animate(num time){
  draw();
  window.requestAnimationFrame(animate);
}

void draw() {

  var time = new Date.now().millisecondsSinceEpoch * 0.002;
  var x = sin( time ) * 96 + 128;
  var y = cos( time * 0.9 ) * 96 + 128;

  ctx.fillStyle = 'rgb(245,245,245)';
  ctx.fillRect( 0, 0, 255, 255 );

  ctx.fillStyle = 'rgb(255,0,0)';
  ctx.beginPath();
  ctx.arc( x, y, 10, 0, PI * 2, true );
  ctx.closePath();
  ctx.fill();

}

