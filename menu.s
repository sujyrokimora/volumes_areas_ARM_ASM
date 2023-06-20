@ Beatriz Lopes 23926, Xavier Cruz 23762 
@ 20/06/2023

.include "calc_area.s" @ ..........................
.include "calc_vol.s"

.section .text
.global main 
.arm

main:
  @Prints the main menu
  LDR  R0, =menu_main
  BL   printf       
  @Ask the user for a input
  LDR R0, =str_in_s  
  LDR R1, =buffer_in
  BL scanf
  LDR  R2, =buffer_in   
  LDRB R0, [R2, #0] 
  @IF THIS THAN THAT
  CMP R0, #'1'
  BEQ op_area
  CMP R0, #'2'
  BEQ op_volume
  CMP R0, #'0'
  BEQ op_return
  B main

@Menu of the areas functions
op_area:
  @Prints the area menu 
  LDR  R0, =menu_area
  BL   printf
  @Ask the user for a input
  LDR R0, =str_in_s  
  LDR R1, =buffer_in 
  BL scanf
  LDR  R2, =buffer_in
  LDRB R0, [R2, #0]
  @IF THIS THAN THAT
  CMP R0, #'1'
  BLEQ calc_square_area
  CMP R0, #'2'
  BLEQ calc_ret_area
  CMP R0, #'3'
  BLEQ calc_circle_area
  CMP R0, #'4'
  BLEQ calc_tri_area
  CMP R0, #'5'
  BLEQ calc_trap_area
  CMP R0, #'6'
  BLEQ calc_los_area
  CMP R0, #'0' 
  BEQ main
  B op_return
    
@Menu of the areas functions
op_volume:
  @Prints the main menu 
  LDR  R0, =menu_volume    
  BL   printf
  @Ask the user for a input
  LDR R0, =str_in_s
  LDR R1, =buffer_in
  BL scanf 
  LDR  R2, =buffer_in
  LDRB R0, [R2, #0]
  @IF THIS THAN THAT
  CMP R0, #'1'
  BLEQ calc_square_volume
  CMP R0, #'2'
  BLEQ calc_ret_volume
  CMP R0, #'3'
  BLEQ calc_circle_volume
  CMP R0, #'4'
  BLEQ calc_tri_volume
  CMP R0, #'5'
  BLEQ calc_trap_volume
  CMP R0, #'6'
  BLEQ calc_los_volume
  CMP R0, #'0' 
  BEQ main
  B op_return
    

@Exit the program
op_return: 
  BL  _exit

@Exit the program
_exit:
  MOV R7, #1         @ Exit syscall
  SVC 0              @ Invoke

@All strings and control vars stored here
.data
buffer_in: .fill 4, 1, 0 @ .....
str_in_s: .asciz "%s" @ Data format
@ Main menu
menu_main:      .asciz "\n--------MENU-----------\n 1) Cálculo de áreas\n 2) Cálculo de volumes\n 0) Sair\n-----------------------\n Introduza a sua opção: "
@ Area menu
menu_area:      .asciz "\n--CÁLCULO DE ÁREAS-----\n 1) Quadrado\n 2) Retangulo\n 3) Circulo\n 4) Triangulo\n 5) Trapezio\n 6) Losango\n 0) Sair\n-----------------------\n Introduza a sua opção: "
@ Volume menu
menu_volume:    .asciz "\n-CÁLCULO DE VOLUMES----\n 1) Cubo\n 2) Paralelepípedo \n 3) Cilindro\n 4) Prisma triangular\n 5) Prisma de Trapezio\n 6) Prisma de Losango\n 0) Sair\n-----------------------\n Introduza a sua opção: " 

