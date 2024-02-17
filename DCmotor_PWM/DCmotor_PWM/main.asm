;
; DCmotor_PWM.asm
;
; Created: 11/12/2023 8:28:16 AM
; Author : Options
;


; Replace with your application code
.ORG 0x00
MAIN:
LDI R16,HIGH(RAMEND)
OUT SPH,R16
LDI R16,LOW(RAMEND)
OUT SPL,R16

CBI DDRA,PA7
SBI DDRD,PD5

LDI R16,0x00
OUT TCNT1H,R16
OUT TCNT1L,R16
LDI R16,HIGH(0x05)
OUT OCR1AH,R16
LDI R16,LOW(0x05)
OUT OCR1AL,R16
LDI R16,HIGH(0x0A)
OUT ICR1H,R16
LDI R16,LOW(0x0A)
OUT ICR1L,R16
LDI R16,0x82
OUT TCCR1A,R16
LDI R16,0x11
OUT TCCR1B,R16

LDI R16,0x05

LOOP:
SBIS PINA,PA7
RJMP LOOP

CALL DELAY

SBIS PINA,PA7
RJMP LOOP

INC R16
CPI R16,0x0B
BRNE CHANGE_DUTY_CYCLE
LDI R16,0x05
CHANGE_DUTY_CYCLE:
OUT OCR1AL,R16

HERE:
SBIC PINA,PA7
RJMP HERE

RJMP LOOP

.ORG 0x100
DELAY:
LDI R18,0x1F
L1:
LDI R17,0xFF
L2:
DEC R17
BRNE L2
DEC R18
BRNE L1
RET