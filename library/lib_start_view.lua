viewMain = [[
<svg width="1024" height="612" version="1.1" xmlns="http://www.w3.org/2000/svg">
	<style>
		svg{
			background-color : #FFF;
		}
		.line{
			stroke : #000;
			stroke-width : 5px;
		}
		.ball{
			r : {{br}}px;
			cx : {{bx}}px;
			cy : {{by}}px;
			fill : #00FF00;
		}
		.player1{
			r : {{p1r}}px;
			cx : {{p1x}}px;
			cy : {{p1y}}px;
			fill : #FF0000;
		}
		.player2{
			r : {{p2r}}px;
			cx : {{p2x}}px;
			cy : {{p2y}}px;
			fill : #0000FF;
		}
		.text{
			font-size : 50px;
			fill : black;
			stroke:none;
		}
		.goal{
            height : 150px;
            width : 25px;
            fill : #FFF;
            stroke : #000;
            stroke-width : 5px;
		}
		.p1{
			y : 231px;
			x : 0;
		}
		.p2{
			y : 231px;
			x : 999px;
		}
	</style>
	<line class="line" x1="50%" y1="0" x2="50%" y2="612"/>
	<rect class="goal p1"/>
	<rect class="goal p2"/>
	<circle class="ball"/>
	<circle class="player1"/>
	<circle class="player2"/>
</svg>
]]

viewScore = [[
<svg width="1024" height="612" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
 <!-- Created with SVG-edit - https://github.com/SVG-Edit/svgedit-->
 <style>
  .rect{
   height : 588px;
   width : 980px;
   y : 16;
   x : 24;
   fill : #000;
   stroke : #005fbf;
   stroke-width : 5px;
  }
  .text{
   stroke : #FFF;
   fill : #FFF;
  }
  .img{
   opacity:0.6;
  }
 </style>
 <g class="layer">
  <title>Layer 1</title>
  <image class="img" xlink:href="https://cdn.discordapp.com/attachments/597133708922978304/597137058988818432/3dlogo.gif" x="256" y="50" height="512" width="512" />
  <!--<rect class="rect"/>-->
  <text font-size="100" class="text" y="70" x="10" stroke-width="0" fill="#FFF">Score de {{p}}</text>
  <text font-size="200" class="text" y="350" x="200">{{score}} pts</text>
 </g>
</svg>
]]

viewVeille = [[
<svg width="1024" height="612">
    <image xlink:href="https://cdn.discordapp.com/attachments/597133708922978304/597137058988818432/3dlogo.gif" x="256" y="50" height="512" width="512" />
</svg>
]]