	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_internal_u64_gen.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	s0, 40(sp)                      # 8-byte Folded Spill
	sd	s1, 32(sp)                      # 8-byte Folded Spill
	sd	s2, 24(sp)                      # 8-byte Folded Spill
	sd	s3, 16(sp)                      # 8-byte Folded Spill
	sd	s4, 8(sp)                       # 8-byte Folded Spill
	sd	s5, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	.cfi_offset s5, -48
                                        # implicit-def: $x12
                                        # implicit-def: $x14
                                        # implicit-def: $x10
	li	t5, 16777216
	li	t2, 8
	li	t3, -16777216
	li	t6, 32
	li	a7, 63
	li	t1, 1
	li	t4, -1
	li	a5, 4294967295
	li	a6, 4294967294
	li	a3, 64
	li	a1, 8
	srli	t0, a2, 32
	seqz	s0, t0
	slli	s1, s0, 63
	srli	s1, s1, 63
	beqz	s1, .LBB0_7
# %bb.1:
	zext.w	s1, a2
	sext.w	s1, s1
	seqz	s1, s1
	slli	s1, s1, 63
	srli	s1, s1, 63
	zext.w	s3, t6
	bnez	s1, .LBB0_6
# %bb.2:
	zext.w	s1, a2
	zext.w	s2, t5
	sext.w	s1, s1
	sext.w	s2, s2
	sltu	s1, s1, s2
	slli	s1, s1, 63
	srli	s5, s1, 63
	zext.w	s3, t2
	zext.w	s4, t3
	zext.w	s1, t3
	zext.w	s2, t2
	beqz	s5, .LBB0_4
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	zext.w	s1, s4
	srliw	s1, s1, 8
	zext.w	s2, s3
	addiw	s2, s2, 8
	zext.w	s3, s1
	zext.w	s4, a2
	and	s3, s4, s3
	zext.w	s3, s3
	sext.w	s3, s3
	seqz	s3, s3
	slli	s3, s3, 63
	srli	s5, s3, 63
	zext.w	s3, s2
	zext.w	s4, s1
	zext.w	s1, s1
	zext.w	s2, s2
	bnez	s5, .LBB0_3
.LBB0_4:
	zext.w	s3, s1
	zext.w	s4, a2
	and	s3, s4, s3
	zext.w	s3, s3
	sext.w	s3, s3
	seqz	s3, s3
	slli	s3, s3, 63
	srli	s4, s3, 63
	zext.w	s3, s2
	zext.w	s2, s2
	zext.w	s1, s1
	bnez	s4, .LBB0_6
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	zext.w	s2, s2
	addiw	s2, s2, -1
	zext.w	s1, s1
	slliw	s1, s1, 1
	zext.w	s3, s1
	zext.w	s4, a2
	and	s3, s4, s3
	zext.w	s3, s3
	sext.w	s3, s3
	seqz	s3, s3
	slli	s3, s3, 63
	srli	s4, s3, 63
	zext.w	s3, s2
	zext.w	s2, s2
	zext.w	s1, s1
	beqz	s4, .LBB0_5
.LBB0_6:
	zext.w	s1, s3
	addiw	s1, s1, 32
	zext.w	s3, s1
	j	.LBB0_11
.LBB0_7:
	zext.w	s1, t0
	zext.w	s2, t5
	sext.w	s1, s1
	sext.w	s2, s2
	sltu	s1, s1, s2
	slli	s1, s1, 63
	srli	s5, s1, 63
	zext.w	s3, t2
	zext.w	s4, t3
	zext.w	s1, t3
	zext.w	s2, t2
	beqz	s5, .LBB0_9
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	zext.w	s1, s4
	srliw	s1, s1, 8
	zext.w	s2, s3
	addiw	s2, s2, 8
	zext.w	s3, s1
	zext.w	s4, t0
	and	s3, s4, s3
	zext.w	s3, s3
	sext.w	s3, s3
	seqz	s3, s3
	slli	s3, s3, 63
	srli	s5, s3, 63
	zext.w	s3, s2
	zext.w	s4, s1
	zext.w	s1, s1
	zext.w	s2, s2
	bnez	s5, .LBB0_8
.LBB0_9:
	zext.w	s3, s1
	zext.w	s4, t0
	and	s3, s4, s3
	zext.w	s3, s3
	sext.w	s3, s3
	seqz	s3, s3
	slli	s3, s3, 63
	srli	s4, s3, 63
	zext.w	s3, s2
	zext.w	s2, s2
	zext.w	s1, s1
	bnez	s4, .LBB0_11
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	zext.w	s2, s2
	addiw	s2, s2, -1
	zext.w	s1, s1
	slliw	s1, s1, 1
	zext.w	s3, s1
	zext.w	s4, t0
	and	s3, s4, s3
	zext.w	s3, s3
	sext.w	s3, s3
	seqz	s3, s3
	slli	s3, s3, 63
	srli	s4, s3, 63
	zext.w	s3, s2
	zext.w	s2, s2
	zext.w	s1, s1
	beqz	s4, .LBB0_10
