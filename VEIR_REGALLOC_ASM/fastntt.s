	.attribute	4, 16
#	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"fastntt.mir"
	.text
	.globl	fastNTT                            # -- Begin function fastNTT
	.type	fastNTT,@function
fastNTT:                                   # @fastNTT
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
                                        # implicit-def: $x10
                                        # implicit-def: $x11
                                        # implicit-def: $x12
                                        # implicit-def: $x13
                                        # implicit-def: $x16
                                        # implicit-def: $x14
	li	a4, 1
	li	a7, 2
	li	a5, 3
	seqz	a6, a6
	slt	t0, a4, a1
	slli	t0, t0, 63
	srli	t0, t0, 63
	beqz	t0, .LBB0_15
# %bb.1:
	slli	t0, a6, 63
	srli	t0, t0, 63
	czero.eqz	a7, a7, t0
	czero.nez	t0, a1, t0
	or	a7, a7, t0
                                        # implicit-def: $x5
	li	t1, 0
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
                                        #     Child Loop BB0_7 Depth 2
                                        #       Child Loop BB0_9 Depth 3
	srli	t2, t0, 63
	add	t0, t0, t2
	srai	t0, t0, 1
                                        # implicit-def: $x28
	li	t4, 0
.LBB0_3:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	t2, t4
	srli	t5, t3, 1
	addi	t4, t4, 1
	sltu	t3, a5, t3
	slli	t3, t3, 63
	srli	t6, t3, 63
	mv	t3, t5
	bnez	t6, .LBB0_3
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	t2, t2, t1
	slli	t2, t2, 63
	srli	t2, t2, 63
	bnez	t2, .LBB0_15
# %bb.5:                                #   in Loop: Header=BB0_2 Depth=1
	div	t2, a1, a7
	sgtz	t3, t2
	slli	t3, t3, 63
	srli	t3, t3, 63
	beqz	t3, .LBB0_11
# %bb.6:                                #   in Loop: Header=BB0_2 Depth=1
	srli	t3, a7, 63
	add	t3, a7, t3
	srai	t3, t3, 1
	slt	t4, a4, a7
	li	t5, 0
.LBB0_7:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_9 Depth 3
	slli	t6, t4, 63
	srli	t6, t6, 63
	beqz	t6, .LBB0_10
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	mul	t6, a7, t5
	sh3add	t6, t6, a0
	li	s0, 0
.LBB0_9:                                #   Parent Loop BB0_2 Depth=1
                                        #     Parent Loop BB0_7 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	sh3add	s1, s0, t6
	ld	s2, 0(s1)
	sh3add	s3, t3, s1
	ld	s4, 0(s3)
	slli	s5, s0, 1
	ori	s5, s5, 1
	mul	s5, t0, s5
	sh3add	s5, s5, a3
	ld	s5, 0(s5)
	mul	s4, s4, s5
	rem	s4, s4, a2
	add	s5, s2, s4
	rem	s5, s5, a2
	add	s2, a2, s2
	sub	s2, s2, s4
	rem	s2, s2, a2
	sd	s1, 0(s5)
	sd	s3, 0(s2)
	addi	s0, s0, 1
	slt	s1, s0, t3
	slli	s1, s1, 63
	srli	s1, s1, 63
	bnez	s1, .LBB0_9
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=2
	addi	t5, t5, 1
	slt	t6, t5, t2
	slli	t6, t6, 63
	srli	t6, t6, 63
	bnez	t6, .LBB0_7
.LBB0_11:                               #   in Loop: Header=BB0_2 Depth=1
	slli	t2, a6, 63
	srli	t2, t2, 63
	beqz	t2, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_2 Depth=1
	slli	a7, a7, 1
	j	.LBB0_14
.LBB0_13:                               #   in Loop: Header=BB0_2 Depth=1
	srli	t2, a7, 63
	add	a7, a7, t2
	srai	a7, a7, 1
.LBB0_14:                               #   in Loop: Header=BB0_2 Depth=1
	addi	t1, t1, 1
	j	.LBB0_2
.LBB0_15:
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
	.size	fastNTT, .Lfunc_end0-fastNTT
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
