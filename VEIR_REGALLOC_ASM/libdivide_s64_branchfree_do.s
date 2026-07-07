	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_s64_branchfree_do.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x10
                                        # implicit-def: $x11
                                        # implicit-def: $x12
	li	a3, 8
	li	a4, 63
	li	a5, 7
	li	a6, 4294967295
	li	a7, 1
	add	a3, a1, a3
	lb	a3, 0(a3)
	zext.b	t0, a3
	zext.b	a4, a4
	and	a4, a4, t0
	zext.b	a3, a3
	zext.b	a5, a5
	sext.b	a3, a3
	sra	a3, a3, a5
	zext.b	a3, a3
	sext.b	a3, a3
	ld	a1, 0(a1)
	and	a5, a6, a0
	and	t0, a6, a1
	mul	t1, a5, t0
	srli	t1, t1, 32
	srai	t2, a0, 32
	mul	t0, t2, t0
	add	t0, t0, t1
	srai	t1, a1, 32
	mul	a5, a5, t1
	and	a6, a6, t0
	add	a5, a5, a6
	mul	a6, t2, t1
	srai	t0, t0, 32
	srai	a5, a5, 32
	add	a0, a0, a6
	add	a0, t0, a0
	add	a0, a5, a0
	seqz	a1, a1
	slli	a1, a1, 63
	srli	a1, a1, 63
	slli	a1, a1, 63
	srai	a1, a1, 63
	zext.b	a4, a4
	zext.b	a4, a4
	sll	a5, a7, a4
	add	a1, a1, a5
	slti	a5, a0, 0
	slli	a5, a5, 63
	srli	a5, a5, 63
	czero.eqz	a1, a1, a5
	add	a0, a0, a1
	sra	a0, a0, a4
	xor	a0, a3, a0
	sub	a0, a0, a3
	sd	a2, 0(a0)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
