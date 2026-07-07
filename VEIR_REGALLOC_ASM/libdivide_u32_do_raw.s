	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_u32_do_raw.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x11
                                        # implicit-def: $x14
                                        # implicit-def: $x13
                                        # implicit-def: $x10
	li	a5, 64
	li	a2, 31
	zext.w	a6, a4
	sext.w	a6, a6
	seqz	a6, a6
	slli	a6, a6, 63
	srli	a6, a6, 63
	beqz	a6, .LBB0_2
# %bb.1:
	zext.b	a2, a3
	j	.LBB0_5
.LBB0_2:
	zext.w	a6, a1
	zext.w	a6, a6
	zext.w	a4, a4
	zext.w	a4, a4
	mul	a4, a6, a4
	srli	a4, a4, 32
	zext.b	a3, a3
	zext.w	a6, a3
	zext.w	a5, a5
	and	a5, a5, a6
	zext.w	a5, a5
	sext.w	a5, a5
	seqz	a5, a5
	slli	a5, a5, 63
	srli	a5, a5, 63
	beqz	a5, .LBB0_4
# %bb.3:
	zext.w	a1, a4
	zext.w	a2, a3
	j	.LBB0_6
.LBB0_4:
	zext.w	a1, a1
	zext.w	a5, a4
	subw	a1, a1, a5
	zext.w	a1, a1
	srliw	a1, a1, 1
	zext.w	a1, a1
	zext.w	a4, a4
	addw	a1, a4, a1
	zext.w	a3, a3
	zext.w	a2, a2
	and	a2, a2, a3
.LBB0_5:
	zext.w	a1, a1
	zext.w	a2, a2
.LBB0_6:
	srlw	a1, a1, a2
	zext.w	a1, a1
	zext.w	a1, a1
	sw	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
