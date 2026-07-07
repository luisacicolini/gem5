	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s32_recover           # -- Begin function libdivide_s32_recover
	.p2align	2
	.type	libdivide_s32_recover,@function
libdivide_s32_recover:                  # @libdivide_s32_recover
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
	lw	a3, 0(a0)
	lbu	a0, 4(a0)
	andi	a2, a0, 31
	beqz	a3, .LBB0_2
# %bb.1:
	andi	a4, a0, 64
	srli	a5, a3, 63
	slti	a6, a3, 1
	xori	a5, a5, 1
	czero.eqz	a6, a6, a4
	czero.nez	a4, a5, a4
	neg	a5, a3
	or	a4, a4, a6
	czero.nez	a5, a5, a4
	czero.eqz	a3, a3, a4
	addi	a2, a2, 32
	or	a3, a3, a5
	bset	a2, zero, a2
	zext.w	a3, a3
	divu	a2, a2, a3
	sext.b	a0, a0
	addi	a3, a2, 1
	not	a2, a2
	srli	a0, a0, 63
	czero.nez	a3, a3, a0
	czero.eqz	a0, a2, a0
	or	a0, a0, a3
	j	.LBB0_3
.LBB0_2:
	bset	a2, zero, a2
	sext.b	a0, a0
	neg	a3, a2
	srli	a0, a0, 63
	czero.nez	a2, a2, a0
	czero.eqz	a0, a3, a0
	or	a0, a0, a2
.LBB0_3:
	sw	a0, 0(a1)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s32_recover, .Lfunc_end0-libdivide_s32_recover
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
