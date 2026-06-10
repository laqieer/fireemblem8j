	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80080E8, 0x080080E8 + 1
	.section .text.sub_8007CA0, "ax", %progbits
@ sub_8007CA0 @ JP 0x08007CA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007CA0
	.thumb_func
sub_8007CA0:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _08007CDC
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_80080E8
	adds r0, r5, #0
	bl sub_8002DE4
_08007CDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

