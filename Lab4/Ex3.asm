// birinci adim
BASLANGIC:	   MVI A,00
	   OUT 03
	   OUT 05
	   MVI A,41
	   OUT 01
	   OUT 04
	   MVI B,14 // 20 kere 1snlik gecikme
	   CALL SUBRT1
// ikinci adim
	   MVI A,00
	   OUT 01
	   OUT 04
	   MVI A,84
	   OUT 02
	   OUT 05
	   MVI B,05 // 5 kere 1 snlik gecikme
	   CALL SUBRT1


// ucuncu adim
	   MVI A,00
	   OUT 02
	   MVI A,90
	   OUT 03
	   OUT 05
	   MVI B,0F // 15 kere 1 snlik gecikme
	   CALL SUBRT1 
	   JMP BASLANGIC // baslangic adimina geri don


// 0,9999996 snlik delay B saklayicisindaki deger kadar tekrar eder
SUBRT1:	   LXI D,DDF2 // Decimal 56818 degeri DE'ye atanir 10 t-state

DELAY:	   DCX D // DE 1 azaltilir, 6 t-state
	   
	   // 7 tane NOP = 28 t-state
	   NOP
	   NOP
	   NOP
	   NOP
	   NOP
	   NOP
	   NOP
	   JNZ DELAY // atlamada 10, bitiste 7 t-state
	   DCR B
	   JNZ SUBRT1
	   RET


// delay hesabi
// [10 + (6+28+10)*56818 - 3]*0,4*10^-6 = yaklasik 1