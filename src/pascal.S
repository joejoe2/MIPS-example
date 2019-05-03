main:
    addi $a0, $zero, 10 # n = 10
    addi $a1, $zero, 5 # m = 5
    add $s2,$zero,$zero
    jal pascal          # call pascal(10, 5)
    j exit
    
pascal:
    addi $sp, $sp, -20
    sw $ra, 8($sp)    # Save $ra register into stack
    sw $a0,0($sp)
    sw $a1,4($sp)
    sw $s0,12($sp)
    sw $s1,16($sp)
    #--------------------------------------#
    beq $a0,$a1,return
    beq $zero,$a1,return
    #--------------------------------------#
    
    lw $a0,0($sp)
    lw $a1,4($sp)
    addi $a0, $a0, -1 # n-1
    addi $a1, $a1, -1  # m-1
    jal pascal
    add $s0,$zero,$v0
    lw $a0,0($sp)
    lw $a1,4($sp)
    addi $a0, $a0, -1 # n-1
    addi $a1, $a1, 0  # m
    jal pascal
    add $s1,$zero,$v0
    add $v0,$s0,$s1
    j finish
return:
    addi $v0,$zero,1
    #addi $sp, $sp, 20
    #jr $ra
finish:
    lw $s0,12($sp)
    lw $s1,16($sp)       
    lw $ra, 8($sp)    # Load $ra register from stack
    addi $sp, $sp, 20
    jr $ra

exit:
    
