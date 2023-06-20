@ Beatriz Lopes 23926, Xavier Cruz 23762 
@ 20/06/2023

.section .text
.global calc_square_volume @................
.arch armv8-a @..............
.arm
@Cubo
calc_square_volume: 
    MOV R5, LR
@Get side
    LDR  R0, =v_str_menu_in
    BL   printf      
@scans R1, move R1->D2
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D2, [R1]
    BL square_volume  @ ..
@output
    VMOV R2, R3, D8
    LDR R0, =v_str_out__float
    BL  printf
@Exit
    B _exit_volume_calc

@mult D2^3
square_volume:
    VMOV S2, S0
    VMOV S3, S1
    VMUL.F64 D8, D2, D2 // D8=D2^2
    VMUL.F64 D8, D8, D2 // D8= D8*D2 (the same as D2^3)
    BX LR

@Paralelepípedo
calc_ret_volume:
    MOV R5, LR
@Get side
    LDR  R0, =v_str_menu_in_ret
    BL   printf     
    @scans R1, move R1->D3
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D3, [R1]
@side 2
    LDR  R0, =v_str_menu_in_ret
    BL   printf 
    @scans R1, move R1->D2
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D2, [R1]
@Height
    LDR  R0, =v_str_menu_in_ret
    BL   printf 
@scans R1, move R1->D4
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D4, [R1]
    BL ret_volume
@output
    VMOV R2, R3, D8
    LDR R0, =v_str_out__float_ret
    BL  printf
@ ....................
    B _exit_volume_calc

ret_volume: @Calcs volume of this
    VMOV S2, S0
    VMOV S3, S1
    VMUL.F64 D8, D2, D3 // D8=D2*D3
    VMUL.F64 D8, D8, D4 // D8=D8*D4
    BX LR

@Cilindro
calc_circle_volume: 
    MOV R5, LR
@Get side
    LDR  R0, =v_str_menu_in_circ
    BL   printf      
    @scans R1, move R1->D2
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D2, [R1]
    BL circle_volume  @ ..
@Get height
    LDR  R0, =v_str_menu_in_circ_h
    BL   printf
    @scans R1, move R1->D3
    LDR R0, =str_in_float   
    LDR R1, =buffer        
    BL scanf
    LDR R1, =buffer
    VLDR D3, [R1]
    BL circle_volume
@Output
    VMOV R2, R3, D8
    LDR R0, =v_str_out__float_circ
    BL  printf
@Exit
    B _exit_volume_calc

circle_volume: @...... 
    LDR R1, =pi
    VLDR S4, [R1]// loads pi
    VMUL.F64 D8, D2, D2 // D8=D2^2
    VCVT.F64.F32 D4, S4 // makes pi double float point
    VMUL.F64 D8, D8, D4 // D8= D8*D4(PI)
    VMUL.F64 D8, D8, D3 // D8= D8*D3 D3==H
    BX LR

@Prisma triangular
calc_tri_volume:
    MOV R5, LR
@Get side 1
    LDR  R0, =v_str_menu_in_tri
    BL   printf     
    @
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D3, [R1]
@Get side 2
    LDR  R0, =v_str_menu_in_tri
    BL   printf 
    @scans R1, move R1->D3
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D2, [R1]
    BL tri_volume
@Get Height
    LDR  R0, =v_str_menu_in_tri_h
    BL   printf 
@scans R1, move R1->D5
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D5, [R1]
    BL tri_volume
@output
    VMOV R2, R3, D8
    LDR R0, =v_str_out__float_tri
    BL  printf
@exit
    B _exit_volume_calc

tri_volume: @Calc triangular prims volume
    LDR R1, =v_dois // Get 0.5 because 1*0.5==1/2
    VLDR S4, [R1]   
    VMUL.F64 D8, D2, D3 // D8=D3*D2
    VCVT.F64.F32 D4, S4 // makes S4 double flout point
    VMUL.F64 D8, D8, D4 // D8=D8*D4
    VMUL.F64 D8, D8, D5 // D8=D8*D4
    BX LR

@ Prima de Trapezio
calc_trap_volume:
    MOV R5, LR
@Get base 1
    LDR  R0, =v_str_menu_in_trap
    BL   printf     
    @scans R1, move R1->D3
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D3, [R1]
@Get base 2
    LDR  R0, =v_str_menu_in_trap
    BL   printf 
    @scans R1, move R1->D2
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D2, [R1]
@Get height
    LDR  R0, =v_str_menu_in_trap_h
    BL   printf 
    @scans R1, move R1->D4
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D4, [R1]
    BL trap_volume
