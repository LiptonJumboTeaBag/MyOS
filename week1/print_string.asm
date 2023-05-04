print_string:
;bx is the input parameter with the address to the string
    pusha
    ;TODO: using the BIOS teletype routine, print out the string
    ;located at the address stored in bx stopping at the null
    ;terminating byte
    print_char:
        mov ah, 0eh ; Tells BIOS to print in teletype mode
        mov al, [bx]
        int 10h
        inc bx
        test al, al
        jnz print_char

    popa
    ret