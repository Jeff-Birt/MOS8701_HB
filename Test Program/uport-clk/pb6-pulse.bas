!--------------------------------------------------
!- Test program for MOS8701_HB replacement
!- Sets up CIA to pulse PB6 on User port, wired to
!- MOSFET circuit swiching in dummy load. 50-250ma
!- swtiching loads on the uport may cause 5V dips
!- which can cause clock stability issues
!- Commodore 64 or C128
!--------------------------------------------------
10 CIA = 56576  : REM CIA base adress
20 DB  = CIA+3  : REM DDRB
30 TL  = CIA+4  : REM TMRA LB
40 TH  = CIA+5  : REM TMRA HB
50 ICR = CIA+13 : REM Int Ctrl Reg
60 CA  = CIA+14 : REM Cntrl Reg A
70 HB = 0       : REM High byte of timer
80 LB = 0       : REM Low byte of timer
90 H = 100      : REM Start at 100hz
100 CLK = 1020000: REM NTSC, 986000 for PAL
110 REM Start up code
120 GOSUB 260
130 H = INT((1/(256*HB+LB) * CLK)/2)
140 PRINT CHR$(147) :REM CLR screen
150 POKE 53272,23: REM upper/lower case
160 PRINT "User Port PB6 Pulser"
170 PRINT "Running at "; :PRINT H; : PRINT "hz"
180 PRINT " "
190 PRINT "Input # between 10-500000"
200 INPUT "Input new HZ"; H
210 IF H<10 OR H>500000 THEN 200
220 GOSUB 260
230 GOTO 200
240 REM Subroutine to calculate high/low timer presets
250 REM and to presset timer and start
260 T=(CLK/H)/2 : REM timer delay is 1/2 cycle
270 HB = INT(T/256)
280 LB = T-HB*256
290 POKE DB,240  : REM DSet DDR
300 POKE ICR,127 : REM Disable intrupts
310 POKE TL, LB  : REM Set TMRA LB
320 POKE TH,HB   : REM Set TMRA HB
330 POKE CA, 7   : REM Set mode, start
340 RETURN