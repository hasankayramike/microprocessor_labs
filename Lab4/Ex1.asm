LXI B,01FFH // B ve C saklayicilarina 01 ve FF degerleri atandi
PUSH B // BC saklayici cifti yiginin tepesine itildi
POP PSW // Yiginin tepesine ittirilen FF degeri bayrak saklayicisina, 01 degeri de accumulatore gonderilerek bu degerler yigindan cikarildi
HLT // Program sonu