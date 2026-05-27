; Group Project - Bubble Sort
; step 1 input
; step 2 store input
; step 3 sort input
; step 4 display input
.ORIG x3000
LEA R0, START	; user prompt
PUTS
AND R0, R0, x0	; print new line
ADD R0, R0, #10
OUT
; Clear registers
AND R0, R0, x0	; Used for printing
AND R1, R1, x0	; 
AND R2, R2, x0
AND R3, R3, x0
AND R4, R4, x0	; array pointer
AND R5, R5, x0	; digit stack pointer
LD R6, STACK
LEA R4, ARRAY

JSR GET_INPUT
JSR SORT
JSR DISPLAY
HALT	; end of program


ARRAY .BLKW #8
START .STRINGZ "Please input 8 medical readings from 0-100, pressing enter when done with a submission"
TRY_AGAIN .STRINGZ "INVALID INPUT - Please input a value from 0-100"
STACK .FILL x4000
NEW_LINE .FILL x0A
ASCII .FILL x30
DIGIT_STACK .FILL x3900
ASCII_PTR .FILL ASCII	; use ptr since data too far
NEW_LINE_PTR .FILL NEW_LINE
HUNDRED .FILL #100
ARRAY_PTR .FILL ARRAY
COMMA .FILL x2C
COMMA_PTR .FILL COMMA
SPACE .FILL x20
SPACE_PTR .FILL SPACE
GET_INPUT
ADD R6, R6, #-1	; Push Registers
STR R7, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0

ADD R1, R1, #8	; set up values
ADD R2, R2, #15	; invert ASCII
ADD R2, R2, #15
ADD R2, R2, #15
ADD R2, R2, #3
NOT R2, R2
ADD R2, R2, #1	; negative ASCII ('0') to check if below
LD R3, ASCII_PTR
STR R2, R3, #0
AND R3, R3, x0	; clear R3 for next value
ADD R3, R3, x0A	; invert new line
NOT R3, R3
ADD R3, R3, #1	; negative new line to check if done with input
LD R2, NEW_LINE_PTR
STR R3, R2, #0
AND R2, R2, x0	; clear R2 just in case

LOOP_EIGHT	; 8 inputs 8 loops
	LD R7, NEW_LINE_PTR
	LDR R3, R7, #0; Load values
	LD R7, ASCII_PTR
	LDR R2, R7, #0
	GETC
	OUT
	ADD R3, R3, R0
	BRnp CHECK_RANGE; If enter key add FINAL value to array
	
	LD R3, HUNDRED	; FINAL CHECK to ensure the value inputted is less than 100
	NOT R3, R3	
	ADD R3, R3, #1
	ADD R3, R5, R3
	BRp INVALID
	
	STR R5, R4, #0
	ADD R4, R4, #1
	AND R5, R5, x0
	BR ITERATE
	
	CHECK_RANGE
	ADD R2, R2, R0	; convert to binary
	BRn INVALID	; less than ten try again
	ADD R2, R2, #-10
	BRzp INVALID	; >= ten try again
	ADD R2, R2, #10	; reset value
	AND R3, R3, x0	; Multiplying running total by ten
	ADD R3, R5, R5	; R3 = R5*2	
	ADD R5, R3, R3	; R5 = R5*4
	ADD R5, R5, R5	; R5 = R5*8
	ADD R5, R5, R3	; R5 = R5*10
	ADD R5, R5, R2	; R5 = Current total
	BR LOOP_EIGHT
	
	INVALID
	LEA R0, TRY_AGAIN
	PUTS
	AND R0, R0, x0	; print new line
	ADD R0, R0, #10
	OUT
	AND R5, R5, x0	clear 
	BR LOOP_EIGHT
	
	ITERATE
	ADD R1, R1, #-1
	BRp LOOP_EIGHT
LDR R5, R6, #0	; Pop Registers
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1
RET	; subroutine finished

SORT
ADD R6, R6, #-1	; Push Registers
STR R7, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
ADD R6, R6, #-1
STR R2, R6, #0
ADD R6, R6, #-1
STR R3, R6, #0
ADD R6, R6, #-1
STR R4, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0

