	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"libdivide_internal_s64_gen.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	s0, 72(sp)                      # 8-byte Folded Spill
	sd	s1, 64(sp)                      # 8-byte Folded Spill
	sd	s2, 56(sp)                      # 8-byte Folded Spill
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s4, 40(sp)                      # 8-byte Folded Spill
	sd	s5, 32(sp)                      # 8-byte Folded Spill
	sd	s6, 24(sp)                      # 8-byte Folded Spill
	sd	s7, 16(sp)                      # 8-byte Folded Spill
	sd	s8, 8(sp)                       # 8-byte Folded Spill
	sd	s9, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	.cfi_offset s5, -48
	.cfi_offset s6, -56
	.cfi_offset s7, -64
	.cfi_offset s8, -72
	.cfi_offset s9, -80
                                        # implicit-def: $x16
                                        # implicit-def: $x15
                                        # implicit-def: $x10
	li	s0, 16777216
	li	t4, 8
	li	t5, -16777216
	li	s1, 32
	li	t1, 63
	li	t3, 62
	li	s2, 1
	li	t6, -1
	li	a7, 4294967295
	li	t0, 4294967294
	li	a4, 64
	li	a2, -128
	li	s4, 128
	li	a1, 8
	slti	a3, a6, 0
	neg	t2, a6
	max	a6, a6, t2
	srli	t2, a6, 32
	seqz	s3, t2
	slli	s5, s3, 63
	srli	s5, s5, 63
	beqz	s5, .LBB0_7
# %bb.1:
	zext.w	s5, a6
	sext.w	s5, s5
	seqz	s5, s5
	slli	s5, s5, 63
	srli	s5, s5, 63
	zext.w	s7, s1
	bnez	s5, .LBB0_6
# %bb.2:
	zext.w	s5, a6
	zext.w	s6, s0
	sext.w	s5, s5
	sext.w	s6, s6
	sltu	s5, s5, s6
	slli	s5, s5, 63
	srli	s9, s5, 63
	zext.w	s7, t4
	zext.w	s8, t5
	zext.w	s5, t5
	zext.w	s6, t4
	beqz	s9, .LBB0_4
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	zext.w	s5, s8
	srliw	s5, s5, 8
	zext.w	s6, s7
	addiw	s6, s6, 8
	zext.w	s7, s5
	zext.w	s8, a6
	and	s7, s8, s7
	zext.w	s7, s7
	sext.w	s7, s7
	seqz	s7, s7
	slli	s7, s7, 63
	srli	s9, s7, 63
	zext.w	s7, s6
	zext.w	s8, s5
	zext.w	s5, s5
	zext.w	s6, s6
	bnez	s9, .LBB0_3
.LBB0_4:
	zext.w	s7, s5
	zext.w	s8, a6
	and	s7, s8, s7
	zext.w	s7, s7
	sext.w	s7, s7
	seqz	s7, s7
	slli	s7, s7, 63
	srli	s8, s7, 63
	zext.w	s7, s6
	zext.w	s6, s6
	zext.w	s5, s5
	bnez	s8, .LBB0_6
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	zext.w	s6, s6
	addiw	s6, s6, -1
	zext.w	s5, s5
	slliw	s5, s5, 1
	zext.w	s7, s5
	zext.w	s8, a6
	and	s7, s8, s7
	zext.w	s7, s7
	sext.w	s7, s7
	seqz	s7, s7
	slli	s7, s7, 63
	srli	s8, s7, 63
	zext.w	s7, s6
	zext.w	s6, s6
	zext.w	s5, s5
	beqz	s8, .LBB0_5
.LBB0_6:
	zext.w	s5, s7
	addiw	s5, s5, 32
	zext.w	s5, s5
	j	.LBB0_11
.LBB0_7:
	zext.w	s5, t2
	zext.w	s6, s0
	sext.w	s5, s5
	sext.w	s6, s6
	sltu	s5, s5, s6
	slli	s5, s5, 63
	srli	s9, s5, 63
	zext.w	s5, t4
	zext.w	s8, t5
	zext.w	s6, t5
	zext.w	s7, t4
	beqz	s9, .LBB0_9
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	zext.w	s6, s8
	srliw	s6, s6, 8
	zext.w	s5, s5
	addiw	s7, s5, 8
	zext.w	s5, s6
	zext.w	s8, t2
	and	s5, s8, s5
	zext.w	s5, s5
	sext.w	s5, s5
	seqz	s5, s5
	slli	s5, s5, 63
	srli	s9, s5, 63
	zext.w	s5, s7
	zext.w	s8, s6
	zext.w	s6, s6
	zext.w	s7, s7
	bnez	s9, .LBB0_8
.LBB0_9:
	zext.w	s5, s6
	zext.w	s8, t2
	and	s5, s8, s5
	zext.w	s5, s5
	sext.w	s5, s5
	seqz	s5, s5
	slli	s5, s5, 63
	srli	s8, s5, 63
	zext.w	s5, s7
	zext.w	s7, s7
	zext.w	s6, s6
	bnez	s8, .LBB0_11
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	zext.w	s5, s7
	addiw	s7, s5, -1
	zext.w	s5, s6
	slliw	s6, s5, 1
	zext.w	s5, s6
	zext.w	s8, t2
	and	s5, s8, s5
	zext.w	s5, s5
	sext.w	s5, s5
	seqz	s5, s5
	slli	s5, s5, 63
	srli	s8, s5, 63
	zext.w	s5, s7
	zext.w	s7, s7
	zext.w	s6, s6
	beqz	s8, .LBB0_10
