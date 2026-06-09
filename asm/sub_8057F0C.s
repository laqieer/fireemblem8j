	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8057F0C, "ax", %progbits
@ sub_8057F0C @ JP 0x08057F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057F0C
	.thumb_func
sub_8057F0C:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08057F34
	ldr r1, _08057F30 @ =0x0201FAD4
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
	b _08057F78
	.align 2, 0
_08057F30: .4byte 0x0201FAD4
_08057F34:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08057F56
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8012E84
	b _08057F6C
_08057F56:
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl sub_8012E84
_08057F6C:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
_08057F78:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

