.data
N:
.word 4
M:
.word 4
matrix:
.word 4, 1, 1, 4
.word 1, 4, 4, 1
.word 1, 4, 4, 1
.word 4, 1, 1, 4
result:
.word 0

.text

main:

la a2, N
la a3, M
la a4, matrix
la a5, result

#push on stack
addi sp, sp, -4
sw a4, 0(sp)
addi sp, sp, -4
sw a2, 0(sp)
addi sp, sp, -4
sw a3, 0(sp)
call process
call print
call exit



print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a5)
ecall
ret


exit:
addi a0, x0, 10
ecall



process:
addi sp, sp, 0
lw a6, 0(sp)
lw t1, 0(a6) #N

addi sp, sp, 4
lw a6, 0(sp)
lw t2, 0(a6) #M
#to matrix
addi sp, sp, 4

addi t4, x0, 0 # row
addi t0, x0, 0
addi t5, x0, 0 # result
init:
addi t3, x0, 0 # row element number
cycle:
#chose elem from stack
lw a6, 0(sp)
add a6, a6, t0
lw t6, 0(a6)

lw t6, 0(a6) 
add t5, t5, t6 # count sum
addi t0, t0, 4
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
sw t5, 0(a5) # save result to resulting array
ret