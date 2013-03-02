function x_don(don_hiz) {
	var yeni_x=100 * goz_z[0] + don_hiz * goz_x[0];
	var yeni_y=100 * goz_z[1] + don_hiz * goz_x[1];
	var yeni_z=100 * goz_z[2] + don_hiz * goz_x[2];
	var uzunluk=Math.sqrt(yeni_x * yeni_x + yeni_y * yeni_y + yeni_z * yeni_z);
	yeni_x=yeni_x / uzunluk;
	yeni_y=yeni_y / uzunluk;
	yeni_z=yeni_z / uzunluk;
	var a=yeni_x;
	var b=yeni_y;
	var c=yeni_z;
	yeni_x=100 * goz_x[0] - don_hiz * goz_z[0];
	yeni_y=100 * goz_x[1] - don_hiz * goz_z[1];
	yeni_z=100 * goz_x[2] - don_hiz * goz_z[2];
	uzunluk=Math.sqrt(yeni_x * yeni_x + yeni_y * yeni_y + yeni_z * yeni_z);
	yeni_x=yeni_x / uzunluk;
	yeni_y=yeni_y / uzunluk;
	yeni_z=yeni_z / uzunluk;
	goz_z[0]=a;
	goz_z[1]=b;
	goz_z[2]=c;
	goz_x[0]=yeni_x;
	goz_x[1]=yeni_y;
	goz_x[2]=yeni_z;
}
function y_don(don_hiz) {
	var yeni_x=100 * goz_z[0] + don_hiz * goz_y[0];
	var yeni_y=100 * goz_z[1] + don_hiz * goz_y[1];
	var yeni_z=100 * goz_z[2] + don_hiz * goz_y[2];
	var uzunluk=Math.sqrt(yeni_x * yeni_x + yeni_y * yeni_y + yeni_z * yeni_z);
	yeni_x=yeni_x / uzunluk;
	yeni_y=yeni_y / uzunluk;
	yeni_z=yeni_z / uzunluk;
	var a=yeni_x;
	var b=yeni_y;
	var c=yeni_z;
	yeni_x=100 * goz_y[0] - don_hiz * goz_z[0];
	yeni_y=100 * goz_y[1] - don_hiz * goz_z[1];
	yeni_z=100 * goz_y[2] - don_hiz * goz_z[2];
	uzunluk=Math.sqrt(yeni_x * yeni_x + yeni_y * yeni_y + yeni_z * yeni_z);
	yeni_x=yeni_x / uzunluk;
	yeni_y=yeni_y / uzunluk;
	yeni_z=yeni_z / uzunluk;
	goz_z[0]=a;
	goz_z[1]=b;
	goz_z[2]=c;
	goz_y[0]=yeni_x;
	goz_y[1]=yeni_y;
	goz_y[2]=yeni_z;
}
function ileri(hiz) {
	goz_n[0]=goz_n[0] - hiz * goz_z[0];
	goz_n[1]=goz_n[1] - hiz * goz_z[1];
	goz_n[2]=goz_n[2] - hiz * goz_z[2];
}
function yukari(hiz) {
	goz_n[0]=goz_n[0] - hiz * goz_y[0];
	goz_n[1]=goz_n[1] - hiz * goz_y[1];
	goz_n[2]=goz_n[2] - hiz * goz_y[2];
}
function sola(hiz) {
	goz_n[0]=goz_n[0] - hiz * goz_x[0];
	goz_n[1]=goz_n[1] - hiz * goz_x[1];
	goz_n[2]=goz_n[2] - hiz * goz_x[2];
}

function tileri() {
	var farkx = (tmc2.x_3 - tmc1.x_3)*hiz/2;
	var farky = (tmc2.y_3 - tmc1.y_3)*hiz/2;
	var farkz = (tmc2.z_3 - tmc1.zhedef)*hiz/40;
	if (farkz < -1) {
		farkz = -1;
	}
	for (var o=0; o<3; o++) {
		var tmc = tmcs[o];
		tmc.x_3 += farkx;
		tmc.y_3 += farky;
		tmc.z_3 += farkz;
		zayar(o);
	}
	gemi2.ciz();

}


function tsaga() {
	var yeni_x = tmc2.x_3 - tmc1.x_3 + (tmc3.x_3 - tmc1.x_3)/10;
	var yeni_y = tmc2.y_3 - tmc1.y_3 + (tmc3.y_3 - tmc1.y_3)/10;
	var uz = Math.sqrt(yeni_x*yeni_x + yeni_y*yeni_y)/2;
	yeni_x /= uz;
	yeni_y /= uz;

	var a = yeni_x;
	var b = yeni_y;


	yeni_x = tmc3.x_3 - tmc1.x_3 - (tmc2.x_3 - tmc1.x_3)/10;
	yeni_y = tmc3.y_3 - tmc1.y_3 - (tmc2.y_3 - tmc1.y_3)/10;
	uz = Math.sqrt(yeni_x*yeni_x + yeni_y*yeni_y)/2;
	yeni_x /= uz;
	yeni_y /= uz;

	tmc2.x_3 = a + tmc1.x_3;
	tmc2.y_3 = b + tmc1.y_3;
	tmc3.x_3 = yeni_x + tmc1.x_3;
	tmc3.y_3 = yeni_y + tmc1.y_3;
}

