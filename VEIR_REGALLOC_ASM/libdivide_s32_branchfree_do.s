	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_s32_branchfree_do.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x11
                                        # implicit-def: $x12
                                        # implicit-def: $x10
	li	a3, 4
	li	a4, 31
	li	a5, 7
	li	a6, 1
	add	a3, a2, a3
	lb	a3, 0(a3)
	zext.b	a7, a3
	zext.b	a4, a4
	and	a4, a4, a7
	zext.b	a3, a3
	zext.b	a5, a5
	sext.b	a3, a3
	sra	a3, a3, a5
	zext.b	a3, a3
	sext.b	a3, a3
	lw	a2, 0(a2)
	zext.w	a5, a1
	sext.w	a5, a5
	zext.w	a7, a2
	sext.w	a7, a7
	mul	a5, a5, a7
	srli	a5, a5, 32
	zext.w	a1, a1
	zext.w	a5, a5
	addw	a1, a5, a1
	zext.w	a2, a2
	sext.w	a2, a2
	seqz	a2, a2
	slli	a2, a2, 63
	srli	a2, a2, 63
	slli	a2, a2, 63
	srai	a2, a2, 63
	zext.b	a4, a4
	zext.b	a4, a4
	zext.w	a5, a6
	zext.w	a6, a4
	sllw	a5, a5, a6
	zext.w	a5, a5
	zext.w	a2, a2
	addw	a2, a2, a5
	zext.w	a5, a1
	sext.w	a5, a5
	sext.w	a6, zero
	slt	a5, a5, a6
	zext.w	a2, a2
	slli	a5, a5, 63
	srli	a5, a5, 63
	czero.eqz	a2, a2, a5
	zext.w	a2, a2
	zext.w	a1, a1
	addw	a1, a1, a2
	zext.w	a1, a1
	zext.w	a2, a4
	sraw	a1, a1, a2
	zext.w	a1, a1
	zext.w	a2, a3
	xor	a1, a2, a1
	zext.w	a1, a1
	zext.w	a2, a3
	subw	a1, a1, a2
	zext.w	a1, a1
	sw	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
