print_hex: ;dx is parameter
  pusha
  ;TODO: implement a function that takes in value of dx
  ;and modify the string located at HEX_OUT to be the hex
  ;value. Then print out HEX_OUT.
  mov bx, HEX_OUT
  mov di, dx
  mov cl, 4;
  
  get_hex:
    mov ah, 0eh ; Tells BIOS to print in teletype mode
    ; get first byte
    mov al, 0xF
    shl al, cl
    and al, [di]
    shr al, cl
    jmp put_byte
  cont: 
    xor cl, 0x4
    test cl, cl
    jz get_hex

    mov al, [di]
    inc di
    test al, al
    jnz get_hex

  mov byte [bx], 0
  mov bx, HEX_OUT
  call print_string

  popa
  ret

put_byte:
  cmp al, 9
  jle put_number
  add al, 7
put_number:
  add al, 0x30
  mov [bx], al
  inc bx
  jmp cont
HEX_OUT: db '0x0000', 0