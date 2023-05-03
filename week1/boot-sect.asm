;TODO: add your boot sector code here.
mov cx, 0x7c00

print_string:
  mov ah, 0eh ; Tells BIOS to print in teletype mode
  mov si, msg
  add si, cx
  inc cx
  mov al, [si]
  int 10h
  test al, al
  jnz print_string
  jmp $

msg:
  db "Hello world!", 0h

; Bootsector padding
jmp print_string
times 510 -( $ - $$ ) db 0 ; $ is the current memory address and $$ is the start of the file
dw 0xaa55 ; boot sector signature