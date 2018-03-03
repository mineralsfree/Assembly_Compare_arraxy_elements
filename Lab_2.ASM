org 100h
Hello:          ; Output Greatings
    mov ah,09h
    mov dx,HelloString;
    int 21h

show_arr:
    mov si, 0h
    mov cx, 11
.show:
    mov ah, 02h
    mov dl,[arr+si]
    add dl,48
    int 21h
    inc si
    mov ah, 02h
    mov dx, 32
    int 21h
    loop show_arr.show

    mov ah,09h
    mov dx,EnterVal
    int 21h
 Count_Fives:
        mov si, 0
        mov bx, 0
        mov cx, 11
 .loop:
        cmp dl,0
        mov dl, [arr+si]
        inc si
        cmp dl,5
        jnbe Count_Fives.increment

        loop Count_Fives.loop
        jmp Exit
.increment:
        inc bx
        loop Count_Fives.loop

Exit:
    mov cx, bx
    mov bx, 0
    add bx, OutputStr+10
    add cx, 48
    mov byte[bx], cl
    mov ah, 09h
    mov dx, OutputStr
    int 21h
    mov ah,08h
    int 21h
    ret


HelloString:
        db 'Calculating fives in preassigned array',10,13,'Stock array:$'
arr: db 4,4,2,5,4,5,8,5,7,4,5
OutputStr: db 'There are   elements, higher then 5 $'
EnterVal: db 10,13,'$'
