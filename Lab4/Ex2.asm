LXI B,3FFFH
CALL SUBR1
MVI D,2FH
CALL SUBR2
HLT

// Accumulator'deki deger ile B'deki degeri, Flag Register'daki deger ile C'deki degeri takas yapan alt program
SUBR1:	   PUSH B // Yiginin en ustune BC saklayicilarindaki degerleri iter
	   PUSH PSW // Yiginin en ustune accumulator ve flag register'daki degerleri yazar
	   POP B // Yiginin en ustundeki bayrak degerleri C'ye accumulatordeki deger B'ye yazilarak yigindan cikarilir, en ustte artik BC saklayici ciftinin baslangictaki degerleri bulunuyor
	   POP PSW // Yiginin en ustundeki C saklayicisinin degerini bayrak saklayicisina, B saklayicisinin degerini accumulator'e yazarak bunlari yigindan cikarir
	   RET // Ana programa kalindigi yerden devam edilir


// Accumulator ve Bayrak Saklayicisi etkilenmeden D'deki degerin iki katini E'ye yazan alt program
SUBR2:	   PUSH PSW // A ve Flag yiginin en ustune itilir 
	   MOV A,D // D'deki deger A'ya yazilir
	   ADD D // A ile D toplanir, sonuc A'ya yazilir, yani D'deki degerin iki kati A'ya yazilir
	   MOV E,A // Bulunan sonuc E'ye yazilir
	   POP PSW // A ve Flag degerleri yiginin en ustunde duruyordu, bu degerler Accumulator ve Flag Register'a yeniden yazilir ve yigindan cikarilir, sonuc olarak A ve Flag degisiklige ugramamis olur
	   RET // Ana programa kalindigi yerden devam edilir
