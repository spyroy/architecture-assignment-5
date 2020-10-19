addi $s1, $0, 1			# s1 = 1
addi $s2, $0, 1			# s2 = 1
addi $s3, $0, 1			# s3 = 1
addi $t5, $0, 0			# t5 = 0

for:
    mult  $s1, $s2		# l0 = s1*s2
    mflo $t0			# t0 = lo (s1*s2)
    mult $t0, $s3		# lo = s1*s2*s3
    mflo $t1			# t1 = lo (s1*s2*s3)
    add $s6, $s6, $t1		# s6 = s6 + t1
    addi $s1, $s1, 2		# s1 = s1 + 2 (odd numbers)
    mul $s2, $s2, 2		# s2 = s2*2
    mul $s3, $s3, -1		# s3 = s3*(-1) 
    addi $t5, $t5, 1		# t5++
    beq, $t5, 10, end		# if t5 == 10 end
	
    j for
	
end: