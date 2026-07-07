	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_s64_recover.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x16
                                        # implicit-def: $x10
	li	a1, 8
	li	a5, 63
	li	t0, 64
	li	a7, -1
	li	a4, 1
	li	a2, 4294967295
	li	a3, 4294967294
	add	a1, a6, a1
	lb	a1, 0(a1)
	zext.b	t1, a1
	zext.b	a5, a5
	and	a5, a5, t1
	ld	a6, 0(a6)
	seqz	t1, a6
	slli	t1, t1, 63
	srli	t1, t1, 63
	beqz	t1, .LBB0_2
# %bb.1:
	zext.b	a2, a5
	zext.b	a2, a2
	sll	a4, a4, a2
	j	.LBB0_8
.LBB0_2:
	zext.b	t1, a1
	zext.b	t0, t0
	and	t0, t0, t1
	zext.b	t0, t0
	sext.b	t0, t0
	seqz	t0, t0
	slt	a7, a7, a6
	slti	t1, a6, 1
	slli	a7, a7, 63
	srli	a7, a7, 63
	slli	t1, t1, 63
	srli	t1, t1, 63
	slli	t0, t0, 63
	srli	t0, t0, 63
	czero.eqz	a7, a7, t0
	czero.nez	t0, t1, t0
	or	a7, a7, t0
	neg	t0, a6
	slli	a7, a7, 63
	srli	a7, a7, 63
	czero.eqz	a6, a6, a7
	czero.nez	a7, t0, a7
	or	a6, a6, a7
	zext.b	a5, a5
	zext.b	a5, a5
	sll	a5, a4, a5
	sltu	a4, a5, a6
	slli	a4, a4, 63
	srli	a7, a4, 63
	li	a4, 0
	beqz	a7, .LBB0_8
# %bb.3:
	clz	a7, a6
	sll	a4, a6, a7
	sll	a7, a5, a7
	srli	a5, a4, 32
	divu	t0, a7, a5
	mul	a6, a5, t0
	sub	t3, a7, a6
	and	a6, a2, a4
	mul	t1, a6, t0
	slli	t3, t3, 32
	sltu	t2, t3, t1
	slli	t2, t2, 63
	srli	t4, t2, 63
	zext.w	t2, t0
	beqz	t4, .LBB0_5
# %bb.4:
	sub	t1, t1, t3
	sltu	t1, a4, t1
	slli	t1, t1, 63
	srli	t1, t1, 63
	czero.eqz	t2, a3, t1
	czero.nez	t1, a2, t1
	or	t1, t2, t1
	add	t0, t0, t1
	zext.w	t2, t0
.LBB0_5:
	slli	t0, a7, 32
	zext.w	a7, t2
	zext.w	a7, a7
	mul	t1, a7, a4
	sub	t1, t0, t1
	divu	t0, t1, a5
	mul	a5, a5, t0
	sub	t1, t1, a5
	mul	a5, a6, t0
	slli	t1, t1, 32
	sltu	a6, t1, a5
	slli	a6, a6, 63
	srli	t2, a6, 63
	zext.w	a6, t0
	beqz	t2, .LBB0_7
# %bb.6:
	sub	a5, a5, t1
	sltu	a4, a4, a5
	slli	a4, a4, 63
	srli	a4, a4, 63
	czero.eqz	a3, a3, a4
	czero.nez	a2, a2, a4
	or	a2, a3, a2
	add	a2, t0, a2
	zext.w	a6, a2
.LBB0_7:
	slli	a7, a7, 32
	zext.w	a2, a6
	zext.w	a4, a2
	ori	a2, a7, 1
	add	a4, a4, a2
.LBB0_8:
	neg	a2, a4
	zext.b	a1, a1
	sext.b	a1, a1
	sltz	a1, a1
	slli	a1, a1, 63
	srli	a1, a1, 63
	czero.eqz	a2, a2, a1
	czero.nez	a1, a4, a1
	or	a1, a2, a1
	sd	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
