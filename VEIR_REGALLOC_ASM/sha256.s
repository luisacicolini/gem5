	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"sha256.mir"
	.text
	.globl	main                            # -- Begin function main
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -176
	.cfi_def_cfa_offset 176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	sd	s1, 152(sp)                     # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s3, 136(sp)                     # 8-byte Folded Spill
	sd	s4, 128(sp)                     # 8-byte Folded Spill
	sd	s5, 120(sp)                     # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 104(sp)                     # 8-byte Folded Spill
	sd	s8, 96(sp)                      # 8-byte Folded Spill
	sd	s9, 88(sp)                      # 8-byte Folded Spill
	sd	s10, 80(sp)                     # 8-byte Folded Spill
	sd	s11, 72(sp)                     # 8-byte Folded Spill
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
                                        # implicit-def: $x9
                                        # implicit-def: $x12
	li	t3, 4
	li	t2, 8
	li	t1, 12
	li	t0, 16
	li	a7, 20
	li	a6, 24
	li	a5, 28
	li	a0, 32
	li	a1, 36
	li	s8, 40
	li	s7, 44
	li	s6, 48
	li	s5, 52
	li	s4, 56
	li	s3, 60
	li	s2, 16
	li	t4, -60
	li	t5, -8
	li	t6, -64
	li	s0, -28
	li	s9, 63
	li	ra, -1
	lw	a3, 0(s1)
	zext.w	a3, a3
	sw	a2, 0(a3)
	add	a3, s1, t3
	lw	a3, 0(a3)
	add	a4, a2, t3
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, t2
	lw	a3, 0(a3)
	add	a4, a2, t2
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, t1
	lw	a3, 0(a3)
	add	a4, a2, t1
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, t0
	lw	a3, 0(a3)
	add	a4, a2, t0
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, a7
	lw	a3, 0(a3)
	add	a4, a2, a7
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, a6
	lw	a3, 0(a3)
	add	a4, a2, a6
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, a5
	lw	a3, 0(a3)
	add	a4, a2, a5
	zext.w	a3, a3
	sw	a4, 0(a3)
	add	a3, s1, a0
	lw	a3, 0(a3)
	add	a0, a2, a0
	zext.w	a3, a3
	sw	a0, 0(a3)
	add	a0, s1, a1
	lw	a0, 0(a0)
	add	a1, a2, a1
	zext.w	a0, a0
	sw	a1, 0(a0)
	add	a0, s1, s8
	lw	a0, 0(a0)
	add	s8, a2, s8
	zext.w	a0, a0
	sw	s8, 0(a0)
	add	a0, s1, s7
	lw	a0, 0(a0)
	add	s7, a2, s7
	zext.w	a0, a0
	sw	s7, 0(a0)
	add	a0, s1, s6
	lw	a0, 0(a0)
	add	s6, a2, s6
	zext.w	a0, a0
	sw	s6, 0(a0)
	add	a0, s1, s5
	lw	a0, 0(a0)
	add	s5, a2, s5
	zext.w	a0, a0
	sw	s5, 0(a0)
	add	a0, s1, s4
	lw	a0, 0(a0)
	add	s4, a2, s4
	zext.w	a0, a0
	sw	s4, 0(a0)
	add	s1, s1, s3
	lw	a0, 0(s1)
	add	s3, a2, s3
	zext.w	a0, a0
	sw	s3, 0(a0)
	zext.w	a1, s2
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	zext.w	a0, a1
	zext.w	a0, a0
	sh2add	a0, a0, a2
	add	a3, a0, t4
	lw	a3, 0(a3)
	zext.w	a4, a3
	roriw	a4, a4, 7
	zext.w	s1, a3
	roriw	s1, s1, 18
	zext.w	a4, a4
	zext.w	s1, s1
	xor	a4, s1, a4
	zext.w	a3, a3
	srliw	a3, a3, 3
	zext.w	a4, a4
	zext.w	a3, a3
	xor	a3, a3, a4
	add	a4, a0, t5
	lw	a4, 0(a4)
	zext.w	s1, a4
	roriw	s1, s1, 17
	zext.w	s2, a4
	roriw	s2, s2, 19
	zext.w	s1, s1
	zext.w	s2, s2
	xor	s1, s2, s1
	zext.w	a4, a4
	srliw	a4, a4, 10
	zext.w	s1, s1
	zext.w	a4, a4
	xor	a4, a4, s1
	add	s1, a0, t6
	lw	s1, 0(s1)
	zext.w	a3, a3
	zext.w	s1, s1
	addw	a3, s1, a3
	add	s1, a0, s0
	lw	s1, 0(s1)
	zext.w	a3, a3
	zext.w	s1, s1
	addw	a3, s1, a3
	zext.w	a3, a3
	zext.w	a4, a4
	addw	a3, a4, a3
	zext.w	a3, a3
	sw	a0, 0(a3)
	zext.w	a0, a1
	addiw	a0, a0, 1
	zext.w	a1, a1
	zext.w	a3, s9
	sext.w	a1, a1
	sext.w	a3, a3
	sltu	a1, a1, a3
	slli	a1, a1, 63
	srli	a3, a1, 63
	zext.w	a1, a0
	bnez	a3, .LBB0_1
