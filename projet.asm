data segment
    ;demi db 2
    x1 dw ?
    y1 dw ?
    A dw ?
    B dw ?
    C dw ?
    E dw ?
    D dw ?
    F dw ?
    G dw ?
    H dw ?
    nl db 10,13,'$'
    msbs3 db "                           <----------------------------->",10,13,"$"
    msbs1 db "                           <----------------------------->",10,13,"$"
    msbs2 db "                           | - donner les coordonneer :  |",10,13,"$"        
    mest db "           ----> PRESENTER PAR :    + MAROUANE HANOUCH $"  
    mest1 db "                                    + MED REDA BOUAMOUD $"  
    mest2 db "                                      ENCADRE PAR :        + MR IBRIZ $"   
    mes1 db "                                ----> donne x1=$"
    mes2 db "                                ----> donne y1=$"
    mes3 db "                                ----> donne A=$"
    mes4 db "                                ----> la moitier de A =$"
   ; menu1 db 10,13,10,13,"                        ___|    |___ $" 
   menu db 10,13,10,13,"              |-_-|-_-|-_-|-_-|----> MENU <----|-_-|-_-|-_-|-_-|$"
    ;menu2 db 10,13,10,13,"                           |    |    $"
    frm db "                               ----> 1-les formes$"
    letr db "                               ----> 2-les lettres$"
    nb db "                               ----> 3-les nombres$"
    zb db "                               ----> 4-quitter$"
    zb1 db "                                10-retour$"
    zb2 db "                              ----> 3-retour$"
    mf db "                                1-carre",10,13,"                                2-carre plein",10,13,"                                3-rectangle",10,13,"                                4-rectangle plein",10,13,"                                5-parallelogramme",10,13,"                                6-parallelogramme plein",10,13,"                                7-les triengles",10,13,"                                8-losange",10,13,"                                9-losange plein$"
    mn db "          donner un nombre pour l'afficher : $"
    ml db "                              ----> 1-majuscule",10,13,"                              ----> 2-miniscule$"
    choix db "                               ----> donner votre choix :$"
    mlma db "                                 1-A   2-B   3-C ",10,13,"                                 4-D   5-E   6-F ",10,13,"                                 7-G   8-H   9-I ",10,13, "                                 10-J  11-K  12-L ",10,13,"                                 13-M  14-N  15-O ",10,13,"                                 16-P  17-Q  18-R ",10,13, "                                 19-S  20-T  21-U ",10,13,"                                 22-V  23-W  24-X ",10,13,"                                 25-Y  26-Z",10,13,                                 ,10,13,"                                 27-retour$"
    mlmi db "                                 1-a   2-b   3-c ",10,13,"                                 4-d   5-e   6-f ",10,13,"                                 7-g   8-h   9-i ",10,13,"                                10-j  11-k  12-l ",10,13,"                                13-m  14-n  15-o ",10,13,"                                16-p  17-q  18-r ",10,13,"                                19-s  20-t  21-u ",10,13,"                                22-v  23-w  24-x ",10,13,"                                25-y  26-z",10,13,"                                 ",10,13,"                                 27-retour$"
data ends
spile segment para stack
    dw 256 dup(?)
    bpile equ this word