.LBB0_11:
	zext.w	a7, a7
	zext.w	s1, s3
	subw	a7, a7, s1
	cpop	s1, a2
	sltiu	s1, s1, 2
	slli	s1, s1, 63
	srli	s1, s1, 63
	beqz	s1, .LBB0_13
# %bb.12:
	zext.w	a2, a4
	sext.w	a2, a2
	snez	a2, a2
	slli	a2, a2, 63
	srli	a2, a2, 63
	slli	a2, a2, 63
	srai	a2, a2, 63
	zext.w	a3, a7
	zext.w	a2, a2
	addw	a2, a2, a3
	zext.w	a2, a2
	zext.b	a2, a2
	li	s1, 0
	j	.LBB0_34
.LBB0_13:
	zext.w	s1, a7
	zext.w	s1, s1
	sll	t1, t1, s1
	sltu	s1, t1, a2
	slli	s1, s1, 63
	srli	s2, s1, 63
	mv	s1, t4
	beqz	s2, .LBB0_30
# %bb.14:
	slli	s0, s0, 63
	srli	s0, s0, 63
	beqz	s0, .LBB0_21
# %bb.15:
	zext.w	t0, a2
	sext.w	t0, t0
	seqz	t0, t0
	slli	t0, t0, 63
	srli	t0, t0, 63
	zext.w	t4, t6
	bnez	t0, .LBB0_20
# %bb.16:
	zext.w	t0, a2
	zext.w	t4, t5
	sext.w	t0, t0
	sext.w	t4, t4
	sltu	t0, t0, t4
	slli	t0, t0, 63
	srli	t6, t0, 63
	zext.w	t4, t2
	zext.w	t5, t3
	zext.w	t0, t3
	zext.w	t2, t2
	beqz	t6, .LBB0_18
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	zext.w	t0, t5
	srliw	t0, t0, 8
	zext.w	t2, t4
	addiw	t2, t2, 8
	zext.w	t3, t0
	zext.w	t4, a2
	and	t3, t4, t3
	zext.w	t3, t3
	sext.w	t3, t3
	seqz	t3, t3
	slli	t3, t3, 63
	srli	t3, t3, 63
	zext.w	t4, t2
	zext.w	t5, t0
	zext.w	t0, t0
	zext.w	t2, t2
	bnez	t3, .LBB0_17
.LBB0_18:
	zext.w	t3, t0
	zext.w	t4, a2
	and	t3, t4, t3
	zext.w	t3, t3
	sext.w	t3, t3
	seqz	t3, t3
	slli	t3, t3, 63
	srli	t3, t3, 63
	zext.w	t4, t2
	zext.w	t2, t2
	zext.w	t0, t0
	bnez	t3, .LBB0_20
.LBB0_19:                               # =>This Inner Loop Header: Depth=1
	zext.w	t2, t2
	addiw	t2, t2, -1
	zext.w	t0, t0
	slliw	t0, t0, 1
	zext.w	t3, t0
	zext.w	t4, a2
	and	t3, t4, t3
	zext.w	t3, t3
	sext.w	t3, t3
	seqz	t3, t3
	slli	t3, t3, 63
	srli	t3, t3, 63
	zext.w	t4, t2
	zext.w	t2, t2
	zext.w	t0, t0
	beqz	t3, .LBB0_19
.LBB0_20:
	zext.w	t0, t4
	addiw	t0, t0, 32
	zext.w	t4, t0
	j	.LBB0_25
.LBB0_21:
	zext.w	t4, t0
	zext.w	t5, t5
	sext.w	t4, t4
	sext.w	t5, t5
	sltu	t4, t4, t5
	slli	t4, t4, 63
	srli	t6, t4, 63
	zext.w	t4, t2
	zext.w	t5, t3
	zext.w	t3, t3
	zext.w	t2, t2
	beqz	t6, .LBB0_23
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	zext.w	t2, t5
	srliw	t2, t2, 8
	zext.w	t3, t4
	addiw	t6, t3, 8
	zext.w	t3, t2
	zext.w	t4, t0
	and	t3, t4, t3
	zext.w	t3, t3
	sext.w	t3, t3
	seqz	t3, t3
	slli	t3, t3, 63
	srli	s0, t3, 63
	zext.w	t4, t6
	zext.w	t5, t2
	zext.w	t3, t2
	zext.w	t2, t6
	bnez	s0, .LBB0_22