ADD R1, R1, #7	; 8 readings, 7 loops
BUBBLE_LOOP	; outer loop
	LEA R4, ARRAY		; Reset ARRAY pointer for next pass
	AND R2, R2, x0		; Sets R2 to i-1
	ADD R2, R1, #0		; R2 will always be less than R1 since R1 decrements	
	INNER_LOOP		; Inner Loop
		LDR R3, R4, #0	; Load ARRAY[j]
		LDR R5, R4, #1	; Load ARRAY[J+1]
		NOT R0, R5
		ADD R0, R0, #1	; negative to compare
		ADD R0, R3, R0
		BRnz NOTHING	; if negative just increment pointer
		STR R5, R4, #0	; swap values
		STR R3, R4, #1
		NOTHING
		ADD R4, R4, #1	; J++
		ADD R2, R2, #-1	; and decrement loop
	BRp INNER_LOOP
	ADD R1, R1, #-1		; decrement i
BRp BUBBLE_LOOP

LDR R5, R6, #0	; Pop Registers
ADD R6, R6, #1
LDR R4, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
LDR R2, R6, #0
ADD R6, R6, #1
LDR R1, R6, #0
ADD R6, R6, #1
LDR R7, R6, #0
ADD R6, R6, #1
RET

DISPLAY
ADD R6, R6, #-1	; Push Registers
STR R7, R6, #0
LD R4, ARRAY_PTR
AND R1, R1, x0
ADD R1, R1, #8	; 8 values to print, but for formatting commas the last one has to be printed alone
OUTPUT_LOOP	; will until all values printed
	LD R5, DIGIT_STACK	; Reset DIGIT_STACK
	AND R7, R7, x0		; Reset digit count
	LDR R2, R4, #0		; Load current array value
	AND R3, R3, x0		; reset quotient 
	FIND_REM_QUOTIENT	; subtract by 10 until the remainder
	ADD R2, R2, #-10
	BRn PUSH		; If negative, push remainder to DIGIT_STACK
	ADD R3, R3, #1		; Increment when subtraction is successful
	BR FIND_REM_QUOTIENT	; Loop until conditions allow for PRINT
	
	PUSH			; Values are added to stack and set up for next quotient
	ADD R2, R2, #10		; Get back remainder
	ADD R5, R5, #-1		; Push to stack
	STR R2, R5, #0
	ADD R2, R3, #0		; Quotient is used instead of origonal value
	AND R3, R3, x0		; Quotient is reset for future quotient
	ADD R7, R7, #1		; keeps track of # of digits for PRINT

	ADD R2, R2, #0		; this should ensure that a solo zero can be printed
	BRz PRINT		; If quotient is zero print
	BR FIND_REM_QUOTIENT
	
	PRINT			; Pop values off stack then print
	LD R2, ASCII_PTR	; R2 will convert -ASCII back to ASCII
	LDR R2, R2, #0
	NOT R2, R2
	ADD R2, R2, #1		; while inefficient I couldn't find a better way to do it
	
	LDR R0, R5, #0 		; Load from DIGIT_STACK pointer
	ADD R5, R5, #1		; increment pointer to get to next digit in stack
	ADD R0, R0, R2		; convert to ASCII
	ADD R6, R6, #-1		; temp stack
	STR R7, R6, #0
	OUT			; print character
	LDR R7, R6, #0		; load from temp stack
	ADD R6, R6, #1
	ADD R7, R7, #-1		; decrement digit counter
	BRp PRINT
	
	ADD R2, R1, #-1		; If R1 is on its final loop don't format 
	BRnz SKIP_FORMAT
	LD R0, COMMA		; Print comma
	OUT
	LD R0, SPACE		; Print space
	OUT
	SKIP_FORMAT
	ADD R4, R4, #1	; go to next value in array
	ADD R1, R1, #-1	; decrement to keep track of values
	BRp OUTPUT_LOOP	; R1=0 when all values printed
LDR R7, R6, #0	; Pop Registers
ADD R6, R6, #1
RET
.END