spile ends
assume ds:data,cs:code,ss :spile
code segment
    
    saisie proc near 
    mov cl,10
    
            mov dl,0
            relire: mov ah,1
                    int 21H
                    cmp al,'$'
                    je fsaisie
                    sub al,48
                    mov ah,0
                    mov bx,ax
                    
                    mov ax,dx
                    
                    mul cl
                    add ax,bx
                    
                    mov dx,ax
            jmp relire
     fsaisie:
    ret
    saisie endp
    
    saisi proc near
    
        mov ah,01h
        int 21h
    
    ret
    saisi endp
    
    horizontald proc near
    
            hor1:
                int 10h
                inc cx
                dec bx
                cmp bx,0
                jne hor1
                
    ret
    horizontald endp
    
    horizontalg proc near

            
            hor2:
                int 10h
                dec cx
                dec bx
                cmp bx,0
                jne hor2
                
    ret
    horizontalg endp
    
    verticalh proc near

            ver1:
                int 10h
                dec dx
                dec bx
                cmp bx,0
                jne ver1
                
    ret
    verticalh endp
    
    verticalb proc near

            ver2:
                int 10h
                inc dx
                dec bx
                cmp bx,0
                jne ver2
                
    ret
    verticalb endp
    
    diagonalhd proc near

            diago1:
                int 10h
                inc cx
                dec dx
                dec bx
                cmp bx,0
                jne diago1
    
    ret
    diagonalhd endp
    
    diagonalhg proc near
    

            diago2:
                int 10h
                dec cx
                dec dx
                dec bx
                cmp bx,0
                jne diago2
    
    ret
    diagonalhg endp
    
    diagonalbd proc near
    

            diago3:
                int 10h
                inc cx
                inc dx
                dec bx
                cmp bx,0
                jne diago3
    
    ret
    diagonalbd endp
    
    diagonalbg proc near
    

            diago4:
                int 10h
                dec cx
                inc dx
                dec bx
                cmp bx,0
                jne diago4
    
    ret
    diagonalbg endp
    
    carre proc near
            
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald  
            mov bx,A
            call verticalb
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalh
    ret
    carre endp
    
    
    
    careplein proc near 
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,47
            MOV CX,x1
            MOV DX,y1
            INT 10H
            mov di,-1
         ab:
         inc di
            
            mov bx,A
            call horizontald
            mov bx,A
            inc dx
            
            abcd:
                dec cx
                dec bx
                cmp bx,0
                jne abcd
                cmp di,A
            jne ab
            
    ret
    careplein endp
    
    triangleh proc near
        
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            
            
            mov bx,A
            A1:
                inc cx
                dec bx
                cmp bx,0
                jne A1
                
            mov bx,A
            call diagonalbg
            
            MOV bx,A
            call diagonalhd
                
            mov bx,A
            call diagonalbd
            
            mov bx,A
            call horizontalg
                
            mov bx,A
            call horizontalg
        
    ret
    triangleh endp
    
    triangleb proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald
            
            mov bx,A 
            call horizontald
            
            mov bx,A
            call diagonalbg
            
            mov bx,A
            call diagonalhg
    
    ret
    triangleb endp
    
    triangled proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalhg
            
                
    
    ret
    triangled endp
    
    triangleg proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
          
            mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalbd  
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
           
            
                
    
    ret
    triangleg endp
    
    
    rectangle proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
          
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
            mov bx,A
            call verticalb
            mov bx,A
            call horizontalg
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalh
    
    ret
    rectangle endp
    
    rectangleplein proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,47
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            
           
            
            mov di,-1
             rec:
             inc di 
                
                mov bx,A
                call horizontald
                mov bx,A
                call horizontald
                
                inc dx
                mov bx,A
                rec1:
                    dec cx
                    dec bx
                    cmp bx,0
                    jne rec1
                mov bx,A
                rec2:
                    dec cx
                    dec bx
                    cmp bx,0
                    jne rec2
                    cmp di,A
                jne rec
    
    ret
    rectangleplein endp
    
    Parallelogramme proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
          
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
            mov bx,A
            call diagonalbd
            mov bx,A
            call horizontalg
            mov bx,A
            call horizontalg
            mov bx,A
            call diagonalhg
    
    ret
    Parallelogramme endp
    
        mo3yan proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            mov bx,A
            A4:
                inc dx
                dec bx
                cmp bx,0
                jne A4
          
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalhg
            
    
    ret
    mo3yan endp
    
       mo3yanplien proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,47
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,A
            A3:
                inc dx
                dec bx
                cmp bx,0
                jne A3
          

            
            mov bx,A
            amr:
                inc cx
                dec A
                cmp A,0
                je fon
                           amr1:
                                mov bx,A
                                call diagonalhd
                                mov bx,A
                                call diagonalbd
                                mov bx,A
                                call diagonalbg
                                mov bx,A
                                call diagonalhg
                    
                     jmp amr 
            
   fon:
    ret
    mo3yanplien endp
    
    Parallelogrammeplein proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,47
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov di,-1
             par:
             inc di 
                
                mov bx,A
                call horizontald
                mov bx,A
                call horizontald
                
                inc dx
                inc cx
                mov bx,A
                par1:
                    dec cx
                    dec bx
                    cmp bx,0
                    jne par1
                mov bx,A
                par2:
                    dec cx
                    dec bx
                    cmp bx,0
                    jne par2
                    cmp di,A
                jne par
    
    ret
    Parallelogrammeplein endp
    
    lettreA proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1

            
            mov bx,A
            A5:
                inc cx
                dec bx
                cmp bx,0
                jne A5

                
            mov bx,B
            A2:
                inc cx
                dec bx
                cmp bx,0
                jne A2
                
                mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalhg
            mov bx,A
            call horizontalg
            mov bx,A
            call horizontalg
    
    ret
    lettreA endp
    
    lettreB proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            ;mov bx,A
            ;call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalhd
            mov bx,B
            call diagonalhg
            mov bx,B
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalhd
            mov bx,B
            call diagonalhg
            mov bx,B
            call horizontalg

    
    ret
    lettreB endp
    
    lettreC proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            ;INT 10H
            
            mov bx,B
            c1:
                inc cx
                dec bx
                cmp bx,0
                jne c1
            mov bx,B
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,B
            call diagonalbg
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbd
            mov bx,B
            call horizontald
    
    ret
    lettreC endp
    
    lettreD proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,B
            call horizontalg
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
    
    ret
    lettreD endp
    
    lettreE proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            
    
    ret
    lettreE endp
    
    lettreF proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
    
    ret
    lettreF endp
    
    lettreG proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call horizontalg
    
    ret
    lettreG endp
    
    lettreH proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            
    
    ret
    lettreH endp
    
    lettreI proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            z2:
                inc cx
                dec bx
                cmp bx,0
                jne z2
            
            
            mov bx,A
            call horizontald 
            mov bx,B
            call horizontalg          
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontald
            mov bx,A
            call horizontalg
    
    ret
    lettreI endp
    
    lettreJ proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,A
            call horizontald
    
    ret
    lettreJ endp
    
    lettrek proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalbd
    
    ret
    lettrek endp
    
    lettreL proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
    
    ret
    lettreL endp
    
    lettreM proc near
        
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalhd
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
        
    ret
    lettreM endp
    
    lettreN proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalbd
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
    
    ret
    lettreN endp
    
    lettreO proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            mov bx,B
            O1:
                inc cx
                dec bx
                cmp bx,0
                jne O1
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
            mov bx,A
            call horizontald
    
    ret
    lettreO endp
    
    lettreP proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call horizontalg
    
    ret
    lettreP endp
    
    lettreQ proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            Q1:
                inc cx
                dec bx
                cmp bx,0
                jne Q1
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,B
            call diagonalhg
            mov bx,A
            call diagonalbd
            
            
    
    ret
    lettreQ endp
    
    lettreR proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call diagonalbd
            
    
    ret
    lettreR endp
    
    lettreS proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call verticalb
            mov bx,A
            call horizontalg
    
    ret
    lettreS endp
    
    lettreT proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H  
          
            mov bx,A
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
    
    ret
    lettreT endp
    
    lettreU proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
    
    ret
    lettreU endp
    
    lettreV proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalhd
    
    ret
    lettreV endp
    
    lettreW proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalhd
    
    ret
    lettreW endp
    
    lettreX proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call diagonalbd
            mov bx,A
            lettreX1:
                dec cx
                dec bx
                cmp bx,0
                jne lettreX1
            mov bx,A
            call diagonalhd
            
    
    ret
    lettreX endp
    
    lettreY proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call diagonalbd
            mov bx,A
            call diagonalhd
            mov bx,A
            call diagonalbg
            mov bx,A
            call verticalb
    
    ret
    lettreY endp
    
    lettreZ proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
           
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
            mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalbg
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
    
    ret
    lettreZ endp
    
    nb1 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,A
            nb11:
                inc cx
                dec bx
                cmp bx,0
                jne nb11
            mov bx,B
            call diagonalbg
            mov bx,B
            call diagonalhd
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,A
            call horizontald
            
    
    ret
    nb1 endp
    
    nb2 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            Q2:
                inc cx
                dec bx
                cmp bx,0
                jne Q2
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,A
            call diagonalbg
            mov bx,A
            call diagonalbg
            mov bx,A
            call horizontald
            mov bx,A
            call horizontald
            ;mov bx,A
            ;call  diagonalbd
    
    ret
    nb2 endp
    
    nb3 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            Q3:
                inc cx
                dec bx
                cmp bx,0
                jne Q3
            
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalbg   
            mov bx,B
            call horizontalg
            mov bx,B
            call horizontald      
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            
          
    
    ret
    nb3 endp
    
    nb4 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            
            
            
            ;mov bx,A
            ;call diagonalhd
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,A
            call verticalb
            
    
    ret
    nb4 endp
    
    nb5 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            
            mov bx,A
            call horizontald
            mov bx,A
             call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call verticalb
             mov bx,A
            call horizontalg
           
    
    ret
    nb5 endp
    
    nb6 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            
            mov bx,A
            call horizontald
            mov bx,A
            call horizontalg
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call horizontalg
            
  
    ret
    nb6 endp
    
    nb7 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            
            mov bx,B
            Q7:
                inc cx
                dec bx
                cmp bx,0
                jne Q7
            

            mov bx,A
            call horizontald
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call verticalh
            mov bx,B
            call horizontald
            mov bx,A
            call horizontalg
            
            
    
    ret
    nb7 endp
    
    nb8 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov  bx,B
            Q8:
                inc cx
                dec bx
                cmp bx,0
                jne Q8
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg 
            mov bx,A
            call horizontalg
            
            
            ;;;;;;;   eatap 2 ;;;;;;
            
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg 
            mov bx,A
            call horizontalg
            
            
            

    
    ret
    nb8 endp
     
    nb9 proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            call carre
            mov bx,A
            call horizontald
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call horizontalg
  
    ret
    nb9 endp
    
    letrea proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            mov bx,B
            Qa:
                inc cx
                dec bx
                cmp bx,0
                jne Qa
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call verticalb
            mov bx,B
            call horizontald
            
    
    ret
    letrea endp
    
    letreb proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            
            
            
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,A
            call horizontald
            mov bx,A
            call verticalh
            mov bx,A
            call horizontalg
    
    ret
    letreb endp
    
    letrec proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            ;INT 10H
            
            mov bx,B
            c2:
                inc cx
                dec bx
                cmp bx,0
                jne c2
            mov bx,B
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,B
            call diagonalbg
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbd
            mov bx,B
            call horizontald
    
    ret
    letrec endp
    
    letred proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,A
            d2:
                inc cx
                dec bx
                cmp bx,0
                jne d2
                
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
    
    ret
    letred endp
    
    letree proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,A
            call verticalb
            mov bx,B
            call horizontald
    
    ret
    letree endp
    
    letref proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
            mov bx,A
            call verticalh
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontald
    
    ret
    letref endp
    
    letreg proc near
    
         mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalbg
            mov bx,B
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalbg 
            mov bx,A
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,B
            call verticalh
            mov bx,A
            call diagonalhd
            mov bx,B
            call horizontald
    
    ret
    letreg endp
    
    letreh proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
    
    ret
    letreh endp
    
    letrei proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            dec dx
            dec dx
            int 10h
            inc dx
            inc dx
            mov bx,A
            call verticalb
    
    ret
    letrei endp
    
    letrej proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            dec dx
            dec dx
            int 10h
            inc dx
            inc dx
            mov bx,A
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,A
            call horizontald
    
    ret
    letrej endp
    
    letrek proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call diagonalbg
            mov bx,B
            call diagonalbd
    
    ret
    letrek endp
    
    letrel proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,B 
            call horizontald
    
    ret
    letrel endp
    
    letrem proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            m1:
                inc dx
                dec bx
                cmp bx,0
                jne m1
            mov bx,B
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call verticalb
            mov bx,B
            call horizontald
    
    ret
    letrem endp
    
    letren proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            n1:
                inc dx
                dec bx
                cmp bx,0
                jne n1
            mov bx,B
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,B
            call verticalb
            mov bx,B
            call horizontald
    
    ret
    letren endp
    
    letreo proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            
            
            mov bx,B
            o8:
                inc cx
                dec bx
                cmp bx,0
                jne o8
            mov bx,A
            call horizontald
            mov bx,B
            call diagonalbd
            mov bx,A
            call verticalb
            mov bx,B
            call diagonalbg
            mov bx,A
            call horizontalg
            mov bx,B
            call diagonalhg
            mov bx,A
            call verticalh
            mov bx,B
            call diagonalhd
    
    ret
    letreo endp
    
    letrep proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,B
            call verticalb
            mov bx,A
            call verticalb
                 
    ret
    letrep endp
    
    letreq proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
            mov bx,A
            call verticalb
                 
    ret
    letreq endp
    
    letrer proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,B
            call verticalh
            mov bx,B
            call diagonalhd
            mov bx,B
            call horizontald
    
    ret
    letrer endp
    
    letres proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalb
            mov bx,B
            call horizontald
            mov bx,B
            call verticalb
            mov bx,B
            call horizontalg
    
    ret
    letres endp
    
    letret proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,A
            call verticalb
            mov bx,B
            call horizontald
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,B
            call horizontald
    
    ret
    letret endp
    
    letreu proc near
    
            mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call verticalb
            mov bx,B
            call verticalb
            mov bx,B
            call horizontald
            mov bx,B
            call verticalh
            mov bx,B
            call verticalh
    
    ret
    letreu endp
    
    letrev proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalhd
    
    ret
    letrev endp
    
    letrew proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalhd
            mov bx,B
            call diagonalbd
            mov bx,B
            call diagonalhd
    
    ret
    letrew endp
    
    letrex proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call diagonalbd
            mov bx,B
            letrex1:
                dec cx
                dec bx
                cmp bx,0
                jne letrex1
            mov bx,B
            call diagonalhd
            
    
    ret
    letrex endp
    
    letrey proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
            
            mov bx,B
            call verticalb
            mov bx,B
            call horizontald
            mov bx,B
            call verticalh
            mov bx,B
            call verticalb
            mov bx,A
            call verticalb
            mov bx,B
            call horizontalg
            mov bx,B
            call verticalh
            mov bx,B
            call horizontald
    
    ret
    letrey endp
    
    letrez proc near
    
        mov AH,0
            MOV AL,13H
            INT 10H
            
            MOV AH,0CH
            MOV AL,10
            MOV CX,x1
            MOV DX,y1
            INT 10H
           
            mov bx,B
            call horizontald
            mov bx,B
            call horizontald
            mov bx,B
            call diagonalbg
            mov bx,B
            call diagonalbg
            mov bx,B
            call horizontald
            mov bx,B
            call horizontald
    
    ret
    letrez endp
    
    cls proc near
    
        mov ah,0
        mov al,2
        int 10h
    
    ret
    cls endp

    debut: mov ax,data
            mov ds,ax
            mov ax,spile
            mov ss,ax
           ; mov sp,bpile
            ;;;;
            
            
           
            MOV AH, 06h    ; Scroll up function
            XOR AL, AL     ; Clear entire screen
            XOR CX, CX     ; Upper left corner CH=row, CL=column
            MOV DX, 184FH  ; lower right corner DH=row, DL=column 
            MOV Bh, 71h    ; YellowOnBlue   1Eh
            INT 10H


            mov ah,09h
            mov dx,offset msbs1
            int 21h
            
            mov ah,09h
            mov dx,offset msbs2
            int 21h
            
            mov ah,09h
            mov dx,offset msbs3
            int 21h
            
            ;mov ah,09h
            ;mov dx,offset msbs
            ;int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset mes1
            int 21h
            
            call saisie
            mov x1,dx
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            
            mov ah,09h
            mov dx,offset mes2
            int 21h
            
            
            
            call saisie
            mov y1,dx
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset mes3
            int 21h
            
            call saisie
            mov A,dx
            
             mov ah,09h
             mov dx,offset nl
             int 21h
             
             mov ah,09h
             mov dx,offset mes4
             int 21h
             
             call saisie
             mov B,dx
             
             
             
             ;mov dh,0
             ;mov ax,dx
             ;div demi 
             ;mov ah,0
             ;mov B,al
            
      
            call cls
            

       projet:  
   
     
            MOV AH, 06h    ; Scroll up function
            XOR AL, AL     ; Clear entire screen
            XOR CX, CX     ; Upper left corner CH=row, CL=column
            MOV DX, 184FH  ; lower right corner DH=row, DL=column 
            MOV Bh, 71h    ; YellowOnBlue   1Eh
            INT 10H
            
            
            mov ah,09h
            mov dx,offset menu
            int 21h
        
     
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset frm
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset letr
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset nb
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset zb
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
   
            mov ah,09h
            mov dx,offset choix
            int 21h
            
            call saisie
            mov C,dx
            
            call cls
            
            cmp C,1
            je formes
            cmp C,2
            je ltres1
            cmp C,3
            je nombre1
            cmp C,4
            je fin
            jmp projet
            ltres1: jmp ltres
            nombre1: jmp nombre
            
            ;projet1:
            ;jmp projet
            fin:
            
            MOV AH, 06h    ; Scroll up function
            XOR AL, AL     ; Clear entire screen
            XOR CX, CX     ; Upper left corner CH=row, CL=column
            MOV DX, 184FH  ; lower right corner DH=row, DL=column 
            MOV Bx, 1011    ; YellowOnBlue   1Eh
            INT 10H
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            
            ;mov bl,0110_1110b
            mov ah,09h
            mov dx,offset mest
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset mest1
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset nl
            int 21h
            
            mov ah,09h
            mov dx,offset mest2
            int 21h
            
            
            
            mov ah,4ch
            int 21h
            
    
                       ; projet2:
                       ;jmp projet1        
      formes:
      
                        MOV AH, 06h    ; Scroll up function
                        XOR AL, AL     ; Clear entire screen
                        XOR CX, CX     ; Upper left corner CH=row, CL=column
                        MOV DX, 184FH  ; lower right corner DH=row, DL=column 
                        MOV Bh, 71h    ; YellowOnBlue   1Eh
                        INT 10H
            
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset mf
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset zb1
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h                       
                        mov ah,09h
                        mov dx,offset choix
                        int 21h
                        
                        
                        
                        ;formes1:
                        ;jmp formes
                        
                    call saisie
                    mov D,dx                   
                    call cls                   
                    cmp D,1
                    je formecarre
                    cmp D,2
                    je formecarreplein
                    cmp D,3
                    je formerectangle
                    cmp D,4
                    je formerectangleplein
                    cmp D,5
                    je formeparallelogramme
                    cmp D,6
                    je formeparallelogrammeplein
                    cmp D,7
                    je formetriangle
                    cmp D,8
                    je mo3yan1
                    cmp D,9
                    je mo3yan2
                    cmp D,10
                    jmp projet
                    jmp formes
                formecarre:
                    call carre
                    call saisi
                    call cls
                    jmp formes
                formecarreplein:
                    call careplein
                    call saisi
                    call cls
                    jmp formes
                formerectangle:
                    call rectangle
                    call saisi
                    call cls
                    jmp formes
                formerectangleplein:
                    call rectangleplein
                    call saisi
                    call cls
                    jmp formes
                formeparallelogramme:
                    call parallelogramme
                    call saisi
                    call cls
                    jmp formes
                formeparallelogrammeplein:
                    call parallelogrammeplein
                    call saisi
                    call cls
                    jmp formes
                formetriangle:
                    call triangleh
                    call saisi
                    call cls
                    jmp formes
                mo3yan1:
                    call mo3yan
                    call saisi
                    call cls
                    jmp formes
                mo3yan2:
                   call mo3yanplien
                    call saisi
                    call cls
                    jmp formes
            projet2:
            jmp projet     
     nombre:
                    MOV AH, 06h    ; Scroll up function
                    XOR AL, AL     ; Clear entire screen
                    XOR CX, CX     ; Upper left corner CH=row, CL=column
                    MOV DX, 184FH  ; lower right corner DH=row, DL=column 
                    MOV Bh, 71h    ; YellowOnBlue   1Eh
                    INT 10H
            
                    mov ah,09h
                    mov dx,offset nl
                    int 21h
                    
                    mov ah,09h
                    mov dx,offset mn
                    int 21h         
                    
                call saisie
                mov E,dx
                
                call cls
                
                    cmp E,1
                    je nbr1
                    cmp E,2
                    je nbr2
                    cmp E,3
                    je nbr3
                    cmp E,4
                    je nbr4
                    cmp E,5
                    je nbr5
                    cmp E,6
                    je nbr6
                    cmp E,7
                    je nbr7
                    cmp E,8
                    je nbr8
                    cmp E,9
                    je nbr9
                    jne nombre
                nbr1:
                    call nb1
                    call saisi
                    call cls
                    jmp projet
                nbr2:
                    call nb2
                    call saisi
                    call cls
                    jmp projet
                nbr3:
                    call nb3
                    call saisi
                    call cls
                    jmp projet
                nbr4:
                    call nb4
                    call saisi
                    call cls
                    jmp projet
                nbr5:
                    call nb5
                    call saisi
                    call cls
                    jmp projet
                nbr6:
                    call nb6
                    call saisi
                    call cls
                    jmp projet
                nbr7:
                    call nb7
                    call saisi
                    call cls
                    jmp projet
                nbr8:
                    call nb8
                    call saisi
                    call cls
                    jmp projet
                nbr9:
                    call nb9
                    call saisi
                    call cls
                    jmp projet 
    ltres:
                MOV AH, 06h    ; Scroll up function
                XOR AL, AL     ; Clear entire screen
                XOR CX, CX     ; Upper left corner CH=row, CL=column
                MOV DX, 184FH  ; lower right corner DH=row, DL=column 
                MOV Bh, 71h    ; YellowOnBlue   1Eh
                INT 10H
            
            
            
                mov ah,09h
                mov dx,offset nl
                int 21h
                
                ;ml0:
                 mov ah,09h
                 mov dx,offset ml
                 int 21h
                 
                 mov ah,09h
                 mov dx,offset nl
                 int 21h
                 
                 mov ah,09h
                 mov dx,offset zb2
                 int 21h
                 
                 mov ah,09h
                 mov dx,offset nl
                 int 21h
                 
                 mov ah,09h
                 mov dx,offset nl
                 int 21h
                 
                mov ah,09h
                mov dx,offset choix
                int 21h
                
                call saisie
                mov F,dx
                
                call cls
                
                cmp F,1
                je maj
                cmp F,2
                je min12
                cmp F,3
                jmp projet2
                jne ltres
                
                min12: jmp min
            maj:
                        
                        
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                   maj1:
                         MOV AH, 06h    ; Scroll up function
                        XOR AL, AL     ; Clear entire screen
                        XOR CX, CX     ; Upper left corner CH=row, CL=column
                        MOV DX, 184FH  ; lower right corner DH=row, DL=column 
                        MOV Bh, 71h    ; YellowOnBlue   1Eh
                        INT 10H
                     
                        
                        mov ah,09h
                        mov dx,offset mlma
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                          
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset choix
                        int 21h
                        
                        call saisie
                        mov G,dx
                        
                        call cls
                        
                        cmp G,1
                        jne majb
                        
                        call lettreA
                        call saisi
                        call cls
                        jmp maj1
                       majb:
                        cmp G,2
                        jne majc
                        
                       call lettreB
                       call saisi
                        call cls
                        jmp maj1
                       majc:
                        cmp G,3
                        jne majd
                        
                        call lettreC
                        call saisi
                        call cls
                        jmp maj1
                        majd:
                        cmp G,4
                        jne maje
                        
                        call lettreD
                        call saisi
                        call cls
                        jmp maj1
                        maje:
                        cmp G,5
                        jne majf
                        
                        call lettreE
                        call saisi
                        call cls
                        jmp maj1
                        majf:
                        cmp G,6
                        jne majg
                        
                        call lettreF
                        call saisi
                        call cls
                        jmp maj1
                        majg:
                        cmp G,7
                        jne majh
                        
                        call lettreG
                        call saisi
                        call cls
                        jmp maj1
                        majH:
                        cmp G,8
                        jne maji
                        
                        call lettreH
                        call saisi
                        call cls
                        jmp maj1
                        maji:
                        cmp G,9
                        jne majj
                        
                        call lettreI
                        call saisi
                        call cls
                        jmp maj1
                        majj:
                        cmp G,10
                        jne majk
                        
                        call lettreJ
                        call saisi
                        call cls
                        jmp maj1
                        majk:
                        cmp G,11
                        jne majl
                        
                        call lettreK
                        call saisi
                        call cls
                        jmp maj1
                        majl:
                        cmp G,12
                        jne majm
                        
                        call lettreL
                        call saisi
                        call cls
                        jmp maj1
                        majm:
                        cmp G,13
                        jne majn
                        
                        call lettreM
                        call saisi
                        call cls
                        jmp maj1
                        majn:
                        cmp G,14
                        jne majo
                        
                        call lettreN
                        call saisi
                        call cls
                        jmp maj1
                        majo:
                        cmp G,15
                        jne majp
                        
                        call lettreO
                        call saisi
                        call cls
                        jmp maj1
                        majp:
                        cmp G,16
                        jne majq
                        
                        call lettreP
                        call saisi
                        call cls
                        jmp maj1
                        majq:
                        cmp G,17
                        jne majr
                        
                        call lettreQ
                        call saisi
                        call cls
                        jmp maj1
                        majr:
                        cmp G,18
                        jne majs
                        
                        call lettreR
                        call saisi
                        call cls
                        jmp maj1
                        majs:
                        cmp G,19
                        jne majt
                        
                        call lettreS
                        call saisi
                        call cls
                        jmp maj1
                        majt:
                        cmp G,20
                        jne maju
                        
                        call lettreT
                        call saisi
                        call cls
                        jmp maj1
                        maju:
                        cmp G,21
                        jne majv
                        
                        call lettreU
                        call saisi
                        call cls
                        jmp maj1
                        majv:
                        cmp G,22
                        jne majw
                        
                        call lettreV
                        call saisi
                        call cls
                        jmp maj1
                        majw:
                        cmp G,23
                        jne majx
                        
                        call lettreW
                        call saisi
                        call cls
                        jmp maj1
                        majx:
                        cmp G,24
                        jne majy
                        
                        call lettreX
                        call saisi
                        call cls
                        jmp maj1
                        majy:
                        cmp G,25
                        jne majz
                        
                        call lettreY
                        call saisi
                        call cls
                        jmp maj1
                        majz:
                        cmp G,26
                        jne maj11
                        
                        call lettreZ    
                        call saisi
                        call cls
                        jmp maj1
                        
                        
                        maj11:                       
                        ;call saisi
                        call cls
                        jmp ltres 
                        

                        
                min:
                        
                        
                        
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h

                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                        
                   min1:
                        MOV AH, 06h    ; Scroll up function
                        XOR AL, AL     ; Clear entire screen
                        XOR CX, CX     ; Upper left corner CH=row, CL=column
                        MOV DX, 184FH  ; lower right corner DH=row, DL=column 
                        MOV Bh, 71h    ; YellowOnBlue   1Eh
                        INT 10H
                   
                        
                        mov ah,09h
                        mov dx,offset mlmi
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                          
                        mov ah,09h
                        mov dx,offset nl
                        int 21h
                        
                        mov ah,09h
                        mov dx,offset choix
                        int 21h
                        
                        call saisie
                        mov H,dx
                        
                        call cls
                        
                        cmp H,1
                        jne minb
                        
                        call letrea
                        call saisi
                        call cls
                        jmp min1
                        minb:
                        cmp H,2
                        jne minc
                        
                        call letreb
                        call saisi
                        call cls
                        jmp min1
                        minc:
                        cmp H,3
                        jne mind
                        
                        call letrec
                        call saisi
                        call cls
                        jmp min1
                        mind:
                        cmp H,4
                        
                        jne mine
                        
                        call letred
                        call saisi
                        call cls
                        jmp min1
                        mine:
                        cmp H,5
                        
                        jne minf
                        
                        call letree
                        call saisi
                        call cls
                        jmp min1 
                        minf:
                        cmp H,6
                        
                        jne ming
                        
                        call letref
                        call saisi
                        call cls
                        jmp min1
                        ming:
                        cmp H,7
                        
                        jne minh
                        
                        call letreg
                        call saisi
                        call cls
                        jmp min1
                        minh:
                        cmp H,8
                        
                        jne mini
                        
                        call letreh
                        call saisi
                        call cls
                        jmp min1
                        mini:
                        cmp H,9
                        
                        jne minj
                        
                        call letrei
                        call saisi
                        call cls
                        jmp min1
                        minj:
                        cmp H,10
                        
                        jne mink
                        
                        call letrej
                        call saisi
                        call cls
                        jmp min1
                        mink:
                        cmp H,11
                        
                        jne minl
                        
                        call letrek
                        call saisi
                        call cls
                        jmp min1
                        
                        minl:
                        cmp H,12
                        
                        jne minm
                        
                        call letrel
                        call saisi
                        call cls
                        jmp min1
                        minm:
                        cmp H,13
                        
                        jne minn
                        
                        call letrem
                        call saisi
                        call cls
                        jmp min1
                        minn:
                        cmp H,14
                       
                        jne mino
                        
                        call letren
                        call saisi
                        call cls
                        jmp min1
                        mino:
                        cmp H,15
                        
                        jne minp
                        
                        call letreo
                        call saisi
                        call cls
                        jmp min1
                        minp:
                        cmp H,16
                        
                        jne minq
                        
                        call letrep
                        call saisi
                        call cls
                        jmp min1
                        minq:
                        cmp H,17
                       
                        jne minr
                        
                        call letreq
                        call saisi
                        call cls
                        jmp min1
                        minr:
                        cmp H,18
                        
                        jne mins
                        
                        call letrer
                        call saisi
                        call cls
                        jmp min1
                        mins:
                        cmp H,19
                        
                        jne mint
                        
                        call letres
                        call saisi
                        call cls
                        jmp min1
                        mint:
                        cmp H,20
                        
                        jne minu
                        
                        call letret
                        call saisi
                        call cls
                        jmp min1
                        minu:
                        cmp H,21
                        
                        jne minv
                        
                        call letreu
                        call saisi
                        call cls
                        jmp min1
                        minv:
                        cmp H,22
                        
                        jne minw
                        
                        call letrev
                        call saisi
                        call cls
                        jmp min1
                        minw:
                        cmp H,23
                        
                        jne minx
                        
                        call letrew
                        call saisi
                        call cls
                        jmp min1
                        minx:
                        cmp H,24
                        
                        jne miny
                        
                        call letrex
                        call saisi
                        call cls
                        jmp min1
                        miny:
                        cmp H,25
                        
                        jne minz
                        
                        call letrey
                        call saisi
                        call cls
                        jmp min1
                        minz:
                        cmp H,26
                        
                        jne min11
                        
                        call letrez
                        call saisi
                        call cls
                        jmp min1
                        
                        min11:
                        call cls
                        jmp ltres
                        
                        
                          
                       ; finw:
                        ;fin:
            ;mov ah,4ch
            ;int 21h
code ends
        end debut