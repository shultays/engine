
package uzay{
	import flash.events.MouseEvent;
	public class nokta extends nokta_link {
		var ilk = 1;
		public var x_3=Math.random() * 1300 - 750;
		public var y_3=Math.random() * 1000 - 500;
		public var z_3=Math.random() * 1000 - 500;
		var uzaklik = 0;
		public var yakinlik = 0;
		public var cins = "nokta";
		public var ozel =  0;
		public var unlem = null;
		public var zhedef;
		public static var n,x_a,y_a,z_a;
		public function nokta(...rest) {
			if (rest.length>1) {
				x_3 = rest[1];
				y_3 = rest[2];
				z_3 = rest[3];

				//cizme = 1;
			}
			gotoAndStop(2);
			x=Math.random() * 100 + 100;
			y=Math.random() * 100 + 100;
			visible = false;
			//buttonMode = true;

		}
		public function f3t2() {
			
			var A = z_a[0];
			var B = z_a[1];
			var C = z_a[2];
			var F = n[0];
			var G = n[1];
			var H = n[2];
			var D = A * F + B * G + C * H;

			var uzaklik_1 = A * x_3 + B * y_3 + C * z_3 - D;
			var uzaklik_2 = Math.sqrt(A * A + B * B + C * C);
			uzaklik = uzaklik_1 / uzaklik_2;
			
			
			var izdusum_x = x_3 - A * uzaklik;
			var izdusum_y = y_3 - B * uzaklik;
			var izdusum_z = z_3 - C * uzaklik;
			var izdusum_xfark = izdusum_x - F;
			var izdusum_yfark = izdusum_y - G;
			var izdusum_zfark = izdusum_z - H;
			var izdusum_uzaklik = Math.sqrt(izdusum_xfark * izdusum_xfark + izdusum_yfark * izdusum_yfark + izdusum_zfark * izdusum_zfark);

			var xfark=x_3 - n[0];
			var yfark=y_3 - n[1];
			var zfark=z_3 - n[2];
			uzaklik = Math.sqrt(xfark * xfark + yfark * yfark + zfark * zfark);

			var x_2 = izdusum_xfark * x_a[0] + izdusum_yfark * x_a[1] + izdusum_zfark * x_a[2];
			var y_2 = izdusum_xfark * y_a[0] + izdusum_yfark * y_a[1] + izdusum_zfark * y_a[2];
			x_2 = x_2*1200/uzaklik;
			y_2 = y_2*1200/uzaklik;
			x_2 += 320;
			y_2 += 240;
			
			yakinlik = 1200-uzaklik;

			if (ilk == 1) {
				x = x_2;
				y = y_2;
				ilk = 0;
			}
			x -= (x-x_2)/4;
			y -= (y-y_2)/4;			
			width = 10;
			height=10;
		}
	}
}