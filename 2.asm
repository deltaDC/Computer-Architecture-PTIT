.model small
.stack 100
.data
    str1    DB  "Nhap mot ki tu: $"
    str2    DB  13, 10, "Ky tu da nhap la: $"
    char    DB  ?   ;luu ky tu da nhap
.code
main proc
    mov ax, @data
    mov ds, ax   
    
    ;in str1
    mov ah, 9; ham ngat 9 de in string
    lea dx, str1
    int 21h
    
    ;nhap ki tu
    mov ah, 1; ham ngat 1 de nhap ki tu -> nhu cin
    int 21h
    mov char, al
    
    ;in str2
    mov ah, 9
    lea dx, str2
    int 21h  
    
    ;in char
    mov ah, 2; ham ngat 2 -> nhu cout
    mov dl, char
    int 21h
main endp
end