# %bb.2:
                                        # implicit-def: $x10
	lw	s4, 0(a0)
	add	s1, a0, t3
	lw	s3, 0(s1)
	add	t6, a0, t2
	lw	s2, 0(t6)
	add	t1, a0, t1
	sd	t1, 8(sp)                       # 8-byte Folded Spill
	lw	s0, 0(t1)
	add	t0, a0, t0
	sd	t0, 24(sp)                      # 8-byte Folded Spill
	lw	t5, 0(t0)
	add	a7, a0, a7
	sd	a7, 40(sp)                      # 8-byte Folded Spill
	lw	a4, 0(a7)
	add	a6, a0, a6
	sd	a6, 56(sp)                      # 8-byte Folded Spill
	lw	a3, 0(a6)
	add	a0, a0, a5
	sd	a0, 64(sp)                      # 8-byte Folded Spill
	lw	a1, 0(a0)
	zext.w	a0, s4
	zext.w	s10, s3
	zext.w	s8, s2
	zext.w	s11, s0
	mv	t3, s9
	li	s9, 0
	sd	a1, 48(sp)                      # 8-byte Folded Spill
	zext.w	a1, a1
	sd	a3, 32(sp)                      # 8-byte Folded Spill
	zext.w	s5, a3
	sd	a4, 16(sp)                      # 8-byte Folded Spill
	zext.w	s6, a4
	zext.w	s7, t5
	mv	t4, ra
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	mv	a3, s7
	mv	t1, s6
	mv	t0, s5
	mv	a6, s8
	mv	a5, s10
	mv	ra, a0
	zext.w	a0, s7
	roriw	a0, a0, 6
	zext.w	a4, s7
	roriw	a4, a4, 11
	zext.w	a0, a0
	zext.w	a4, a4
	xor	a0, a4, a0
	zext.w	a4, s7
	roriw	a4, a4, 25
	zext.w	a0, a0
	zext.w	a4, a4
	xor	a0, a4, a0
	zext.w	a4, s6
	zext.w	a7, s7
	and	a4, a7, a4
	zext.w	a7, s7
	zext.w	s5, t4
	xor	a7, s5, a7
	zext.w	s5, t0
	zext.w	a7, a7
	and	a7, a7, s5
	zext.w	a7, a7
	zext.w	a4, a4
	or	a4, a4, a7
	zext.w	a1, a1
	zext.w	a0, a0
	addw	a0, a0, a1
	zext.w	a0, a0
	zext.w	a1, a4
	addw	a0, a1, a0
	zext.w	a1, s9
	zext.w	a1, a1
                                        # implicit-def: $x14
	sh2add	a4, a1, a4
	lw	a4, 0(a4)
	zext.w	a0, a0
	zext.w	a4, a4
	addw	a0, a4, a0
	sh2add	a1, a1, a2
	lw	a1, 0(a1)
	zext.w	a0, a0
	zext.w	a1, a1
	addw	a0, a1, a0
	zext.w	a1, ra
	roriw	a1, a1, 2
	zext.w	a4, ra
	roriw	a4, a4, 13
	zext.w	a1, a1
	zext.w	a4, a4
	xor	a1, a4, a1
	zext.w	a4, ra
	roriw	a4, a4, 22
	zext.w	a1, a1
	zext.w	a4, a4
	xor	a1, a4, a1
	zext.w	a4, s10
	zext.w	a7, s8
	xor	a4, a7, a4
	zext.w	a7, ra
	zext.w	a4, a4
	and	a4, a4, a7
	zext.w	a7, s10
	zext.w	s5, s8
	and	a7, s5, a7
	zext.w	a4, a4
	zext.w	a7, a7
	xor	a4, a7, a4
	zext.w	a1, a1
	zext.w	a4, a4
	addw	a1, a4, a1
	zext.w	a4, a0
	zext.w	a7, s11
	addw	a4, a7, a4
	zext.w	a1, a1
	zext.w	a0, a0
	addw	a7, a0, a1
	zext.w	a0, s9
	addiw	a1, a0, 1
	zext.w	a0, s9
	zext.w	s5, t3
	sext.w	a0, a0
	sext.w	s5, s5
	sltu	a0, a0, s5
	slli	a0, a0, 63
	srli	t2, a0, 63
	zext.w	a0, a7
	zext.w	s10, ra
	zext.w	s8, a5
	zext.w	s11, a6
	zext.w	s9, a1
	zext.w	a1, t0
	zext.w	s5, s6
	zext.w	s6, s7
	zext.w	s7, a4
	bnez	t2, .LBB0_3
