!--------------------------------------------------
!- Tuesday, July 21, 2020 12:49:10 PM
!- Import of : 
!- c:\users\birtj\onedrive\vintage computers\c64\hardware projects\mos 8701 replacement\test program\pb6-10hz.prg
!- Commodore 64
!--------------------------------------------------
10 CIA = 56576
20 DB = CIA +3
30 TL = CIA + 4
40 TH = CIA + 5
50 ICR = CIA + 13
60 CA = CIA + 14
70 POKE DB, 240
80 POKE ICR, 127
90 POKE TL, 56
100 POKE TH, 199
110 POKE CA, 4 + 2 + 1
