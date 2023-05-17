.model small

org 100h
.data
    state DB 1; Current state
    ps1 db 1    ; Placeholder for data value
    ps2 db 1
    color db 1    ; Variable to store color value
    ps4 db 1
    ps5 db 0
    check db 0    ; Variable to store check value
    ps7 db 0
    
    m1 db 219, 0, 219, 0, 219, 0, 219, 0, 219, 0, 219, 0, 219, 0, 219, 0    ; String to be printed
    m1e:
  
;macro 
asg MACRO a, b    ; Macro for fast assignment of a value to a variable
    mov al, b
    mov a, al
ENDM           

.code

main proc
  
    mov ah, 00h
    mov al, 03h   
    mov cx, 1
    int 10h 
    call mainFunc   
    
    ; Clear the screen ->  https://stackoverflow.com/questions/68110281/how-can-i-clear-the-entire-screen-in-
    clearScreen proc  
        mov ax, 3
        int 10h      
        ret
    clearScreen endp     

    mainFunc proc  
        mov color, 1     ; Initialize color to 1
        mov check, 0     ; Initialize check to 0
        jmp mainLoop     ; Jump to the main loop

    mainLoop:   
        call clearScreen    ; Call the clearScreen function to clear the screen
        call printString    ; Call the printString function to print the string
        
        ; Check the state and change color accordingly
        cmp check, 0
        je c0
        cmp check, 1
        je c1     

    mainFunc endp
    
    ; Change color to black and increment if it's less than 10
    c0:
        inc color    ; Increment the color
        cmp color, 10
        jge c0stage   ; If color is greater than or equal to 10, jump to c0stage
        jmp mainLoop   ; Otherwise, jump back to the main loop
    c0stage:
        dec color    ; Decrement the color
        dec color
        mov check, 1    ; Set check to 1
        jmp mainLoop   ; Jump back to the main loop
    
    ; Change color to white and decrement if it's greater than 1
    c1:
        dec color    ; Decrement the color
        cmp color, 1
        jl c1stage   ; If color is less than 1, jump to c1stage
        jmp mainLoop   ; Otherwise, jump back to the main loop
    c1stage:
        inc color    ; Increment the color
        inc color
        mov check, 0    ; Set check to 0
        jmp mainLoop   ; Jump back to the main loop
    
    ; Print the string
    printString proc
        asg ps7, ps1    ; Assign the value of ps1 to ps7
        mov ah, 13h    ; Set AH to 13h for teletype output
        mov al, 1    ; Set AL to 1 to print the entire string
        mov bh, 0    ; Set BH to 0 for the page number
        mov bl, color   ; Set BL to the desired color value for printing
        mov cx, m1e - offset m1    ; Calculate the length of the string
        mov dl, ps2    ; Set DL to the column position
        mov dh, ps7    ; Set DH to the row position
        push cs
        pop es
        mov bp, offset m1    ; Set the buffer pointer to the string
        int 10h    ; Call BIOS interrupt to print the string
        ret
        
    printString endp
end main
