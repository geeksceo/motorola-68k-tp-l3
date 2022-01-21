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
    MOVE    D1,D5       taille du tableau
    SUB     #1,D5
    
    LEA     tab,A3
    MOVE    #0,D3
    
    MOVE    #13,D0
    LEA     enter_value,A1
    TRAP    #15
    BSR     boucle_saisir
    
     
    MOVE    #0,D3
    LEA     tab,A3
    
    MOVE    #14,D0
    LEA     text1,A1
    TRAP    #15
    BSR     affichage
    
    MOVE    #13,D0
    LEA     ligne,A1
    TRAP    #15
    *---------------------
    LEA     tab,A3
    MOVE    #0,D3
    MOVE    (A3),D7
    BSR minimum

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
minimum:
    ADD     #2,A3
    CMP     (A3),D7
    BLE     sauter
    MOVE    (A3),D7
sauter:
    ADD     #1,D3
    CMP     D3,D5
    BGT     minimum
   
    MOVE     D7,D1
    MOVE     #3,D0
    TRAP     #15
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
