format ELF64 executable 3

segment readable executable

entry SEXY

; Печатаю строку в цикле со счетчиком. Шаг счетчика задачется через сегмент 
; данных
SEXY:
	;mov  rax, 14                                  ; put length of msg into rax
	;mov  rdx, rax                                 ; move rax to rdx
    mov rcx, 30
_loop:
    ;dec rcx
    push rdi
    ;lea rdi, dword [DECR]
    lea rdi, [DECR]
    sub rcx, rdi
    pop rdi

    push rcx

    mov rdx, 14

	lea  rdi, [msg]                               ; address of msg goes into rdi
	mov  rsi, rdi                                 ; move rdi to rsi

	mov  rdi, 1                                   ; stdout
	mov  rax, 1                                   ; sys_write
	syscall

    pop rcx

    ; [базовый префикс сравнения][знаковость][операнд]
    ;cmp rcx, 0

    push rdi
    lea rdi, [NUM]

    ;dec dword [rdi]

    cmp rcx, [rdi]
    pop rdi

    jne _loop
    ;je _loop

	xor  rdi, rdi                                 ; exit code 0
	mov  rax, 60                                  ; sys_exit
	syscall

segment readable writable

msg2  db "HI", 10, 0
msg   db 'Hello world!', 10, 0
NUM   dw  0
DECR   dw  2
