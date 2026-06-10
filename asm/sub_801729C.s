	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A118, 0x0800A118 + 1
	.section .text.sub_801729C, "ax", %progbits
@ sub_801729C @ JP 0x0801729C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801729C
	.thumb_func
sub_801729C:
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172BC @ =0x0885E068
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_8009FA8
	bl sub_800A118
	pop {r1}
	bx r1
	.align 2, 0
_080172BC: .4byte 0x0885E068

