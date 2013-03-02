package uzay{
	import flash.display.Sprite;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class gemic extends Sprite {
		var inoktalar = new Array();
		var noktalar = new Array();
		var donaci = 1;
		var zaci = 1;
		var zaci2 = 1;
		var tmc1,tmc2,tmc3;
		var ic = new Sprite();
		public function gemic(t1,t2,t3) {
			tmc1 = t1;
			tmc2 = t2;
			tmc3 = t3;
			var n = new nokta(0,0,0,0);

			inoktalar.push(n);
			n = new nokta(0,0,-2,-2);

			inoktalar.push(n);
			n = new nokta(0,0,3,0);

			inoktalar.push(n);
			n = new nokta(0,1,-1,0);

			inoktalar.push(n);
			n = new nokta(0,-1,-1,0);

			inoktalar.push(n);

			n = new nokta(0,0,-2,0);

			inoktalar.push(n);

			for (var i=0; i<inoktalar.length; i++) {
				n = new nokta(0,0,0,0);
				addChild(n);
				noktalar.push(n);
			}
			addChild(ic);
		}
		public function ciz() {
			donaci = Math.PI/2 -Math.atan2(tmc2.y_3 - tmc1.y_3,tmc2.x_3 - tmc1.x_3);
			zaci = (tmc2.z_3 - tmc1.z_3)/2;
			zaci2 = (tmc3.z_3 - tmc1.z_3)/2;
			//zaci2 = 0;
			var b,bo;
			for (var i=0; i<noktalar.length; i++) {
				var n = noktalar[i];
				var m = inoktalar[i];
				n.x_3 = m.x_3*Math.cos(donaci) + m.y_3*Math.sin(donaci);
				n.y_3 = -m.x_3*Math.sin(donaci) + m.y_3*Math.cos(donaci);
				n.z_3 = m.y_3*zaci - m.x_3*zaci2 - m.y_3*zaci2 + m.z_3;


				bo = Math.sqrt(m.x_3*m.x_3 + m.y_3*m.y_3 + m.z_3*m.z_3);
				if (bo == 123 && b != 0) {
					b = Math.sqrt(n.x_3*n.x_3 + n.y_3*n.y_3 + n.z_3*n.z_3 )/bo;
					//n.x_3 /= b;
					n.y_3 /= b;
					n.z_3 /= b;
				}
				n.x_3 += tmc1.x_3;
				n.y_3 += tmc1.y_3;
				n.z_3 += tmc1.z_3 ;
				n.f3t2();

			}
			ic.graphics.clear();

			ic.graphics.lineStyle(0);

			if (noktalar[0].y < noktalar[2].y) {
				if (noktalar[2].x > noktalar[0].x) {
					solciz();
					sagciz();
				} else {
					sagciz();
					solciz();
				}
				altciz();
			} else {

				altciz();
				if (noktalar[2].x > noktalar[0].x) {
					solciz();
					sagciz();
				} else {
					sagciz();
					solciz();
				}
			}

			if (noktalar[0].y > noktalar[1].y) {
				ic.graphics.beginFill(0xFF00FF,1);

				ic.graphics.moveTo(noktalar[1].x,noktalar[1].y);
				ic.graphics.lineTo(noktalar[3].x,noktalar[3].y);
				ic.graphics.lineTo(noktalar[0].x,noktalar[0].y);
				ic.graphics.lineTo(noktalar[4].x,noktalar[4].y);


				ic.graphics.endFill();
			}

		}
		private function altciz() {

			ic.graphics.beginFill(0x00FF00,1);

			ic.graphics.moveTo(noktalar[0].x,noktalar[0].y);
			ic.graphics.lineTo(noktalar[3].x,noktalar[3].y);
			ic.graphics.lineTo(noktalar[2].x,noktalar[2].y);
			ic.graphics.lineTo(noktalar[4].x,noktalar[4].y);

			ic.graphics.endFill();
		}
		private function sagciz() {

			ic.graphics.beginFill(0xFF0000,1);

			ic.graphics.moveTo(noktalar[1].x,noktalar[1].y);
			ic.graphics.lineTo(noktalar[2].x,noktalar[2].y);
			ic.graphics.lineTo(noktalar[4].x,noktalar[4].y);

			ic.graphics.endFill();
		}
		private function solciz() {


			ic.graphics.beginFill(0x0000FF,1);

			ic.graphics.moveTo(noktalar[1].x,noktalar[1].y);
			ic.graphics.lineTo(noktalar[2].x,noktalar[2].y);
			ic.graphics.lineTo(noktalar[3].x,noktalar[3].y);

			ic.graphics.endFill();
		}
	}
}