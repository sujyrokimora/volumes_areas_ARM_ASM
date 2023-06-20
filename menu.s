@ Descrição do código................................
@ Autor
@ dATA

.include "calc_area.s" @ ..........................

.section .text
.global main 
.arm

main:
  @ ........................
  LDR  R0, =menu_main
  BL   printf       
  @ ........................
  LDR R0, =str_in_s  
  LDR R1, =buffer_in
  BL scanf
  LDR  R2, =buffer_in   
  LDRB R0, [R2, #0]  @ ...........................
  @ ........................
  CMP R0, #'1'
  BEQ op_area
  CMP R0, #'2'
  BEQ op_volume
  CMP R0, #'0'
  BEQ op_return
  B main

@ ..................
op_area: 
  LDR  R0, =menu_area    @ ..................
  BL   printf       @ ....................
  @ .....................
  LDR R0, =str_in_s  @ .................
  LDR R1, =buffer_in @ .................
  BL scanf    @ .................
  LDR  R2, =buffer_in   @ .................
  LDRB R0, [R2, #0]  @ .................
  @ ......................
  CMP R0, #'1' @ .................
  BLEQ calc_square_area

  CMP R0, #'2' @ .................
  BLEQ calc_ret_area

  CMP R0, #'3' @ .................
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
    
@ ................... 
op_volume: 
  LDR  R0, =menu_volume  
  BL   printf      
  BX LR

@ ............ 
op_return: 
  BL  _exit

@.............   
_exit:
  MOV R7, #1         @ Exit syscall
  SVC 0              @ Invoke

@ .................
.data
buffer_in: .fill 4, 1, 0 @ .....
str_in_s: .asciz "%s" @ Data format
@ Main menu
menu_main:      .asciz "\n--------MENU-----------\n 1) Cálculo de áreas\n 2) Cálculo de volumes\n 0) Sair\n-----------------------\n Introduza a sua opção: "
@ Area menu
menu_area:      .asciz "\n--CÁLCULO DE ÁREAS-----\n 1) Quadrado\n 2) Retangulo\n 3) Circulo\n 4) Triangulo\n 5) Trapezio\n 6) Losango\n 0) Sair\n-----------------------\n Introduza a sua opção: "
@ Volume menu
menu_volume:    .asciz "\n-CÁLCULO DE VOLUMES----\n 1) Cubo\n 2) Cilindro\n 3) Cone\n 4) Esfera\n 5) Pirâmide\n 6) ...\n 0) Sair\n-----------------------\n Introduza a sua opção: " 


