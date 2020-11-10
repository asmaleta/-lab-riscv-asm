.data
N:
.word 4
M:
.word 2
matrix:
.word -1,10, -1,0
.word -2, -2, 5,-20
result:
.word 0

.text

main:
lw a2, N
lw a3, M
la a4, matrix
call process
la a5, result
sw a1, 0(a5)
call exit

exit:
addi a0,x0,10
ecall

process:
addi s1, ra, 0

addi t4, x0, 0 # row now
addi t5, x0, 0 # result to save
init:
addi t3, x0, 0 # colum now

cycle:
lw a7, 0(a4) # load value from array
call checPossitive
add t5, t5, a1 # count sum
addi t3, t3, 1
addi a4, a4, 4 # increment array pointer
blt t3, a2, cycle


addi t4, t4, 1
blt t4, a3, init
addi a1, t5, 0
addi ra, s1, 0
ret


checPossitive: # функция провеверяет число на знак если <= 0 возвращает 0, иначе само число. В качестве аргумента принимается числовое значение  
addi t6, a7, 0 # load arg
bgtz t6, ans
addi t6, x0, 0
ans:
addi a1, t6, 0
ret
