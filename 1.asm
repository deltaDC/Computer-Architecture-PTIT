.Model Small
.Stack 100
.Data
		CRLF    DB	13, 10, '$'	;ki tu xuong dong
		Greet	DB 	'hello$'
		XinChao	DB 	'Xin Chao$'
.Code
MAIN Proc;ham main
		;nap data vao DS qua AX
		MOV AX, @Data	; khoi dau thanh ghi DS
		MOV DS, AX;tro thanh ghi ds ve dau doan data
                             
	    ;ham ngat 
		MOV AH, 9; lenh goi ham 09h cua ngat 21 in mot xau ki tu
                                    
		LEA DX, Greet ; hien thi Greet
		INT 21H 
        
		LEA DX, CRLF; in dau enter va lui vao dau dong
		INT 21H                              
		
		; hien thi XinChao 
		LEA DX, XinChao
		INT 21H      ;chao ban!
		
		; tro ve DOS dùng hàm 4 CH cua INT 21H
		; tuong tu return 0
		MOV AH, 4CH
		INT 21H
MAIN Endp 
END 		