# ________TEST________
# ********************
# addi $t7, $t7, 500000000000000
# sw $t7, 270794752($0)
# subi $t7, $t7, 500000000000000
# sw $t7, 270794756($0)
# addi $t7, $t7, 5
# sw $t7, 270794760($0)
# addi $t7, $t7, 5
# sw $t7, 270794764($0)
# addi $t7, $t7, 5
# sw $t7, 270794768($0)
# addi $t7, $t7, 5
# sw $t7, 270794772($0)
# addi $t7, $t7, 5
# sw $t7, 270794776($0)
# addi $t7, $t7, 5
# sw $t7, 270794780($0)
# ********************

lui $s0, 0x1024
addi $t0, $0, 0        # t0 = 0
for:
   lw $t1, 0($s0)      # t1 = s0[t0]
   mult $t1, $t1 	# t1 = t1^2
   mfhi $t1 		# t1 = hi 
   add $t3, $t3, $t1   # t3 = t3 + t1 (hi values)
   mflo $t2 		# t2 = lo
   add $t4, $t4, $t2   # t4 = t4 + t2 (lo values)
   addi $s0, $s0, 4    # s0 = s0 + 4 
   addi $t0, $t0, 1    # t0 = t0++
   beq $t0, 8, end     # if t0 == 8 end
   
   j for
end: