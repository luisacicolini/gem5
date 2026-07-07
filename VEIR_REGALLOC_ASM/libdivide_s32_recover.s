	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_s32_recover.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x16
                                        # implicit-def: $x10
	li	a1, 4
	li	a5, 31
	li	t0, 64
	li	a2, -1
	li	a7, 1
	li	a4, 32
	li	a3, 1
	add	a1, a6, a1
	lb	a1, 0(a1)
	zext.b	t1, a1
	zext.b	a5, a5
	and	a5, a5, t1
	lw	a6, 0(a6)
	zext.w	t1, a6
	sext.w	t1, t1
	seqz	t1, t1
	slli	t1, t1, 63
	srli	t1, t1, 63
	beqz	t1, .LBB0_2
# %bb.1:
	zext.b	a2, a5
	zext.b	a2, a2
	zext.w	a3, a7
	zext.w	a2, a2
	sllw	a2, a3, a2
	zext.w	a4, a2
	negw	a3, a4
	zext.b	a1, a1
	sext.b	a1, a1
	sltz	a1, a1
	zext.w	a3, a3
	zext.w	a2, a2
	slli	a1, a1, 63
	srli	a1, a1, 63
	czero.eqz	a3, a3, a1
	czero.nez	a1, a2, a1
	or	a1, a3, a1
	j	.LBB0_3
.LBB0_2:
	zext.b	t1, a1
	zext.b	t0, t0
	and	t0, t0, t1
	zext.b	t0, t0
	sext.b	t0, t0
	seqz	t0, t0
	zext.w	t1, a6
	zext.w	t2, a2
	sext.w	t1, t1
	sext.w	t2, t2
	slt	t1, t2, t1
	zext.w	t2, a6
	zext.w	a7, a7
	sext.w	t2, t2
	sext.w	a7, a7
	slt	a7, t2, a7
	slli	t1, t1, 63
	srli	t1, t1, 63
	slli	a7, a7, 63
	srli	a7, a7, 63
	slli	t0, t0, 63
	srli	t0, t0, 63
	czero.eqz	t1, t1, t0
	czero.nez	a7, a7, t0
	or	a7, t1, a7
	zext.w	t1, a6
	negw	t0, t1
	zext.w	a6, a6
	zext.w	t0, t0
	slli	a7, a7, 63
	srli	a7, a7, 63
	czero.eqz	a6, a6, a7
	czero.nez	a7, t0, a7
	or	a6, a6, a7
	zext.b	a5, a5
	zext.b	a4, a4
	or	a4, a4, a5
	zext.b	a4, a4
	zext.b	a4, a4
	sll	a3, a3, a4
	zext.w	a4, a6
	zext.w	a4, a4
	divu	a3, a3, a4
	zext.w	a4, a3
	addiw	a4, a4, 1
	zext.w	a3, a3
	zext.w	a2, a2
	xor	a2, a2, a3
	zext.b	a1, a1
	sext.b	a1, a1
	sltz	a1, a1
	zext.w	a2, a2
	zext.w	a3, a4
	slli	a1, a1, 63
	srli	a1, a1, 63
	czero.eqz	a2, a2, a1
	czero.nez	a1, a3, a1
	or	a1, a2, a1
.LBB0_3:
	zext.w	a1, a1
	zext.w	a1, a1
	sw	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
