	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_s64_do_raw.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
                                        # implicit-def: $x11
                                        # implicit-def: $x16
                                        # implicit-def: $x12
                                        # implicit-def: $x10
	li	a4, 63
	li	a7, 4294967295
	li	a5, 64
	li	a3, 7
	li	t0, -1
	zext.b	a4, a4
	and	a4, a4, a2
	seqz	t1, a6
	slli	t1, t1, 63
	srli	t1, t1, 63
	beqz	t1, .LBB0_2
# %bb.1:
	zext.b	a4, a4
	zext.b	a4, a4
	sll	a5, t0, a4
	not	a5, a5
	slti	a6, a1, 0
	slli	a6, a6, 63
	srli	a6, a6, 63
	czero.eqz	a5, a5, a6
	add	a1, a1, a5
	sra	a1, a1, a4
	zext.b	a3, a3
	sext.b	a2, a2
	sra	a2, a2, a3
	zext.b	a2, a2
	sext.b	a2, a2
	xor	a1, a2, a1
	sub	a1, a1, a2
	sd	a0, 0(a1)
	ret
.LBB0_2:
	and	t0, a7, a1
	and	t1, a7, a6
	mul	t2, t0, t1
	srli	t2, t2, 32
	srai	t3, a1, 32
	mul	t1, t3, t1
	add	t1, t1, t2
	srai	a6, a6, 32
	mul	t0, t0, a6
	and	a7, a7, t1
	add	a7, t0, a7
	mul	a6, t3, a6
	srai	t0, t1, 32
	add	a6, a6, t0
	srai	a7, a7, 32
	add	a6, a7, a6
	zext.b	a5, a5
	and	a5, a5, a2
	zext.b	a5, a5
	sext.b	a5, a5
	seqz	a5, a5
	slli	a5, a5, 63
	srli	a5, a5, 63
	bnez	a5, .LBB0_4
# %bb.3:
	zext.b	a3, a3
	sext.b	a2, a2
	sra	a2, a2, a3
	zext.b	a2, a2
	sext.b	a2, a2
	xor	a1, a2, a1
	sub	a1, a1, a2
	add	a6, a6, a1
.LBB0_4:
	zext.b	a1, a4
	zext.b	a1, a1
	sra	a1, a6, a1
	srli	a2, a1, 63
	add	a1, a1, a2
	sd	a0, 0(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
