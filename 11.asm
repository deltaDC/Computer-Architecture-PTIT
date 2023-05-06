.model small
.stack 100
.data 
    str1    db "so lon nhat la: $"
    str2    db "so be nhat la: $"
    endl    db 13, 10, "$"
    arr     db 1, 5, 7, 8, 3, 9, 2, 4, 6
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;tim max
    mov cx, 9; ktao bien cx = 9 (count)
    lea si, arr; dua dchi cua arr vao si
    mov bl, [si]; dua gia tri si vao bl
    
FOR:  
    inc si
    mov al, [si]
    cmp bl, al; so sanh bl va al
    jge NEXT; nhay den next neu bl >= al
    mov bl, al; gan bl = al neu bl < al
    NEXT:
    loop FOR
    
    ;in str1
    mov ah, 9
    lea dx, str1
    int 21h
    
    ;in gia tri lon nhat cua arr
    add bl, '0'; chuyen bl sang dang chuoi
    mov dl, bl; dua gia tri tu bl sang dl
    mov ah, 2; lenh ngat 2 in ra 1 ki tu
    int 21h
    
    
    ;in dau xuong dong
    lea dx, endl
    mov ah, 9
    int 21h
    
    
    
    ;tim gtri min
    mov cx, 9; ktao bien cx = 9 (count)
    lea si, arr; dua dchi cua arr vao si
    mov bl, [si]; dua gia tri si vao bl
    
FOR2:  
    inc si
    mov al, [si]
    cmp bl, al; so sanh bl va al
    jle NEXT2; nhay den next neu bl >= al
    mov bl, al; gan bl = al neu bl < al
    NEXT2:
    loop FOR2
    
    ;in str1
    mov ah, 9
    lea dx, str2
    int 21h
    
    ;in gia tri lon nhat cua arr
    add bl, '0'; chuyen bl sang dang chuoi
    mov dl, bl; dua gia tri tu bl sang dl
    mov ah, 2; lenh ngat 2 in ra 1 ki tu
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end
