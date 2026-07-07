	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_internal_u64_gen      # -- Begin function libdivide_internal_u64_gen
	.p2align	2
	.type	libdivide_internal_u64_gen,@function
libdivide_internal_u64_gen:             # @libdivide_internal_u64_gen
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	srli	a5, a0, 32
	beqz	a5, .LBB0_5
# %bb.1:                                # %.preheader30
	srli	a3, a5, 24
	bnez	a3, .LBB0_9
# %bb.2:                                # %.lr.ph.preheader
	lui	a4, 1044480
	li	a3, 8
.LBB0_3:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	srliw	a4, a4, 8
	and	a6, a4, a5
	addi	a3, a3, 8
	beqz	a6, .LBB0_3
# %bb.4:                                # %.preheader28
	and	a6, a4, a5
	bnez	a6, .LBB0_10
	j	.LBB0_16
.LBB0_5:
	sext.w	a3, a0
	beqz	a3, .LBB0_11
# %bb.6:                                # %.preheader27
	srliw	a3, a0, 24
	bnez	a3, .LBB0_12
# %bb.7:                                # %.lr.ph46.preheader
	lui	a4, 1044480
	li	a3, 8
.LBB0_8:                                # %.lr.ph46
                                        # =>This Inner Loop Header: Depth=1
	srliw	a4, a4, 8
	and	a6, a4, a0
	addi	a3, a3, 8
	beqz	a6, .LBB0_8
	j	.LBB0_13
.LBB0_9:
	li	a3, 8
	lui	a4, 1044480
	and	a6, a4, a5
	beqz	a6, .LBB0_16
.LBB0_10:                               # %.lr.ph44
                                        # =>This Inner Loop Header: Depth=1
	slliw	a4, a4, 1
	and	a6, a4, a5
	addi	a3, a3, -1
	bnez	a6, .LBB0_10
	j	.LBB0_16
.LBB0_11:
	li	a3, 32
	j	.LBB0_15
.LBB0_12:
	li	a3, 8
	lui	a4, 1044480
.LBB0_13:                               # %.preheader25
	and	a6, a4, a0
	sext.w	a6, a6
	beqz	a6, .LBB0_15
.LBB0_14:                               # %.lr.ph50
                                        # =>This Inner Loop Header: Depth=1
	slli	a4, a4, 1
	and	a6, a4, a0
	sext.w	a6, a6
	addi	a3, a3, -1
	bnez	a6, .LBB0_14
.LBB0_15:                               # %.loopexit26
	addi	a3, a3, 32
.LBB0_16:                               # %.loopexit29
	cpop	a4, a0
	li	a6, 63
	li	a7, 1
	sub	a3, a6, a3
	bltu	a7, a4, .LBB0_18
# %bb.17:
	li	a5, 0
	sext.w	a1, a1
	snez	a0, a1
	sub	a3, a3, a0
	j	.LBB0_44
.LBB0_18:
	bset	a4, zero, a3
	bgeu	a4, a0, .LBB0_24
# %bb.19:
	beqz	a5, .LBB0_25
# %bb.20:                               # %.preheader24
	srli	a6, a5, 24
	bnez	a6, .LBB0_29
# %bb.21:                               # %.lr.ph52.preheader
	lui	a7, 1044480
	li	a6, 8
.LBB0_22:                               # %.lr.ph52
                                        # =>This Inner Loop Header: Depth=1
	srliw	a7, a7, 8
	and	t0, a7, a5
	addi	a6, a6, 8
	beqz	t0, .LBB0_22
# %bb.23:                               # %.preheader22
	and	t0, a7, a5
	bnez	t0, .LBB0_30
	j	.LBB0_36
.LBB0_24:
	li	a6, -1
	li	a5, -1
	sext.w	a1, a1
	beqz	a1, .LBB0_41
	j	.LBB0_42
.LBB0_25:
	sext.w	a5, a0
	beqz	a5, .LBB0_31
# %bb.26:                               # %.preheader21
	srliw	a5, a0, 24
	bnez	a5, .LBB0_32
# %bb.27:                               # %.lr.ph58.preheader
	lui	a6, 1044480
	li	a5, 8
.LBB0_28:                               # %.lr.ph58
                                        # =>This Inner Loop Header: Depth=1
	srliw	a6, a6, 8
	and	a7, a6, a0
	addi	a5, a5, 8
	beqz	a7, .LBB0_28
	j	.LBB0_33
.LBB0_29:
	li	a6, 8
	lui	a7, 1044480
	and	t0, a7, a5
	beqz	t0, .LBB0_36
.LBB0_30:                               # %.lr.ph56
                                        # =>This Inner Loop Header: Depth=1
	slliw	a7, a7, 1
	and	t0, a7, a5
	addi	a6, a6, -1
	bnez	t0, .LBB0_30
	j	.LBB0_36
.LBB0_31:
	li	a5, 32
	j	.LBB0_35
.LBB0_32:
	li	a5, 8
	lui	a6, 1044480
.LBB0_33:                               # %.preheader
	and	a7, a6, a0
	sext.w	a7, a7
	beqz	a7, .LBB0_35
.LBB0_34:                               # %.lr.ph62
                                        # =>This Inner Loop Header: Depth=1
	slli	a6, a6, 1
	and	a7, a6, a0
	sext.w	a7, a7
	addi	a5, a5, -1
	bnez	a7, .LBB0_34
.LBB0_35:                               # %.loopexit
	addi	a6, a5, 32
.LBB0_36:                               # %.loopexit23
	sll	a5, a0, a6
	sll	t0, a4, a6
	srli	a6, a5, 32
	divu	t1, t0, a6
	mul	t3, t1, a6
	zext.w	a7, a5
	mul	t2, a7, t1
	sub	t3, t0, t3
	slli	t3, t3, 32
	bgeu	t3, t2, .LBB0_38
# %bb.37:
	sub	t2, t2, t3
	li	t3, -1
	sltu	t2, a5, t2
	srli	t3, t3, 32
	xor	t2, t2, t3
	add	t1, t2, t1
.LBB0_38:
	zext.w	t1, t1
	mul	t2, a5, t1
	slli	t0, t0, 32
	sub	t2, t0, t2
	divu	t0, t2, a6
	mul	t3, t0, a6
	mul	a6, t0, a7
	sub	a7, t2, t3
	slli	a7, a7, 32
	bgeu	a7, a6, .LBB0_40
# %bb.39:
	sub	a6, a6, a7
	li	a7, -1
	sltu	a5, a5, a6
	srli	a6, a7, 32
	xor	a5, a5, a6
	add	t0, a5, t0
.LBB0_40:
	pack	a5, t0, t1
	mul	a6, a0, a5
	neg	a6, a6
	sext.w	a1, a1
	bnez	a1, .LBB0_42
.LBB0_41:
	sub	a1, a0, a6
	bltu	a1, a4, .LBB0_43
.LBB0_42:
	slli	a1, a6, 1
	sltu	a0, a1, a0
	xori	a0, a0, 1
	srli	a1, a6, 63
	or	a0, a1, a0
	sh1add	a5, a5, a0
	ori	a3, a3, 64
.LBB0_43:
	addi	a5, a5, 1
.LBB0_44:
	sd	a5, 0(a2)
	sb	a3, 8(a2)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_internal_u64_gen, .Lfunc_end0-libdivide_internal_u64_gen
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