# %bb.4:
	zext.w	a0, a7
	zext.w	a1, s4
	addw	a0, a1, a0
	zext.w	a0, a0
                                        # implicit-def: $x11
	sw	a1, 0(a0)
	zext.w	a0, ra
	zext.w	a1, s3
	addw	a0, a1, a0
	zext.w	a0, a0
	sw	s1, 0(a0)
	zext.w	a0, a5
	zext.w	a1, s2
	addw	a0, a1, a0
	zext.w	a0, a0
	sw	t6, 0(a0)
	zext.w	a0, a6
	zext.w	a1, s0
	addw	a0, a1, a0
	zext.w	a0, a0
	ld	a1, 8(sp)                       # 8-byte Folded Reload
	sw	a1, 0(a0)
	zext.w	a0, a4
	zext.w	a1, t5
	addw	a0, a1, a0
	zext.w	a0, a0
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	sw	a1, 0(a0)
	zext.w	a0, a3
	lwu	a1, 16(sp)                      # 8-byte Folded Reload
	addw	a0, a1, a0
	zext.w	a0, a0
	ld	a1, 40(sp)                      # 8-byte Folded Reload
	sw	a1, 0(a0)
	zext.w	a0, t1
	lwu	a1, 32(sp)                      # 8-byte Folded Reload
	addw	a0, a1, a0
	zext.w	a0, a0
	ld	a1, 56(sp)                      # 8-byte Folded Reload
	sw	a1, 0(a0)
	zext.w	a0, t0
	lwu	a1, 48(sp)                      # 8-byte Folded Reload
	addw	a0, a1, a0
	zext.w	a0, a0
	ld	a1, 64(sp)                      # 8-byte Folded Reload
	sw	a1, 0(a0)
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	ld	s10, 80(sp)                     # 8-byte Folded Reload
	ld	s11, 72(sp)                     # 8-byte Folded Reload
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
	addi	sp, sp, 176
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
