;boot sector code
[org 0x7c00]
mov bx, msg
call print_string
msg:
  db "Hello world!", 0

jmp $

%include "print_string.asm"
; Bootsector padding
times 510 -( $ - $$ ) db 0 ; $ is the current memory address and $$ is the start of the file
dw 0xaa55 ; boot sector signature