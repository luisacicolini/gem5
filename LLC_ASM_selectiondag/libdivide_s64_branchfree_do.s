	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_b1p0_zicond1p0_zmmul1p0_zba1p0_zbb1p0_zbc1p0_zbkb1p0_zbkc1p0_zbs1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	libdivide_s64_branchfree_do     # -- Begin function libdivide_s64_branchfree_do
	.p2align	2
	.type	libdivide_s64_branchfree_do,@function
libdivide_s64_branchfree_do:            # @libdivide_s64_branchfree_do
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
	ld	a3, 0(a1)
	lb	a1, 8(a1)
	zext.w	a4, a0
	srai	a5, a0, 32
	zext.w	a6, a3
	srai	a7, a3, 32
	mul	t0, a6, a4
	mul	a6, a6, a5
	mul	a5, a7, a5
	mul	a4, a7, a4
	srli	a7, t0, 32
	add	a0, a5, a0
	add	a6, a7, a6
	add.uw	a4, a6, a4
	srai	a5, a6, 32
	srai	a4, a4, 32
	add	a0, a0, a5
	add	a0, a0, a4
	seqz	a3, a3
	bset	a4, zero, a1
	sub	a4, a4, a3
	srai	a3, a0, 63
	and	a3, a3, a4
	add	a0, a3, a0
	srai	a3, a1, 7
	sra	a0, a0, a1
	xor	a0, a0, a3
	sub	a0, a0, a3
	sd	a0, 0(a2)
	.cfi_def_cfa sp, 16
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	libdivide_s64_branchfree_do, .Lfunc_end0-libdivide_s64_branchfree_do
	.cfi_endproc
                                        # -- End function
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
