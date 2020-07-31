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
	</style>
	<line class="line" x1="50%" y1="0" x2="50%" y2="612"/>
	<circle class="ball"/>
	<circle class="player1"/>
	<circle class="player2"/>
	<!--<text class="text" x="50" y="50">test</text>-->
</svg>
]]