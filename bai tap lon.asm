.model small

org 100h
.data
    color db 1    ; Variable to store color value
    
    m1 db 219, 0, 219, 0, 219, 0, 219, 0, 219, 0, 219, 0, 219, 0, 219, 0    ; String to be printed
          

.code

main proc 
    call mainFunc   
    
    ;Clear the screen ->  https://stackoverflow.com/questions/68110281/how-can-i-clear-the-entire-screen-in-
    clearScreen proc  
        mov ax, 3
        int 10h      
        ret
    clearScreen endp     
    
    ;main
    mainFunc proc  
        mov color, 1     ; Initialize color to 1 -> blue

        mainLoop:   
            call clearScreen    ; Call the clearScreen function to clear the screen
            call printString    ; Call the printString function to print the string
            
            ; color doc -> https://github.com/AhmadNaserTurnkeySolutions/emu8086/blob/master/examples/1_sample.asm
            
            cmp color, 16
            jge resetColor
            jl increaseColor
                 
    mainFunc endp
    
    resetColor:
        mov color, 1
        jmp mainLoop
    
    increaseColor:
        inc color
        jmp mainLoop
    
    ; Print the string -> https://en.wikipedia.org/wiki/INT_10H#References
    printString proc
        
        ;doc -> http://vitaly_filatov.tripod.com/ng/asm/asm_023.20.html
        
        
        mov ah, 13h    ; Set AH to 13h for teletype output
        mov al, 1    ; Set AL to 1 to print the entire string
        mov bl, color   ; Set BL to the desired color value for printing
        mov cx, 16    ; Length of the string
        lea bp, m1    ; Set the buffer pointer to the string
        int 10h    ; Call BIOS interrupt to print the string
        ret       
    printString endp
end 
