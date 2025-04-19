#include <xc.inc>

CONFIG FOSC=XT
CONFIG WDTE=OFF
CONFIG PWRTE=ON
CONFIG BOREN=ON
CONFIG LVP=OFF
CONFIG CPD=OFF
CONFIG WRT=OFF
CONFIG CP=OFF

#define _XTAL_FREQ 4000000

; Defini��es de pinos
VERMELHO EQU 2
AMARELO  EQU 1
VERDE    EQU 0
CHAVE    EQU 0

; Vari�veis de atraso
TEMPO1   EQU 0x20
TEMPO2   EQU 0x21
TEMPO3   EQU 0x22
DELAY    EQU 0x23

PSECT code

INICIO:
    ; Configura RB0 como entrada
    BANKSEL TRISB
    MOVLW 0xFF
    MOVWF TRISB

    ; Configura PORTD como sa�da
    BANKSEL TRISD
    CLRF TRISD
    BANKSEL PORTD
    CLRF PORTD

    ; Define atraso inicial como "devagar"
    MOVLW 12
    MOVWF DELAY

    GOTO MAIN

MAIN:
    ; Verifica estado do bot�o RB0
    BANKSEL PORTB
    BTFSS PORTB, CHAVE       ; Se pressionado (RB0 = 1), pula
    GOTO BOTAO_PRESSIONADO   ; Se RB0 = 0 (solto), vai para r�pido

    ; Bot�o N�O pressionado ? atraso normal (3s)
    MOVLW 12
    MOVWF DELAY
    GOTO SEMAFO

BOTAO_PRESSIONADO:
    ; Bot�o pressionado ? atraso r�pido (~50us)
    MOVLW 1
    MOVWF DELAY

SEMAFO:
    ; VERMELHO
    BSF PORTD, VERMELHO
    MOVF DELAY, W
    CALL ATRASO
    BCF PORTD, VERMELHO

    ; VERDE
    BSF PORTD, VERDE
    MOVF DELAY, W
    CALL ATRASO
    BCF PORTD, VERDE

    ; AMARELO
    BSF PORTD, AMARELO
    MOVF DELAY, W
    CALL ATRASO
    BCF PORTD, AMARELO

    GOTO MAIN

; Sub-rotina de atraso
ATRASO:
    MOVWF TEMPO3
DL0:
    MOVLW 250
    MOVWF TEMPO2
DL1:
    MOVLW 250
    MOVWF TEMPO1
DL2:
    NOP
    NOP
    DECFSZ TEMPO1, F
    GOTO DL2
    DECFSZ TEMPO2, F
    GOTO DL1
    DECFSZ TEMPO3, F
    GOTO DL0
    RETURN

END