;
; DCmotor.asm
;
; Created: 11/11/2023 11:32:16 AM
; Author : Options
;


; Replace with your application code

.ORG 0x00
MAIN:
CBI DDRA,PA7
LDI R16,0x0F
OUT DDRC,R16

LOOP:
SBIC PINA,PA7
RJMP ROTATE_ANTI_CLOCKWISE
SBI PORTC,PC0
SBI PORTC,PC3
CBI PORTC,PC1
CBI PORTC,PC2
RJMP LOOP
ROTATE_ANTI_CLOCKWISE:
CBI PORTC,PC0
CBI PORTC,PC3
SBI PORTC,PC1
SBI PORTC,PC2
RJMP LOOP