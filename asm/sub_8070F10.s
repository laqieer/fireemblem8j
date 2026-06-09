	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.section .text.sub_8070F10, "ax", %progbits
@ sub_8070F10 @ JP 0x08070F10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070F10
	.thumb_func
sub_8070F10:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08070F2C
	ldr r0, _08070F28 @ =0x080DFF2D
	ldrb r1, [r0]
	ldrh r0, [r4, #2]
	b _08070F32
	.align 2, 0
_08070F28: .4byte 0x080DFF2D
_08070F2C:
	ldr r0, _08070F60 @ =0x080DFF32
	ldrb r0, [r0]
	ldrh r1, [r4, #2]
_08070F32:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	ldrh r0, [r4, #4]
	movs r2, #0x58
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r0, [r5, #0x12]
	ldrh r1, [r5, #2]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070F60: .4byte 0x080DFF32