function tsola() {

	var yeni_x = tmc2.x_3 - tmc1.x_3 -(tmc3.x_3 - tmc1.x_3)/10;
	var yeni_y = tmc2.y_3 - tmc1.y_3 -(tmc3.y_3 - tmc1.y_3)/10;
	var uz = Math.sqrt(yeni_x*yeni_x + yeni_y*yeni_y)/2;
	yeni_x /= uz;
	yeni_y /= uz;

	var a = yeni_x;
	var b = yeni_y;


	yeni_x = tmc3.x_3 - tmc1.x_3 + (tmc2.x_3 - tmc1.x_3)/10;
	yeni_y = tmc3.y_3 - tmc1.y_3 + (tmc2.y_3 - tmc1.y_3)/10;
	uz = Math.sqrt(yeni_x*yeni_x + yeni_y*yeni_y)/2;
	yeni_x /= uz;
	yeni_y /= uz;

	tmc2.x_3 = a + tmc1.x_3;
	tmc2.y_3 = b + tmc1.y_3;
	tmc3.x_3 = yeni_x + tmc1.x_3;
	tmc3.y_3 = yeni_y + tmc1.y_3;
}


function cevir(cevir_hiz) {
	var yeni_x=100 * goz_x[0] - cevir_hiz * goz_y[0];
	var yeni_y=100 * goz_x[1] - cevir_hiz * goz_y[1];
	var yeni_z=100 * goz_x[2] - cevir_hiz * goz_y[2];

	var uzunluk=Math.sqrt(yeni_x * yeni_x + yeni_y * yeni_y + yeni_z * yeni_z);

	yeni_x=yeni_x / uzunluk;
	yeni_y=yeni_y / uzunluk;
	yeni_z=yeni_z / uzunluk;
	var a=yeni_x;
	var b=yeni_y;
	var c=yeni_z;
	yeni_x=100 * goz_y[0] + cevir_hiz * goz_x[0];
	yeni_y=100 * goz_y[1] + cevir_hiz * goz_x[1];
	yeni_z=100 * goz_y[2] + cevir_hiz * goz_x[2];
	uzunluk=Math.sqrt(yeni_x * yeni_x + yeni_y * yeni_y + yeni_z * yeni_z);
	yeni_x=yeni_x / uzunluk;
	yeni_y=yeni_y / uzunluk;
	yeni_z=yeni_z / uzunluk;
	goz_x[0]=a;
	goz_x[1]=b;
	goz_x[2]=c;
	goz_y[0]=yeni_x;
	goz_y[1]=yeni_y;
	goz_y[2]=yeni_z;
}

function farekontrol() {

	if (kolacik == 1) {
		var m_x = farekol.ic.mouseX;
		var m_y = farekol.ic.mouseY;
		var uz = Math.sqrt(m_x*m_x + m_y*m_y);
		if (uz > 40) {
			m_x /= uz/40;
			m_y /= uz/40;
			uz=40;
		}
		if (uz > 5) {
			farekol.ic.cubuk.scaleX = uz/40;
		} else {
			farekol.ic.cubuk.scaleX = 0;
		}
		farekol.ic.cubuk.rotation = Math.atan2(m_y,m_x)*180/Math.PI;
		x_don(m_x*Math.pow(Math.abs(m_x),0.5)/70);
		y_don(m_y*Math.pow(Math.abs(m_y),0.5)/70);
		farekol.ic.kol.x = m_x;
		farekol.ic.kol.y = m_y;
	}
	var don_hiz;
	if (x_git != 0) {
		sola(x_git * 5);
	}
	if (y_git != 0) {
		yukari(y_git * 5);
	}
	if (z_git != 0) {
		ileri(z_git * 5);
	}
	if (cevir_yon != 0) {
		cevir(cevir_yon * 5);
	}
	/*if (mouseX < 120 || mouseX > 880) {
	if (mouseX < 120) {
	
	don_hiz=mouseX - 120;
	} else {
	don_hiz=mouseX - 880;
	}
	don_hiz/= 40;
	x_don(don_hiz);
	}
	if (mouseY < 120 || mouseY > 530) {
	if (mouseY < 120) {
	
	don_hiz=mouseY - 120;
	} else {
	don_hiz=mouseY - 530;
	}
	don_hiz/= 40;
	y_don(don_hiz);
	}*/

}
function keypress(e:KeyboardEvent):void {

	if (e.keyCode == 37) {
		tdon = 1;
	}
	if (e.keyCode == 39) {
		tdon = -1;
	}
	if (e.keyCode == 38) {
		tilerle = 1;
	}
	if (e.keyCode == 40) {
		tilerle = -1;
	}
	if (e.keyCode == 82) {
		z_git=-1;
	} else if (e.keyCode == 70) {
		z_git=1;
	}
	if (e.keyCode == 87) {
		y_git=1;
	} else if (e.keyCode == 83) {
		y_git=-1;
	}
	if (e.keyCode == 68) {
		x_git=-1;
	} else if (e.keyCode == 65) {
		x_git=1;
	}
	if (e.keyCode == 81) {
		cevir_yon=-1;
	} else if (e.keyCode == 69) {
		cevir_yon=1;
	}

}
function keyrelease(e:KeyboardEvent):void {
	if (e.keyCode == 37) {
		tdon = 0;
	}
	if (e.keyCode == 39) {
		tdon = 0;
	}
	if (e.keyCode == 38) {
		tilerle = 0;
	}
	if (e.keyCode == 40) {
		tilerle = 0;
	}
	if (e.keyCode == 32) {
		trace("var goz_n = [" + goz_n + "]");
		trace("var goz_x = [" + goz_x + "]");
		trace("var goz_y = [" + goz_y + "]");
		trace("var goz_z = [" + goz_z + "]");
	}
	if (e.keyCode == 82 || e.keyCode == 70) {
		z_git=0;
	}
	if (e.keyCode == 87 || e.keyCode == 83) {
		y_git=0;
	}
	if (e.keyCode == 68 || e.keyCode == 65) {
		x_git=0;
	}
	if (e.keyCode == 81 || e.keyCode == 69) {
		cevir_yon=0;
	}
}