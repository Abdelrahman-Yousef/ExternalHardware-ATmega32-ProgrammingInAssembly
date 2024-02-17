;
; DCmotor_Optoisolator.asm
;
; Created: 11/11/2023 3:49:31 PM
; Author : Options
;


; Replace with your application code
.ORG 0x00
MAIN:
CBI DDRA,PA7
SBI DDRC,PC0

LOOP:
SBIC PINA,PA7
RJMP STOP
SBI PORTC,PC0
RJMP LOOP
STOP:
CBI PORTC,PC0
RJMP LOOP