@Get the height of the prism
    LDR  R0, =v_str_menu_in_trap_h
    BL   printf 
    @scans R1, move R1->D6
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D6, [R1]
    BL trap_volume    
    @Output
    VMOV R2, R3, D8
    LDR R0, =v_str_out__float_ret
    BL  printf
@Exit
    B _exit_volume_calc

trap_volume: @Calc the volume
    LDR R1, =v_dois // Get 0.5 because 1*0.5==1/2
    VLDR S4, [R1]
    VCVT.F64.F32 D5, S4 // Makes S4 double float point
    VADD.F64 D8, D2, D3 // D8=D2*D3
    VMUL.F64 D8, D8, D4 // D8=D8*D4
    VMUL.F64 D8, D8, D5 // D8= D8*D5
    VMUL.F64 D8, D8, D6 // D8= D8*D6
    BX LR
@Prisma de Losango
calc_los_volume:
    MOV R5, LR
@Get side 1
    LDR  R0, =v_str_menu_in_los
    BL   printf     
    @scans R1, move R1->D3
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D3, [R1]
@Get side 2
    LDR  R0, =v_str_menu_in_los
    BL   printf 
    @scans R1, move R1->D3
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D2, [R1]
@Get height
    LDR  R0, =v_str_menu_in_los_h
    BL   printf 
    @scans R1, move R1->D4
    LDR R0, =v_str_in_float   
    LDR R1, =v_buffer        
    BL scanf
    LDR R1, =v_buffer
    VLDR D4, [R1]
    BL los_volume
    @output
    VMOV R2, R3, D8
    LDR R0, =v_str_out__float_ret
    BL  printf
    @quit
    B _exit_volume_calc

los_volume: @Calc Volume
    LDR R1, =v_dois // Get 0.5 because 1*0.5==1/2
    VLDR S4, [R1]
    VCVT.F64.F32 D5, S4 // Makes S4 double float point
    VMUL.F64 D8, D2, D3 // D8=D2*D3
    VMUL.F64 D8, D8, D5 // D8=D8*D5
    VMUL.F64 D8, D8, D4 // D8=D8*D4
    BX LR
_exit_volume_calc: @Exit
    MOV LR, R5
    BX LR
.data
//.align 2 @ .....
v_buffer: .fill 1, 1, 0
//.align 2 
v_str_menu_in:    .asciz "\nIntroduza o valor do lado do cubo [cm]: "  @ .....
v_str_in_float:   .asciz "%lf"  @ .......
v_str_out__float:  .asciz "O volume do cubo é: %lf [cm3]\n"
v_str_in_ch:      .asciz "%c"
v_str_out__ch:     .asciz "%c\n"
// Paralelepípedo
v_str_menu_in_ret:    .asciz "\nIntroduza o valor do lado de um paralelepípedo [cm]: "  @ .....
v_str_out__float_ret:  .asciz "O volume do paralelepípedo é: %lf [cm3]\n"
//Cilindro 
v_str_menu_in_circ:    .asciz "\nIntroduza o raio: "  @ .....
v_str_menu_in_circ_h:    .asciz "\nIntroduza a altura: "  @ .....
v_str_out__float_circ:  .asciz "O volume do cilindro é: %lf [cm3]\n"
//Prisma Triangular
v_str_menu_in_tri:    .asciz "\nIntroduza um lado do prisma triângular: "  @ .....
v_str_menu_in_tri_h:    .asciz "\nIntroduza um lado do triangulo: "  @ .....
v_str_out__float_tri:  .asciz "O volume do prisma triangular é: %lf [cm3]\n"
//Prisma com base de trapézio 
v_str_menu_in_trap:    .asciz "\nIntroduza uma das bases do Trapezio: "  @ .....
v_str_menu_in_trap_h:    .asciz "\nIntroduza uma das alturas do Trapezio: "  @ .....
v_str_out__float_trap:  .asciz "O volume do prisma com base de trapezio é: %lf [cm3]\n"
//Prisma com base de losango 
v_str_menu_in_los:    .asciz "\nIntroduza uma das diagnais do prisma com base de losango: "  @ .....
v_str_menu_in_los_h:    .asciz "\nIntroduza a altura do prisma com base de losango: "  @ .....
v_str_out__float_los:  .asciz "O volume do prisma com base de: %lf [cm3]\n"


.align 4
v_pi: .single 3.14
.align 4
v_dois: .single 0.5