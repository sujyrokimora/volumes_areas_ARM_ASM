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
    VLDR D2, [R1]
    BL square_area  @ ..
@ .......................
    VMOV R2, R3, D8
    LDR R0, =str_out_float
    BL  printf
@ ....................
    B _exit_area_calc

square_area: @......
    VMOV S2, S0
    VMOV S3, S1
    VMUL.F64 D8, D2, D2
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
    VLDR D3, [R1]
   // BL ret_area  @ ..
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
    VMOV R2, R3, D8
    LDR R0, =str_out_float_ret
    BL  printf
@ ....................
    B _exit_area_calc

ret_area: @......
    VMOV S2, S0
    VMOV S3, S1
    VMUL.F64 D8, D2, D3
    BX LR
@............Circle
calc_circle_area: 
    MOV R5, LR
@ ..........................
    LDR  R0, =str_menu_in
    BL   printf      
@ .....................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D2, [R1]
    BL circle_area  @ ..
@ .......................
    VMOV R2, R3, D8
    LDR R0, =str_out_float
    BL  printf
@ ....................
    B _exit_area_calc

circle_area: @...... 
    LDR R1, =pi
    VLDR S4, [R1]
    VMUL.F64 D8, D2, D2
    VCVT.F64.F32 D4, S4
    VMUL.F64 D8, D8, D4
    BX LR

@Retangulo
calc_tri_area:
    MOV R5, LR
@..........................side 1
    LDR  R0, =str_menu_in_tri
    BL   printf     
@.....................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D3, [R1]
   // BL tri_area  @ ..
@ ..........................side 2
    LDR  R0, =str_menu_in_tri
    BL   printf 
@......................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D2, [R1]
    BL tri_area
@ .......................
    VMOV R2, R3, D8
    LDR R0, =str_out_float_tri
    BL  printf
@ ....................
    B _exit_area_calc

tri_area: @......
    LDR R1, =dois
    VLDR S4, [R1]
    VMUL.F64 D8, D2, D3
    VCVT.F64.F32 D4, S4
    VMUL.F64 D8, D8, D4
    BX LR

@Trapezio
calc_trap_area:
    MOV R5, LR
@..........................side 1
    LDR  R0, =str_menu_in_trap
    BL   printf     
@.....................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D3, [R1]
   // BL ret_area  @ ..
@ ..........................side 2
    LDR  R0, =str_menu_in_trap
    BL   printf 
@......................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D2, [R1]
    BL trap_area
@ ..........................h
    LDR  R0, =str_menu_in_trap_h
    BL   printf 
@......................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D4, [R1]
    BL trap_area


@ .......................
    VMOV R2, R3, D8
    LDR R0, =str_out_float_ret
    BL  printf
@ ....................
    B _exit_area_calc

trap_area: @......
    LDR R1, =dois
    VLDR S4, [R1]
    VCVT.F64.F32 D5, S4
    VADD.F64 D8, D2, D3
    VMUL.F64 D8, D8, D4
    VMUL.F64 D8, D8, D5
    BX LR
@Losango
calc_los_area:
    MOV R5, LR
@..........................side 1
    LDR  R0, =str_menu_in_trap
    BL   printf     
@.....................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D3, [R1]
   // BL ret_area  @ ..
@ ..........................side 2
    LDR  R0, =str_menu_in_trap
    BL   printf 
@......................
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D2, [R1]
    BL los_area
@ .......................
    VMOV R2, R3, D8
    LDR R0, =str_out_float_ret
    BL  printf
@ ....................
    B _exit_area_calc

los_area: @......
    LDR R1, =dois
    VLDR S4, [R1]
    VCVT.F64.F32 D5, S4
    VADD.F64 D8, D2, D3
    VMUL.F64 D8, D8, D5
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
//Circle
str_menu_in_circ:    .asciz "\nIntroduza o raio: "  @ .....
str_out_float_circ:  .asciz "A área do circulo é: %lf [cm2]\n"
//Triangulo
str_menu_in_tri:    .asciz "\nIntroduza um lado do triangulo: "  @ .....
str_out_float_tri:  .asciz "A área do triangulo é: %lf [cm2]\n"
//Trapezio
str_menu_in_trap:    .asciz "\nIntroduza uma das bases do Trapezio: "  @ .....
str_menu_in_trap_h:    .asciz "\nIntroduza a altura do Trapezio: "  @ .....
str_out_float_trap:  .asciz "A área do Trapezio é: %lf [cm2]\n"
//Los
str_menu_in_los:    .asciz "\nIntroduza uma das diagnais do losango: "  @ .....
str_out_float_trap:  .asciz "A área do Trapezio é: %lf [cm2]\n"

.align 4
pi: .single 3.14
.align 4
dois: .single 0.5