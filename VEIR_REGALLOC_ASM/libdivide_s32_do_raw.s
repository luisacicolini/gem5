	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_s32_do_raw.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x11
                                        # implicit-def: $x16
                                        # implicit-def: $x13
                                        # implicit-def: $x10
	li	a2, 31
	li	a7, 64
	li	a4, 7
	li	a5, -1
	zext.b	a2, a2
	and	a2, a2, a3
	zext.w	t0, a6
	sext.w	t0, t0
	seqz	t0, t0
	slli	t0, t0, 63
	srli	t0, t0, 63
	beqz	t0, .LBB0_2
# %bb.1:
	zext.b	a4, a4
	sext.b	a3, a3
	sra	a3, a3, a4
	zext.b	a3, a3
	sext.b	a3, a3
	zext.b	a2, a2
	zext.b	a2, a2
	zext.w	a4, a5
	zext.w	a6, a2
	sllw	a4, a4, a6
	zext.w	a4, a4
	zext.w	a5, a5
	xor	a4, a5, a4
	zext.w	a5, a1
	sext.w	a5, a5
	sext.w	a6, zero
	slt	a5, a5, a6
	zext.w	a4, a4
	slli	a5, a5, 63
	srli	a5, a5, 63
	czero.eqz	a4, a4, a5
	zext.w	a4, a4
	zext.w	a1, a1
	addw	a1, a1, a4
	zext.w	a1, a1
	zext.w	a2, a2
	sraw	a1, a1, a2
	zext.w	a1, a1
	zext.w	a2, a3
	xor	a1, a2, a1
	zext.w	a1, a1
	zext.w	a2, a3
	subw	a1, a1, a2
	j	.LBB0_5
.LBB0_2:
	zext.w	a5, a1
	sext.w	a5, a5
	zext.w	a6, a6
	sext.w	a6, a6
	mul	a5, a5, a6
	srli	a5, a5, 32
	zext.b	a6, a7
	and	a6, a6, a3
	zext.b	a6, a6
	sext.b	a6, a6
	seqz	a6, a6
	slli	a6, a6, 63
	srli	a7, a6, 63
	zext.w	a6, a5
	bnez	a7, .LBB0_4
# %bb.3:
	zext.b	a4, a4
	sext.b	a3, a3
	sra	a3, a3, a4
	zext.b	a3, a3
	sext.b	a3, a3
	zext.w	a1, a1
	zext.w	a4, a3
	xor	a1, a4, a1
	zext.w	a1, a1
	zext.w	a3, a3
	subw	a1, a1, a3
	zext.w	a1, a1
	zext.w	a3, a5
	addw	a1, a3, a1
	zext.w	a6, a1
.LBB0_4:
	zext.b	a1, a2
	zext.b	a1, a1
	zext.w	a2, a6
	zext.w	a1, a1
	sraw	a1, a2, a1
	zext.w	a2, a1
	srliw	a2, a2, 31
	zext.w	a2, a2
	zext.w	a1, a1
	addw	a1, a1, a2
.LBB0_5:
	zext.w	a1, a1
	zext.w	a1, a1
	sw	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
