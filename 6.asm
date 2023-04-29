.model small
.stack 100
.data
    str     db  50 dup("$"); str 50bytes chua 50 ktu $
    XuongDong db 13, 10, "Xau dao nguoc la: $"
.code
main proc
    mov ax, @data
    mov ds, ax ; khoi tao thanh ghi ds  
    mov cx, 0; cx = 0, bien dem
    
    WHILE:
        inc cx; tang bien dem
        
        ;nhap ki tu dung ham ngat 1
        mov ah, 1                  
        int 21h
        
        cmp al, '#'; so sanh al vs #
        je BREAK; neu bang nhay toi END
        
        push ax; day vao stack
        jmp WHILE
        
    BREAK:
        mov ah, 9
        lea dx, XuongDong
        int 21h
        jmp END 
    END: 
        dec cx; tru bien dem di 1
        pop dx; lay ptu o dinh stack
        ; in ra ki tu o dinh stack
        mov ah, 2
        int 21h
        
        cmp cx, 1; so sanh bien dem voi 1
        jne END; nhay den neu khong bang
main endp
end