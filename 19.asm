.model small
.stack 100
.data
    A    db  "assemblyPTIT$"
    B    db  "PTIT$"
    endl db  13, 10, "$"
    true db  "B la xau con cua A$"
    vitri db "Vi tri xau B trong A bat dau tu vi tri so: $"
    false db "B khong la xau con cua A$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, A; tro si vao xau A
    mov cx, 0; luu vi tri
    fori:
        inc cx
        cmp [si], '$'; ktra xem da ket thuc xau hay chua
        je done
        
        mov bx, si ;pos
        lea di, B; tro di vao xau B
        forj:
            cmp [di], '$'; neu chay dc qua het xau B -> B la xau con cua A
            je Co
            
            mov al, [bx]
            cmp [di], al; so sanh phan tu cua xau A va xau B
            jne Khong; neu khong bang -> tang index cua xau A len
            
            inc di; neu bang tang index cua xau A va B len tiep tuc so sanh
            inc bx
            
            jmp forj
        Co:
            ;in ket qua
            mov ah, 9
            lea dx, true
            int 21h
            
            lea dx, endl
            int 21h
            
            lea dx, vitri
            int 21h
            
            mov ax, cx
            call inso
            
            jmp KT ;dung ctrinh
        Khong:
            inc si ;tang index cua xau A len
    jmp fori
     
    done:
        mov ah, 9
        lea dx, false
        int 21h
        jmp KT            
    KT:
        mov ah, 4ch
        int 21h
main endp

inso proc
    push ax
    push bx
    push cx
    push dx
    
    mov bx, 10
    mov cx, 0
    lap:
        mov dx, 0
        div bx
        push dx
        inc cx
        
        cmp ax, 0
        jg lap
        
    hienthi:
        pop dx
        add dl, '0'
        
        mov ah, 2
        int 21h
        
        loop hienthi
        
    pop dx
    pop cx
    pop bx
    pop ax
inso endp


end