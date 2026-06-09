	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_801FA1C, "ax", %progbits
@ sub_801FA1C @ JP 0x0801FA1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FA1C
	.thumb_func
sub_801FA1C:
	push {lr}
	bl sub_8000CD8
	adds r2, r0, #0
	lsrs r2, r2, #1
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	adds r1, r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0
	.align 2, 0

