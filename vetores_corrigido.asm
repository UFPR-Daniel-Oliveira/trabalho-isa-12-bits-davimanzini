addi r2, 0        ; i = 0

addi r3, 0        ; a = 0

addi r4, 7       
addi r4, 3        ; b = 10

add r5, r4
add r5, r4        
add r5, r4        ; c = 30

add r6, r4

1FOR:
    sub r7, r7
    add r7, r2           ; guarda em r7 o valor de r2;
    sub r2, r6    
    bpos r2, fora_for1(7)    ; sub e bpos fazem um bge
    add r3, r7           ; endereco a + i;
    sw r3, r7            ; conteudo de r7 salvo no endereço r3 
    sub r2, r2           ; zerar r2
    add r2, r7           ; essas duas linhas zeram i e igualam ele a i auxiliar
    addi r2, 1
    jal 1FOR

-----------

fora_for1:
    sub r2, r2
    sub r6, r6
    add r6, r7
    add r15, r6.       r15 = 10
    addi r6, 1         r6 = 11

2FOR:
    sub r8, r8
    addi r8, 7
    addi r8, 3     r8 = 10

    sub r4, r4     zerando r4;
    addi r4, 7       
    addi r4, 3        ; b = 10

    addi r2, 1
    sub r7, r7
    add r7, r2           ; guarda em r7 o valor de r2;
    sub r2, r6    
    bpos r2, fora_for2(7)    ; sub e bpos fazem um bge
    sub r8, r7           ; 10 - i
    add r4, r7           ; b + i
    sw r4, r8            ; guarda o 10 - i 
    sub r2, r2           ; zerar r2
    add r2, r7           ; essas duas linhas zeram i e igualam ele a i auxiliar
    jal 2FOR

fora_for2:
    sub r7, r7
    sub r2, r2

---------------------

add r7, r2 ;guarda em r7 o valor de r2
sub r3, r3 ; a = 0
sub r4, r4 ; zera B
add r4, r15 ; b = 10
addi r4, 1; b = 11
sub r5, r5
add r5, r4; c = 11
add r5, r5; c = 22
addi r5, 7;  c = 29.
addi r5, 1; c = 30.
sub r7, r7

3FOR:
sub r2, r2
add r2, r7
addi r2, 1;

add r4, r7; b + i
add r3, r7; a + i
add r5, r7; c + i

sub r7, r7
add r7, r2
sub r2, r15 ; i - 10
bpos r2, fora_for3()
lw r4, r4; carrega b[i]
lw r3, r3; carrega a[i]
add r10, r4
add r10, r3 ; r10 = b[i] + a[i]
sw r5, r10; c[i] = a[i] + b[i]
jal 3FOR
----------------------------------------------------------------------------------------------

Instrução 
tipo R: [11:8]Rd   [7:4]R2   [0:3]Opcode
tipo I: [11:8]Rd   [7:4]Imediato   [0:3]Opcode
tipo J: [11:4]Imediato   [0:3]Opcode


Primeiro for(preenchendo apenas o vetor A):

001000001011		//addi r2, 0
001100001011		//addi r3, 0
010001111011		//addi r4, 7
010000111011		//addi r4, 3
010101000001		//add r5, r4
010101000001		//add r5, r4
010101000001		//add r5, r4
011001000001		//add r6, r4

011101110010		//sub r7, r7
011100100001		//add r7, r2
001001100010		//sub r2, r6
001001101000		//bpos r2, fora_if1(6)
011101111001		//sw r7, r7
001000100010		//sub r2, r2
001001110001		//add r2, r7
001000011011		//addi r2, 1
111110000111		//jal 1for (-8)

HEXADECIMAL:

20b
30b
47b
43b
541
541
541
641

772
721
262
268
779
222
271
21b
f87



Segundo for(preenchendo apenas o vetor B):

001000100010 //sub r2, r2
011001100010 //sub r6, r6
011001110001 //add r6, r7
111101100001 //add r15, r6
011000011011 //addi r6, 1

100010000010 //sub r8, r8
100001111011 //addi r8, 7
100000111011 //addi r8, 3

010001000010 //sub r4, r4
010001111011 //addi r4, 7
010000111011 //addi r4, 3

001000011011 //addi r2, 1
011101110010 /sub r7, r7
011100100001 //add r7, r2
001001100010 //sub r2, r6
001001111000 //bpos r2, fora_if2(7)
100001110010 //sub r8, r7
010001110001 //add r4, r7
010010001001 //sw r4, r8
001000100010 //sub r2, r2
001001110001 //add r2, r7
111100000111 //jal, 2FOR (-16)

011101110010 //sub r7, r7
001000100010 //sub r2, r2

HEXADECIMAL: 

222
662
671
F61
61B
882
87B
83B
442
47B
43B
21B
772
721
262
278
872
471
489
222
271
F07
772
222


Terceiro for(vetor C):


011100100001 //add r7, r2
001100110010 //sub r3, r3
010001000010 //sub r4, r4
010011110001 //add r4, r15
010000011011 //addi r4, 1
010101010010 //sub r5, r5
010101000001 //add r5, r4
010101010001 //add r5, r5
010101111011 //addi r5, 7
010100011011 //addi r5, 1
011101110010 //sub r7, r7


001000100010 //sub r2, r2
001001110001 //add r2, r7
001000011011 //addi r2, 1

010001110001 //add r4, r7
001101110001 //add r3, r7
010101110001 //add r5, r7

011101110010 //sub r7, r7
011100100001 //add r7, r2
001011110010 //sub r2, r15
001001111000 //bpos r2, fora_for3(7)
010001001010 //lw r4, r4
001100111010 //lw r3, r3
101001000001 //add r10, r4
101000110001 //add r10, r3
010110101001 //sw r5, r10
111100010111 //jal 3FOR


HEXADECIMAL:

721
332
442
4f1
41b
552
541
551
57b
51b
772

222
271
21b

471
371
571

772
721
2f2
278
44a
33a
a41
a31
5a9
f17