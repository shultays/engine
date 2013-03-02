package uzay{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.ColorTransform;
	import flash.text.TextField;

	public class motor extends MovieClip {

		include "hareket.as"

		var x_git=0;
		var y_git=0;
		var z_git=0;

		var cevir_yon=0;
		var goz_n;
		var goz_x;
		var goz_y;
		var goz_z;
		var hiz = 0;
		private var hedef_int:uint;
		var kenarlar=new Array;
		var kolacik=0;
		var ilk = 1;
		var adet = 20;
		var aralik = 30;
		var tahta = new Array(adet);
		var tahta2 = new Array(adet);
		var tmc1;
		var tmc2;
		var tmc3;
		var tmcs = new Array(3);
		var dushiz = new Array(3);
		var tilerle=0;
		var tdon=0;
		var yerde = 0;
		var gemi;
		var gemi2;
		public function motor() {

			goz_n = [0,0,-200];
			goz_x = [0,1,0];
			goz_y = [-1,0,0];
			goz_z = [0,0,1];


			nokta.n = goz_n;
			nokta.x_a = goz_x;
			nokta.y_a = goz_y;
			nokta.z_a = goz_z;

			gemi = new MovieClip();
			addChild(gemi);
			kenarlar.push(gemi);
			gemi.yakinlik = 10000;
			for (var i=0; i<adet; i++) {
				tahta[i] = new Array(adet);
				tahta2[i] = new Array(adet);
				for (var j=0; j<adet; j++) {

					var z = Math.random()*20;
					var yn =new Array((i-adet/2)*aralik,(j-adet/2)*aralik,z);
					tahta[i][j] = yn;
					tahta2[i][j] = new Array(4);
					tahta2[i][j][3] = 1;
				}
			}
			for (i=0; i<adet-1; i++) {
				for (j=0; j<adet-1; j++) {
					var arr = [tahta[i+1][j],tahta[i][j],tahta[i][j+1]];

					var vektor1 = [aralik,0,tahta[i][j][2] - tahta[i][j+1][2]];
					var vektor2 = [aralik,aralik,tahta[i][j][2] - tahta[i+1][j][2]];
					var vektor3 = [vektor1[1]*vektor2[2] - vektor1[2]*vektor2[1], vektor1[2]*vektor2[0] - vektor1[0]*vektor2[2], vektor1[0]*vektor2[1] - vektor1[1]*vektor2[0] ];
					var boy = vektor3[0]*vektor3[0] + vektor3[1]*vektor3[1] + vektor3[2]*vektor3[2];
					boy = Math.sqrt(boy);
					vektor3[0] /= boy;
					vektor3[1] /= boy;
					vektor3[2] /= boy;

					var cosaci = vektor3[0]*Math.sqrt(1/3) + vektor3[1]*Math.sqrt(1/3) + vektor3[2]*Math.sqrt(1/3);

					var col = new ColorTransform(cosaci,cosaci,cosaci,1,0,0,0,0);
					var c = 0xFFFFFF*Math.random()*0.8 + 0xFFFFFF*0.2;
					var ken = ciz_shape(0xAAAAFF,-1,[tahta2[i+1][j],tahta2[i][j],tahta2[i][j+1]]);
					tahta[i][j][3] = ken;
					ken.transform.colorTransform = col;
					arr = [tahta[i+1][j],tahta[i+1][j+1],tahta[i][j+1]];
					vektor1 = [-aralik,0,tahta[i+1][j+1][2] - tahta[i][j+1][2]];
					vektor2 = [-aralik,-aralik,tahta[i+1][j+1][2] - tahta[i+1][j][2]];
					vektor3 = [vektor1[1]*vektor2[2] - vektor1[2]*vektor2[1], vektor1[2]*vektor2[0] - vektor1[0]*vektor2[2], vektor1[0]*vektor2[1] - vektor1[1]*vektor2[0] ];
					boy = vektor3[0]*vektor3[0] + vektor3[1]*vektor3[1] + vektor3[2]*vektor3[2];
					boy = Math.sqrt(boy);
					vektor3[0] /= boy;
					vektor3[1] /= boy;
					vektor3[2] /= boy;

					cosaci = vektor3[0]*Math.sqrt(1/3) + vektor3[1]*Math.sqrt(1/3) + vektor3[2]*Math.sqrt(1/3);
					col = new ColorTransform(cosaci,cosaci,cosaci,1,0,0,0,0);
					c = 0xFFFFFF*Math.random()*0.8 + 0xFFFFFF*0.2;
					ken = ciz_shape(0xAAAAFF,1,[tahta2[i+1][j],tahta2[i+1][j+1],tahta2[i][j+1]]);
					ken.transform.colorTransform = col;
					tahta[i][j][4] = ken;

				}
			}
			addEventListener(Event.ENTER_FRAME,enterframe);

			stage.addEventListener(KeyboardEvent.KEY_DOWN,keypress);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyrelease);
			stage.addEventListener(MouseEvent.MOUSE_DOWN,sahnetik);
			stage.addEventListener(MouseEvent.MOUSE_UP,sahnebirak);
			tmc1 = new nokta(1,0,0,-40);
			addChild(tmc1);
			tmc2 = new nokta(1,2,0,-40);
			addChild(tmc2);
			tmc3 = new nokta(1,0,2,-40);
			addChild(tmc3);
			tmcs = [tmc1,tmc2,tmc3];
			gemi2 = new gemic(tmc1,tmc2,tmc3);
			addChild(gemi2);
		}
		private function sahnetik(event:MouseEvent) {

			farekol.visible = true;
			farekol.gotoAndPlay(2);
			kolacik = 1;

			farekol.x = mouseX;
			farekol.y = mouseY;

		}
		private function sahnebirak(event:MouseEvent) {
			farekol.visible = false;
			farekol.gotoAndStop(1);
			kolacik = 0;
		}
		private function ciz_shape(renk,bak,kenarimiz):Object {
			var kenar0=new kenar(renk,bak,kenarimiz);
			kenarlar.push(kenar0);
			addChild(kenar0);
			return kenar0;
		}
		public function enterframe(evt:Event):void {
			if ( tilerle == 1 && yerde == 1) {
				if (hiz < 4) {
					hiz += 0.3;
				}
				tileri();
			} else if ( tilerle == -1 && yerde == 1) {
				if (hiz > -1) {
					hiz -= 0.1;
				}
				tileri();
			} else if (yerde != 0) {
				hiz /= 10;
				if (Math.abs(hiz) < 0.1) {
					hiz = 0;
				}
				tileri();
			} else {

				tileri();
			}
			if (tdon == 1) {
				tsola();
			} else if (tdon == -1) {
				tsaga();
			}
			farealt.x = mouseX;
			farealt.y = mouseY;

			farekontrol();

			setChildIndex(farealt,0);

			for (var i=0; i<adet; i++) {
				for (var j=0; j<adet; j++) {

					var A = goz_z[0];
					var B = goz_z[1];
					var C = goz_z[2];
					var F = goz_n[0];
					var G = goz_n[1];
					var H = goz_n[2];
					var D = A * F + B * G + C * H;
					var x_3 = tahta[i][j][0];
					var y_3 = tahta[i][j][1];
					var z_3 = tahta[i][j][2];

					var uzaklik_1 = A * x_3 + B * y_3 + C * z_3 - D;
					var uzaklik_2 = Math.sqrt(A * A + B * B + C * C);
					var uzaklik = uzaklik_1 / uzaklik_2;
					if (uzaklik > 0) {
						tahta2[i][j][4] = 1;
					} else {
						tahta2[i][j][4] = 0;
					}
					var izdusum_x = x_3 - A * uzaklik;
					var izdusum_y = y_3 - B * uzaklik;
					var izdusum_z = z_3 - C * uzaklik;
					var izdusum_xfark = izdusum_x - F;
					var izdusum_yfark = izdusum_y - G;
					var izdusum_zfark = izdusum_z - H;
					var izdusum_uzaklik = Math.sqrt(izdusum_xfark * izdusum_xfark + izdusum_yfark * izdusum_yfark + izdusum_zfark * izdusum_zfark);

					var xfark=x_3 - goz_n[0];
					var yfark=y_3 - goz_n[1];
					var zfark=z_3 - goz_n[2];
					uzaklik = Math.sqrt(xfark * xfark + yfark * yfark + zfark * zfark);

					var x_2 = izdusum_xfark * goz_x[0] + izdusum_yfark * goz_x[1] + izdusum_zfark * goz_x[2];
					var y_2 = izdusum_xfark * goz_y[0] + izdusum_yfark * goz_y[1] + izdusum_zfark * goz_y[2];
					x_2 = x_2*1200/uzaklik;
					y_2 = y_2*1200/uzaklik;
					x_2 += 320;
					y_2 += 240;

					tahta2[i][j][2]= 1200-uzaklik;
					if (ilk == 1) {
						tahta2[i][j][0] = x_2;
						tahta2[i][j][1] = y_2;

					}
					tahta2[i][j][0] -= (tahta2[i][j][0]-x_2)/4;
					tahta2[i][j][1] -= (tahta2[i][j][1]-y_2)/4;


				}
			}
			ilk = 0;
			yerde = 0;


			nokta.n = goz_n;
			nokta.x_a = goz_x;
			nokta.y_a = goz_y;
			nokta.z_a = goz_z;

			for (var o=0; o<3; o++) {
				zayar(o);
			}
			gemi2.ciz();
			if (tmc1.z_3 > 80) {
				tmc1.x_3 = 0;
				tmc1.y_3 = 0;

				tmc2.x_3 = 2;
				tmc2.y_3 = 0;

				tmc3.x_3 = 0;
				tmc3.y_3 = 2;


				tmc1.z_3 = -20;
				tmc2.z_3 = -20;
				tmc3.z_3 = -20;
			}
			if (kolacik != 1 ) {
				goz_n = [tmc1.x_3 - (tmc2.x_3 -tmc1.x_3)*25,tmc1.y_3 - (tmc2.y_3 -tmc1.y_3)*25,tmc1.z_3-20];

				var v1 = [tmc2.x_3 - tmc1.x_3,tmc2.y_3 - tmc1.y_3, 0.4];

				var b2 = Math.sqrt( v1[0]*v1[0] + v1[1]*v1[1] + v1[2]*v1[2]);
				v1[0] /= b2;
				v1[1] /= b2;
				v1[2] /= b2;
				goz_z = v1;
				var v2 = [tmc3.x_3 - tmc1.x_3,tmc3.y_3 - tmc1.y_3, 0];
				b2 = Math.sqrt( v2[0]*v2[0] + v2[1]*v2[1] + v2[2]*v2[2] );
				v2[0] /= b2;
				v2[1] /= b2;
				v2[2] /= b2;
				goz_x = v2;
				//vektor3 = [vektor1[1]*vektor2[2] - vektor1[2]*vektor2[1], vektor1[2]*vektor2[0] - vektor1[0]*vektor2[2], vektor1[0]*vektor2[1] - vektor1[1]*vektor2[0] ];

				var v3 = [ v1[1]*v2[2] - v1[2]*v2[1], v1[2]*v2[0] - v1[0]*v2[2],v1[0]*v2[1] - v1[1]*v2[0] ];

				b2 = Math.sqrt( v3[0]*v3[0] + v3[1]*v3[1] + v3[2]*v3[2] );
				v3[0] /= b2;
				v3[1] /= b2;
				v3[2] /= b2;
				goz_y = v3;
			}
			//tmc.z_3 = z;
			setChildIndex(gemi2,1);
			kenarlar.sortOn("yakinlik",Array.NUMERIC);
			var atla = 0;
			for (i=0; i<kenarlar.length; i++) {
				if (kenarlar[i].cins == "kenar") {
					kenarlar[i].f3t2();
				}
				if (kenarlar[i] != getChildAt(i+1)) {
					setChildIndex(kenarlar[i],i+1);
				}
			}
		}
		function zayar(o) {

			var tmc = tmcs[o];
			tmc.f3t2();
			var tx = Math.floor(tmc.x_3/aralik) + adet/2;
			var ty = Math.floor(tmc.y_3/aralik) + adet/2;

			if (tx < adet-1 && tx >= 0 && ty >= 0 && ty < adet -1) {
				gemi.yakinlik = Math.max(tahta[tx][ty][3],tahta[tx][ty][4]) + 0.01;

				tahta2[tx+1][ty][3] = 0;
				tahta2[tx][ty+1][3] = 0;

				var tx2 = tmc.x_3 - Math.floor(tmc.x_3/aralik)*aralik;
				var ty2 = tmc.y_3 - Math.floor(tmc.y_3/aralik)*aralik;
				var zhedef = 0;

				var a ,d;
				var b = tahta[tx+1][ty][2];
				var c = tahta[tx][ty+1][2];
				var sol,sag;
				if (tx2 + ty2 > aralik) {

					tahta2[tx][ty][3] = 0;

					d = tahta[tx+1][ty+1][2];
					a = b - (d-c);

					if (o==0) {
						asd.text = "alt\n";
					}
				} else {

					tahta2[tx][ty][3] = 0;

					a = tahta[tx][ty][2];
					d = c + b-a;
					if (o==0) {
						asd.text = "ust\n";

					}
				}
				sol = a*(aralik-ty2) + c*ty2;
				sag = b*(aralik-ty2) + d*ty2;
				sol /= aralik;
				sag /= aralik;
				zhedef = sol*(aralik-tx2) + sag*tx2;
				zhedef /= aralik;

				if (o == 0) {

					asd.appendText( a + " " + b + "\n" + c + " " + d);
					asd.appendText( "\n" + tx2 + " " + ty2 +"\n" + zhedef);
					asd.appendText("\n" + tx + " " + ty);
				}
				tmc.zhedef = zhedef;
			} else {
				zhedef = 100;
				tmc.zhedef = 100;
			}
			if (tmc.z_3 < zhedef) {
				dushiz[o] += 0.03;
				tmc.z_3 += dushiz[o];
			} else {
				dushiz[o] = 0;
				tmc.z_3 = zhedef;
				yerde = 1;
			}
			if (Math.abs(tmc.z_3 - zhedef) < 0.1) {
				//tmc.z_3 = zhedef;

			}
		}
	}
}