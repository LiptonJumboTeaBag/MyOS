;boot sector code
[org 0x7c00]
mov bx, msg
call print_string
mov dx, msg
call print_hex


jmp $

msg:
  db "Hello world!", 0
hex_msg:
  db 0xA1, 0xA1 , 0

%include "print_string.asm"
%include "print_hex.asm"
; Bootsector padding
times 510 -( $ - $$ ) db 0 ; $ is the current memory address and $$ is the start of the file
dw 0xaa55 ; boot sector signature