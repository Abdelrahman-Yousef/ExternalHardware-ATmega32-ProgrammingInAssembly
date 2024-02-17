;
; DAC.asm
;
; Created: 9/29/2023 4:56:13 PM
; Author : Options
;


; Replace with your application code

.INCLUDE "m32def.inc"

.ORG 0x00
MAIN:
LDI R16,0xFF
OUT DDRC,R16

LOOP:
INC R16
OUT PORTC,R16
NOP
NOP
NOP
NOP
NOP
RJMP LOOP
