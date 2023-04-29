.model small
.stack 100
.data
    str1    db  "Nhap vao 1 chuoi: $"
    str2    db  10, 13, "Chieu dai chuoi la: $"
    s   db  100 dup("$")
.code
main proc
    mov ax, @data
    mov ds, ax ; khoi tao thanh ghi ds  
    
    ;in str1
    mov ah, 9
    lea dx, str1
    int 21h
    
    ; nhap xau s
    mov ah, 10
    lea dx, s
    int 21h
    
    ;in str2
    mov ah, 9
    lea dx, str2
    int 21h
    
    ;tinh chieu dai chuoi
    mov ax, 0
    mov al, s + 1; dua chieu dai chuoi vao al (dang chuoi)
    mov cx, 0; ktao bien dem cx = 0
    mov bx, 10; ktao so chia bx = 10
    ;day cac ptu vao stack
    Lap1:
        mov dx, 0; ktao dx = 0, so du luu o dx
        div bx; chia cho 10
        push dx; lay dx la phan du day vao stack
        inc cx
        cmp ax, 0; so sanh ax voi 0, neu != 0 tiep tuc lap
        jnz Lap1
    mov ah, 2
    ;in cac ptu trong stack
    Lap2:
        pop dx; lay ptu o dinh stack
        add dx, '0'; chuyen sang ki tu
        int 21h
        loop Lap2
main endp
end