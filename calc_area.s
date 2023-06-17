@ Comentário do código implementado..................................
@ Nome do autor
@ Data

.section .text
.global calc_square_area @................
.arch armv8-a @..............
.arm

calc_square_area: 
    MOV R5, LR
@ ..........................
    LDR  R0, =str_menu_in
    BL   printf      
@ .....................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D0, [R1]
    BL square_area  @ ..
@ .......................
    VMOV R2, R3, D0
    LDR R0, =str_out_float
    BL  printf
@ ....................
    B _exit_area_calc

square_area: @......
    VMOV S2, S0
    VMOV S3, S1
    VMUL.F64 D0, D0, D0
    BX LR


@Retangulo
calc_ret_area:
    MOV R5, LR
@..........................side 1
    LDR  R0, =str_menu_in_ret
    BL   printf     
@.....................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D1, [R1]
    BL ret_area  @ ..
@ ..........................side 2
    LDR  R0, =str_menu_in_ret
    BL   printf 
@......................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D2, [R1]
    BL ret_area
@ .......................
    VMOV R2, R3, D1
    VMOV R2, R3, D2
    LDR R0, =str_out_float_ret
    BL  printf
@ ....................
    B _exit_area_calc

ret_area: @......
    VMOV S2, S0
    VMOV S3, S1
    VMUL.F64 D3, D2, D1
    BX LR


_exit_area_calc: @ .....
    MOV LR, R5
    BX LR

.data
//.align 2 @ .....
buffer: .fill 1, 1, 0
//.align 2 
str_menu_in:    .asciz "\nIntroduza o valor do lado de um quadrado [cm]: "  @ .....
str_in_float:   .asciz "%lf"  @ .......
str_out_float:  .asciz "A área do quadrado é: %lf [cm2]\n"
str_in_ch:      .asciz "%c"
str_out_ch:     .asciz "%c\n"
// Ret
str_menu_in_ret:    .asciz "\nIntroduza o valor do lado de um retangulo [cm]: "  @ .....
str_out_float_ret:  .asciz "A área do retangulo é: %lf [cm2]\n"


