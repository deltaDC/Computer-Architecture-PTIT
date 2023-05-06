.model small
.stack 100
.data
    st1 db 13,10, "Tong cac phan tu chia he cho 11: "
    st2 db 13,10, "$"
    arr db 1,22,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
    a db 0
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    ;in str1
    lea dx, st1
    mov ah, 9
    int 21h
    
    mov cx, 20 ;gan count = 20
    lea si, arr ;si tro vao dia chi ptu dau trong arr
    mov a, 0 ; kh?i t?o a=0
    duyet:
        mov al, [si] ; gan gia tri cua si vao al
        mov bl, 11 ; gan bl = 11
        mov ah, 0 ; gan ah = 0
        div bl ; chia al cho bl (chia cho 11)
        cmp ah,0 ; so sanh voi 0
        je tong ; = 0 thi nhay toi tinh tong
        jmp tiep; khong = 0 thi nhay toi tiep
    tong:
        mov al, [si] ; gan al = gia tri cua si
        mov bl,a ; dua so a vao bl
        add al,bl ; cong al voi bl, luu kqua vao al
        mov a,al ; chuyen kq vao bien a
    tiep:
        inc si ;tang chi so cua mang
        inc dl ;tang dl
        loop duyet
    mov al,a ;chuyen lai a vao thanh ghi al
    mov bl, 10 ;gan bl = 10
    mov cx,0 ;khoi tao bien dem
    chia:
        mov ah, 0 ; gan ah = 0
        div bl ;lay kq chia cho 10
        mov dl, ah ;chuyen du vào dl
        add dl, 30h ;chuyen sang ki tu
        push dx ;day phan du vao ngan xep
        inc cx ;tang bien dem
        cmp al, 0 ;so sanh thuong voi bien 0
        je inso ;neu = 0 thi in
        jmp chia
    inso:
        pop dx
        mov ah, 2
        int 21h
        loop inso
    ra:
        mov ah,4ch
        int 21h
main endp
end main