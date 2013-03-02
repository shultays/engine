package uzay{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class kenar extends Sprite {
		var nesneler=new Array;
		var uzaklik=0;
		public var cins="kenar";
		public var yakinlik=10;
		var cizme;

		var bak;
		var ic:Sprite=new Sprite;
		var renk=0;
		var tahta;
		public var ustunde = 0;
		public function kenar(ren,b,t) {

			tahta = t;
			renk=ren;
			bak=b;
			ic.graphics.lineStyle(0);
			ic.graphics.beginFill(renk,1);

			ic.graphics.moveTo(tahta[0][0],tahta[0][1]);
			for (var i=1; i < tahta.length; i++) {

				ic.graphics.lineTo(tahta[i][0],tahta[i][1]);
			}
			ic.graphics.endFill();
			ic.x=0;
			ic.y=0;
			addChild(ic);

			//buttonMode = true;
		}
		public function f3t2() {

			var cizme=0;
			yakinlik=0;
			alpha=0;


			var uz = 3;
			for (var i=0; i < 3; i++) {

				yakinlik+= tahta[i][2];
				if (tahta[i][4] == 0) {
					uz--;
				}
			}
			yakinlik /= 3;
			alpha=1;

			if (bak != 0) {
				var aci1=Math.atan2(tahta[0][1] - tahta[1][1],tahta[0][0] - tahta[1][0]) / Math.PI * 180;
				var aci2=Math.atan2(tahta[2][1] - tahta[1][1],tahta[2][0] - tahta[1][0]) / Math.PI * 180;
				var kon=aci1 - aci2;
				kon*= bak;
				if (kon > 180 || kon > -180 && kon < 0) {
					cizme=1;
				}
			}
			ic.graphics.clear();
			if (cizme == 0 && uz >= 1) {
				var rd = 3;
				for (i=0; i<3; i++) {

					if (tahta[i][3] != 1) {
						rd--;
					}
				}
				ic.graphics.lineStyle(0);
				ic.graphics.beginFill(renk,1);

				ic.graphics.moveTo(tahta[0][0],tahta[0][1]);
				for (i=1; i < 3; i++) {

					ic.graphics.lineTo(tahta[i][0],tahta[i][1]);

				}
				ic.graphics.endFill();

			}

		}
	}
}