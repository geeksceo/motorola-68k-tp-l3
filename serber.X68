*-----------------------------------------------------------
* Title      :    TP3 serber
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    MOVE    #14,D0
    LEA     enterN,A1
    TRAP    #15
    
    MOVE    #4,D0
    TRAP    #15
    MOVE    D1,D5
    SUB     #1,D5
    
    LEA     tab,A3
    MOVE    #0,D3
    
    MOVE    #14,D0
    LEA     enter_value,A1
    TRAP    #15
    BSR     boucle_saisir
     
    MOVE    #0,D3
    LEA     tab,A3
    
    MOVE    #14,D0
    LEA     text1,A1
    TRAP    #15
    BSR     affichage
    
    MOVE    #13, D0
    LEA     ligne, A1
    TRAP    #15
    
    BSR     triselectif
    
    MOVE    #14, D0
    LEA     text2, A1
    TRAP    #15
    BSR     affichage 
    

* Put program code here

    SIMHALT             ; halt simulator
    
boucle_saisir
    MOVE    #4, D0
    TRAP    #15
    MOVE    D1, (A3)+
    ADD     #1, D3
    CMP     D3, D5
    BGE     boucle_saisir
    RTS
    
affichage
    MOVE    (A3)+, D1
    MOVE    #3, D0
    TRAP    #15
    MOVE    #14, D0
    LEA     espace, A1
    TRAP    #15
    ADD     #1, D3
    CMP     D3, D5
    BGE     affichage
    RTS
triselectif 
    MOVE    #1, D2
    LEA     tab, A2
boucle1
    MOVE    D2, D3
    MOVEA    A2, A3
    MOVE    D2, D4
    MOVEA    A2,A4
boucle2
    ADD     #1, D3
    ADD     #2, A3
    MOVE    (A4),D7
    CMP     (A3),D7
    BLE     verifi
    MOVEA    A3,A4
    MOVE    D3, D4
verifi
    CMP     D3, D5
    BGE     boucle2
debutMAJ
    CMP     D4,D2
    BGE     sauterMAJ
    MOVE    (A4),D6
    MOVE    (A2),(A4)
    MOVE    D6, (A2)
sauterMAJ
    ADD     #1, D2
    ADD     #2, A2
    CMP     D2, D5
    BGE     boucle1   
    
    MOVE    #0, D3
    LEA     tab, A3
    RTS 
    
* Put variables and constants here
    
tab         ds.w        40
enterN      dc.b        'ENTRER LA TAILLE DU TABLEAU: ',0
enter_value dc.b        'ENTRER LES ELEMENTS DU TABLEAU: ' ,0
text2        dc.b        'LES ELEMENTS TRIES SONT: ',0
text1       dc.b        'LES ELEMENTS DU TABLEAU SONT: ',0
espace      dc.b        '   ',0
ligne       dc.b        ' ' ,0

    END    START        ; last line of source














*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