.LBB0_11:
	zext.w	t1, t1
	zext.w	s6, s5
	subw	t1, t1, s6
	cpop	s6, a6
	sltiu	s6, s6, 2
	slli	s6, s6, 63
	srli	s6, s6, 63
	beqz	s6, .LBB0_13
# %bb.12:
	zext.w	a2, s4
	slli	a3, a3, 63
	srli	a3, a3, 63
	czero.eqz	a2, a2, a3
	zext.w	a3, t1
	zext.w	a2, a2
	or	a2, a2, a3
	zext.w	a2, a2
	zext.b	a3, a2
	li	a4, 0
	j	.LBB0_36
.LBB0_13:
	zext.w	t3, t3
	zext.w	s4, s5
	subw	t3, t3, s4
	zext.w	s4, t3
	zext.w	s4, s4
	sll	s2, s2, s4
	sltu	s4, s2, a6
	slli	s4, s4, 63
	srli	s5, s4, 63
	mv	s4, t6
	beqz	s5, .LBB0_30
# %bb.14:
	slli	s3, s3, 63
	srli	t6, s3, 63
	beqz	t6, .LBB0_21
# %bb.15:
	zext.w	t2, a6
	sext.w	t2, t2
	seqz	t2, t2
	slli	t2, t2, 63
	srli	t2, t2, 63
	zext.w	t6, s1
	bnez	t2, .LBB0_20
# %bb.16:
	zext.w	t2, a6
	zext.w	t6, s0
	sext.w	t2, t2
	sext.w	t6, t6
	sltu	t2, t2, t6
	slli	t2, t2, 63
	srli	s1, t2, 63
	zext.w	t6, t4
	zext.w	s0, t5
	zext.w	t2, t5
	zext.w	t4, t4
	beqz	s1, .LBB0_18
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	zext.w	t2, s0
	srliw	t2, t2, 8
	zext.w	t4, t6
	addiw	t4, t4, 8
	zext.w	t5, t2
	zext.w	t6, a6
	and	t5, t6, t5
	zext.w	t5, t5
	sext.w	t5, t5
	seqz	t5, t5
	slli	t5, t5, 63
	srli	t5, t5, 63
	zext.w	t6, t4
	zext.w	s0, t2
	zext.w	t2, t2
	zext.w	t4, t4
	bnez	t5, .LBB0_17
.LBB0_18:
	zext.w	t5, t2
	zext.w	t6, a6
	and	t5, t6, t5
	zext.w	t5, t5
	sext.w	t5, t5
	seqz	t5, t5
	slli	t5, t5, 63
	srli	t5, t5, 63
	zext.w	t6, t4
	zext.w	t4, t4
	zext.w	t2, t2
	bnez	t5, .LBB0_20
.LBB0_19:                               # =>This Inner Loop Header: Depth=1
	zext.w	t4, t4
	addiw	t4, t4, -1
	zext.w	t2, t2
	slliw	t2, t2, 1
	zext.w	t5, t2
	zext.w	t6, a6
	and	t5, t6, t5
	zext.w	t5, t5
	sext.w	t5, t5
	seqz	t5, t5
	slli	t5, t5, 63
	srli	t5, t5, 63
	zext.w	t6, t4
	zext.w	t4, t4
	zext.w	t2, t2
	beqz	t5, .LBB0_19
.LBB0_20:
	zext.w	t2, t6
	addiw	t2, t2, 32
	zext.w	t6, t2
	j	.LBB0_25
.LBB0_21:
	zext.w	t6, t2
	zext.w	s0, s0
	sext.w	t6, t6
	sext.w	s0, s0
	sltu	t6, t6, s0
	slli	t6, t6, 63
	srli	s1, t6, 63
	zext.w	t6, t4
	zext.w	s0, t5
	zext.w	t5, t5
	zext.w	t4, t4
	beqz	s1, .LBB0_23
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	zext.w	t4, s0
	srliw	t4, t4, 8
	zext.w	t5, t6
	addiw	s1, t5, 8
	zext.w	t5, t4
	zext.w	t6, t2
	and	t5, t6, t5
	zext.w	t5, t5
	sext.w	t5, t5
	seqz	t5, t5
	slli	t5, t5, 63
	srli	s3, t5, 63
	zext.w	t6, s1
	zext.w	s0, t4
	zext.w	t5, t4
	zext.w	t4, s1
	bnez	s3, .LBB0_22
.LBB0_23:
	zext.w	t6, t5
	zext.w	s0, t2
	and	t6, s0, t6
	zext.w	t6, t6
	sext.w	t6, t6
	seqz	t6, t6
	slli	t6, t6, 63
	srli	s0, t6, 63
	zext.w	t6, t4
	zext.w	t4, t4
	zext.w	t5, t5
	bnez	s0, .LBB0_25