.LBB0_23:
	zext.w	t4, t3
	zext.w	t5, t0
	and	t4, t5, t4
	zext.w	t4, t4
	sext.w	t4, t4
	seqz	t4, t4
	slli	t4, t4, 63
	srli	t5, t4, 63
	zext.w	t4, t2
	zext.w	t2, t2
	zext.w	t3, t3
	bnez	t5, .LBB0_25
.LBB0_24:                               # =>This Inner Loop Header: Depth=1
	zext.w	t2, t2
	addiw	t2, t2, -1
	zext.w	t3, t3
	slliw	t3, t3, 1
	zext.w	t4, t3
	zext.w	t5, t0
	and	t4, t5, t4
	zext.w	t4, t4
	sext.w	t4, t4
	seqz	t4, t4
	slli	t4, t4, 63
	srli	t5, t4, 63
	zext.w	t4, t2
	zext.w	t2, t2
	zext.w	t3, t3
	beqz	t5, .LBB0_24
.LBB0_25:
	zext.w	t0, t4
	zext.w	t2, t0
	sll	t0, a2, t2
	sll	t4, t1, t2
	srli	t2, t0, 32
	divu	t5, t4, t2
	mul	t3, t2, t5
	sub	s1, t4, t3
	and	t3, a5, t0
	mul	t6, t5, t3
	slli	s1, s1, 32
	sltu	s0, s1, t6
	slli	s0, s0, 63
	srli	s2, s0, 63
	zext.w	s0, t5
	beqz	s2, .LBB0_27
# %bb.26:
	sub	t6, t6, s1
	sltu	t6, t0, t6
	slli	t6, t6, 63
	srli	t6, t6, 63
	czero.eqz	s0, a6, t6
	czero.nez	t6, a5, t6
	or	t6, s0, t6
	add	t5, t5, t6
	zext.w	s0, t5
.LBB0_27:
	slli	t5, t4, 32
	zext.w	t4, s0
	zext.w	t4, t4
	mul	t6, t4, t0
	sub	t6, t5, t6
	divu	t5, t6, t2
	mul	t2, t2, t5
	sub	t6, t6, t2
	mul	t2, t3, t5
	slli	t6, t6, 32
	sltu	t3, t6, t2
	slli	t3, t3, 63
	srli	s0, t3, 63
	zext.w	t3, t5
	beqz	s0, .LBB0_29
# %bb.28:
	sub	t2, t2, t6
	sltu	t0, t0, t2
	slli	t0, t0, 63
	srli	t0, t0, 63
	czero.eqz	a6, a6, t0
	czero.nez	a5, a5, t0
	or	a5, a6, a5
	add	a5, t5, a5
	zext.w	t3, a5
.LBB0_29:
	slli	t4, t4, 32
	zext.w	a5, t3
	zext.w	a5, a5
	or	s1, a5, t4
	mul	a5, s1, a2
	neg	t4, a5
.LBB0_30:
	zext.w	a4, a4
	sext.w	a4, a4
	seqz	a4, a4
	sub	a5, a2, t4
	sltu	a5, a5, t1
	slli	a5, a5, 63
	srli	a5, a5, 63
	slli	a4, a4, 63
	srli	a4, a4, 63
	czero.eqz	a5, a5, a4
	czero.nez	a4, zero, a4
	or	a4, a5, a4
	slli	a4, a4, 63
	srli	a4, a4, 63
	beqz	a4, .LBB0_32
# %bb.31:
	zext.w	a2, a7
	j	.LBB0_33
.LBB0_32:
	slli	s1, s1, 1
	slli	a4, t4, 1
	sltu	a2, a4, a2
	xori	a2, a2, 1
	slti	a4, t4, 0
	slli	a4, a4, 63
	srli	a4, a4, 63
	slli	a2, a2, 63
	srli	a2, a2, 63
	or	a2, a2, a4
	slli	a2, a2, 63
	srli	a2, a2, 63
	andi	a2, a2, 1
	or	s1, a2, s1
	zext.w	a2, a7
	zext.b	a2, a2
	zext.b	a3, a3
	or	a2, a3, a2
.LBB0_33:
	zext.b	a2, a2
	addi	s1, s1, 1
	zext.b	a2, a2
.LBB0_34:
	sd	a0, 0(s1)
	add	a0, a0, a1
	zext.b	a1, a2
	sb	a0, 0(a1)
	ld	s0, 40(sp)                      # 8-byte Folded Reload
	ld	s1, 32(sp)                      # 8-byte Folded Reload
	ld	s2, 24(sp)                      # 8-byte Folded Reload
	ld	s3, 16(sp)                      # 8-byte Folded Reload
	ld	s4, 8(sp)                       # 8-byte Folded Reload
	ld	s5, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
