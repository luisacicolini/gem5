	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	fastNTT                         # -- Begin function fastNTT
	.p2align	2
	.type	fastNTT,@function
fastNTT:                                # @fastNTT
	.cfi_startproc
# %bb.0:
	li	a5, 2
	blt	a1, a5, .LBB0_15
# %bb.1:                                # %.lr.ph.preheader.lr.ph
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sd	ra, 104(sp)                     # 8-byte Folded Spill
	sd	s0, 96(sp)                      # 8-byte Folded Spill
	sd	s1, 88(sp)                      # 8-byte Folded Spill
	sd	s2, 80(sp)                      # 8-byte Folded Spill
	sd	s3, 72(sp)                      # 8-byte Folded Spill
	sd	s4, 64(sp)                      # 8-byte Folded Spill
	sd	s5, 56(sp)                      # 8-byte Folded Spill
	sd	s6, 48(sp)                      # 8-byte Folded Spill
	sd	s7, 40(sp)                      # 8-byte Folded Spill
	sd	s8, 32(sp)                      # 8-byte Folded Spill
	sd	s9, 24(sp)                      # 8-byte Folded Spill
	sd	s10, 16(sp)                     # 8-byte Folded Spill
	sd	s11, 8(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	.cfi_offset s9, -88
	.cfi_offset s10, -96
	.cfi_offset s11, -104
	addi	s0, sp, 112
	.cfi_def_cfa s0, 0
	li	a6, 0
	addi	a7, a1, -2
	czero.eqz	a7, a7, a4
	addi	a7, a7, 2
	li	t0, 3
	mv	t1, a1
	j	.LBB0_4
.LBB0_2:                                # %._crit_edge6
                                        #   in Loop: Header=BB0_4 Depth=1
	addi	a6, a6, 1
	beqz	a4, .LBB0_13
# %bb.3:                                #   in Loop: Header=BB0_4 Depth=1
	add	a7, a7, t2
	srai	a7, a7, 1
.LBB0_4:                                # %.lr.ph.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_12 Depth 3
	srli	t2, t1, 63
	add	t1, t1, t2
	srai	t1, t1, 1
	li	t2, -1
	mv	t3, a1
.LBB0_5:                                # %.lr.ph
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mv	t4, t3
	srli	t3, t3, 1
	addi	t2, t2, 1
	bltu	t0, t4, .LBB0_5
# %bb.6:                                # %._crit_edge
                                        #   in Loop: Header=BB0_4 Depth=1
	bltu	t2, a6, .LBB0_14
# %bb.7:                                # %.preheader3
                                        #   in Loop: Header=BB0_4 Depth=1
	div	t3, a1, a7
	srli	t2, a7, 63
	blez	t3, .LBB0_2
# %bb.8:                                # %.preheader.lr.ph
                                        #   in Loop: Header=BB0_4 Depth=1
	li	t4, 0
	add	t6, a7, t2
	sh3add	t5, t1, a3
	srai	t6, t6, 1
	slli	s1, t1, 4
	slli	s2, a7, 3
	slli	s3, t6, 3
	mv	s4, a0
	j	.LBB0_10
.LBB0_9:                                # %._crit_edge5
                                        #   in Loop: Header=BB0_10 Depth=2
	addi	t4, t4, 1
	add	s4, s4, s2
	bge	t4, t3, .LBB0_2
.LBB0_10:                               # %.preheader
                                        #   Parent Loop BB0_4 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
	blt	a7, a5, .LBB0_9
# %bb.11:                               # %.lr.ph4
                                        #   in Loop: Header=BB0_10 Depth=2
	li	s5, 0
	mv	s6, s4
	mv	s7, t5
.LBB0_12:                               #   Parent Loop BB0_4 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	add	s8, s6, s3
	ld	s9, 0(s7)
	ld	s10, 0(s8)
	ld	s11, 0(s6)
	mul	s9, s9, s10
	rem	s9, s9, a2
	add	s10, s9, s11
	rem	s10, s10, a2
	add	s11, s11, a2
	sub	s9, s11, s9
	rem	s9, s9, a2
	sd	s10, 0(s6)
	sd	s9, 0(s8)
	addi	s5, s5, 1
	add	s7, s7, s1
	addi	s6, s6, 8
	blt	s5, t6, .LBB0_12
	j	.LBB0_9
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	slli	a7, a7, 1
	j	.LBB0_4
.LBB0_14:
	.cfi_def_cfa sp, 112
	ld	ra, 104(sp)                     # 8-byte Folded Reload
	ld	s0, 96(sp)                      # 8-byte Folded Reload
	ld	s1, 88(sp)                      # 8-byte Folded Reload
	ld	s2, 80(sp)                      # 8-byte Folded Reload
	ld	s3, 72(sp)                      # 8-byte Folded Reload
	ld	s4, 64(sp)                      # 8-byte Folded Reload
	ld	s5, 56(sp)                      # 8-byte Folded Reload
	ld	s6, 48(sp)                      # 8-byte Folded Reload
	ld	s7, 40(sp)                      # 8-byte Folded Reload
	ld	s8, 32(sp)                      # 8-byte Folded Reload
	ld	s9, 24(sp)                      # 8-byte Folded Reload
	ld	s10, 16(sp)                     # 8-byte Folded Reload
	ld	s11, 8(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
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
	.cfi_restore s10
	.cfi_restore s11
	addi	sp, sp, 112
	.cfi_def_cfa_offset 0
.LBB0_15:                               # %._crit_edge.thread
	ret
.Lfunc_end0:
	.size	fastNTT, .Lfunc_end0-fastNTT
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