.LBB0_24:                               # =>This Inner Loop Header: Depth=1
	zext.w	t4, t4
	addiw	t4, t4, -1
	zext.w	t5, t5
	slliw	t5, t5, 1
	zext.w	t6, t5
	zext.w	s0, t2
	and	t6, s0, t6
	zext.w	t6, t6
	sext.w	t6, t6
	seqz	t6, t6
	slli	t6, t6, 63
	srli	s0, t6, 63
	zext.w	t6, t4
	zext.w	t4, t4
	zext.w	t5, t5
	beqz	s0, .LBB0_24
.LBB0_25:
	zext.w	t2, t6
	zext.w	t4, t2
	sll	t2, a6, t4
	sll	t6, s2, t4
	srli	t4, t2, 32
	divu	s0, t6, t4
	mul	t5, t4, s0
	sub	s3, t6, t5
	and	t5, a7, t2
	mul	s1, s0, t5
	slli	s3, s3, 32
	sltu	s2, s3, s1
	slli	s2, s2, 63
	srli	s4, s2, 63
	zext.w	s2, s0
	beqz	s4, .LBB0_27
# %bb.26:
	sub	s1, s1, s3
	sltu	s1, t2, s1
	slli	s1, s1, 63
	srli	s1, s1, 63
	czero.eqz	s2, t0, s1
	czero.nez	s1, a7, s1
	or	s1, s2, s1
	add	s0, s0, s1
	zext.w	s2, s0
.LBB0_27:
	slli	s0, t6, 32
	zext.w	t6, s2
	zext.w	t6, t6
	mul	s1, t6, t2
	sub	s1, s0, s1
	divu	s0, s1, t4
	mul	t4, t4, s0
	sub	s1, s1, t4
	mul	t4, t5, s0
	slli	s1, s1, 32
	sltu	t5, s1, t4
	slli	t5, t5, 63
	srli	s2, t5, 63
	zext.w	t5, s0
	beqz	s2, .LBB0_29
# %bb.28:
	sub	t4, t4, s1
	sltu	t2, t2, t4
	slli	t2, t2, 63
	srli	t2, t2, 63
	czero.eqz	t0, t0, t2
	czero.nez	a7, a7, t2
	or	a7, t0, a7
	add	a7, s0, a7
	zext.w	t5, a7
.LBB0_29:
	slli	t6, t6, 32
	zext.w	a7, t5
	zext.w	a7, a7
	or	s4, a7, t6
	mul	a7, s4, a6
	neg	t6, a7
.LBB0_30:
	zext.w	a5, a5
	sext.w	a5, a5
	seqz	a5, a5
	slli	a7, a5, 63
	srli	a7, a7, 63
	beqz	a7, .LBB0_33
# %bb.31:
	sub	a7, a6, t6
	zext.w	t0, t1
	zext.w	t0, t0
	srl	a7, a7, t0
	seqz	a7, a7
	slli	a7, a7, 63
	srli	a7, a7, 63
	beqz	a7, .LBB0_33
# %bb.32:
	zext.w	a4, t3
	j	.LBB0_34
.LBB0_33:
	slli	s4, s4, 1
	slli	a7, t6, 1
	sltu	a6, a7, a6
	xori	a6, a6, 1
	slti	a7, t6, 0
	slli	a7, a7, 63
	srli	a7, a7, 63
	slli	a6, a6, 63
	srli	a6, a6, 63
	or	a6, a6, a7
	slli	a6, a6, 63
	srli	a6, a6, 63
	andi	a6, a6, 1
	or	s4, a6, s4
	zext.w	a6, t1
	zext.b	a6, a6
	zext.b	a4, a4
	or	a4, a4, a6
.LBB0_34:
	zext.b	a6, a4
	addi	a4, s4, 1
	slli	a3, a3, 63
	srli	a7, a3, 63
	zext.b	a3, a6
	beqz	a7, .LBB0_36
# %bb.35:
	zext.b	a3, a6
	zext.b	a2, a2
	or	a2, a2, a3
	not	a3, s4
	slli	a5, a5, 63
	srli	a5, a5, 63
	czero.eqz	a3, a3, a5
	czero.nez	a4, a4, a5
	or	a4, a3, a4
	zext.b	a3, a2
.LBB0_36:
	sd	a0, 0(a4)
	add	a0, a0, a1
	zext.b	a1, a3
	sb	a0, 0(a1)
	ld	s0, 72(sp)                      # 8-byte Folded Reload
	ld	s1, 64(sp)                      # 8-byte Folded Reload
	ld	s2, 56(sp)                      # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	s4, 40(sp)                      # 8-byte Folded Reload
	ld	s5, 32(sp)                      # 8-byte Folded Reload
	ld	s6, 24(sp)                      # 8-byte Folded Reload
	ld	s7, 16(sp)                      # 8-byte Folded Reload
	ld	s8, 8(sp)                       # 8-byte Folded Reload
	ld	s9, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore s8
	.cfi_restore s9
	addi	sp, sp, 80
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
