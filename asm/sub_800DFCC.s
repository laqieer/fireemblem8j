	.syntax unified
	.set StartBgmExt, 0x08002434 + 1
	.section .text.sub_800DFCC, "ax", %progbits
@ sub_800DFCC @ JP 0x0800DFCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DFCC
	.thumb_func
sub_800DFCC:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DFE0
	movs r0, #0
	b _0800DFFA
_0800DFE0:
	ldr r0, [r2, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0800DFF0
	ldr r0, _0800E000 @ =0x030004B0
	movs r1, #8
	ldrsh r0, [r0, r1]
_0800DFF0:
	movs r1, #3
	movs r2, #0
	bl StartBgmExt
	movs r0, #2
_0800DFFA:
	pop {r1}
	bx r1
	.align 2, 0
_0800E000: .4byte 0x030004B0

