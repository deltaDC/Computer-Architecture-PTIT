.model small
.stack 100h
.data 
    PORTA equ 00h          ; port address for LEDs
    
    PORT_CONTROL equ 06h   ; port control signal
    
    LED_DELAY equ 50000    ; delay value

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; port control signal
    mov al, 80h
    out PORT_CONTROL, al
    
    ; Loop
    DISPLAY_LOOP:
        call DELAY
        ; LEDs on
        mov al, 0FFh
        out PORTA, al
        call DELAY
        
        ; LEDs off
        mov al, 0
        out PORTA, al
        call DELAY
        
        ; LEDs on
        mov al, 0FFh
        out PORTA, al
        call DELAY
        
        jmp DISPLAY_LOOP2
        
    DISPLAY_LOOP2:
        call DELAY
        ; Led on from left to right
        
        ; 1st led on 
        mov al, 01h
        out PORTA, al
        call DELAY
        
        ; 2nd led on
        mov al, 02h
        out PORTA, al
        call DELAY
        
        ; continue
        mov al, 04h
        out PORTA, al
        call DELAY
        
        mov al, 08h
        out PORTA, al
        call DELAY
        
        mov al, 10h
        out PORTA, al
        call DELAY
        
        mov al, 20h
        out PORTA, al
        call DELAY
        
        mov al, 40h
        out PORTA, al
        call DELAY
        
        mov al, 80h
        out PORTA, al
        call DELAY
        
        ; Led on from right to left
        mov al, 40h
        out PORTA, al
        call DELAY
        
        mov al, 20h
        out PORTA, al
        call DELAY
        
        mov al, 10h
        out PORTA, al
        call DELAY
        
        mov al, 08h
        out PORTA, al
        call DELAY
        
        mov al, 04h
        out PORTA, al
        call DELAY
        
        mov al, 02h
        out PORTA, al
        call DELAY
        
        mov al, 01h
        out PORTA, al
        call DELAY
        
        jmp DISPLAY_LOOP3

    DISPLAY_LOOP3:
        call DELAY
        ; Leds on alternately
        mov al, 0AAh   ; even-positioned Leds on
        out PORTA, al
        call DELAY
        
        mov al, 0h     ; Leds off
        out PORTA, al
        call DELAY
        
        mov al, 055h   ; odd-positioned Leds on
        out PORTA, al
        call DELAY
        
        mov al, 0h     ; Leds off
        out PORTA, al
        call DELAY
        
        mov al, 0AAh   ; repeat
        out PORTA, al
        call DELAY
        
        mov al, 0h     
        out PORTA, al
        call DELAY
        
        mov al, 055h   
        out PORTA, al
        call DELAY
        
        mov al, 0h     
        out PORTA, al
        call DELAY
        
        ; Go back to DISPLAY_LOOP
        jmp DISPLAY_LOOP4   
            
    DISPLAY_LOOP4:       
        call DELAY 
        
        mov al, 0h   
        out PORTA, al
        call DELAY
        
        mov al, 10000000b   
        out PORTA, al
        call DELAY
        
        mov al, 11000000b 
        out PORTA, al
        call DELAY
        
        mov al, 11100000b  
        out PORTA, al
        call DELAY
        
        mov al, 11110000b   
        out PORTA, al
        call DELAY
        
        mov al, 11111000b  
        out PORTA, al
        call DELAY
        
        mov al, 11111100b  
        out PORTA, al
        call DELAY
        
        mov al, 11111110b  
        out PORTA, al
        call DELAY
        
        mov al, 11111111b  
        out PORTA, al
        call DELAY 
        
        mov al, 01111111b  
        out PORTA, al
        call DELAY 
        
        mov al, 00111111b  
        out PORTA, al
        call DELAY
        
        mov al, 00011111b  
        out PORTA, al
        call DELAY
        
        mov al, 00001111b  
        out PORTA, al
        call DELAY
        
        mov al, 00000111b  
        out PORTA, al
        call DELAY
        
        mov al, 00000011b  
        out PORTA, al
        call DELAY 
        
        mov al, 00000001b  
        out PORTA, al
        call DELAY 
        
        mov al, 00000000b  
        out PORTA, al
        call DELAY
        
        
        jmp DISPLAY_LOOP
    
    
    ; End the program
    mov ah, 4ch
    int 21h
    
DELAY proc
    mov cx, LED_DELAY
    DELAY_LOOP:
    loop DELAY_LOOP
    ret
DELAY endp

endp main
end
