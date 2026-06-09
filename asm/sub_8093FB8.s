	.syntax unified
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_80944C4, 0x080944C4 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.section .text.sub_8093FB8, "ax", %progbits
@ sub_8093FB8 @ JP 0x08093FB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8093FB8
	.thumb_func
sub_8093FB8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08093FDC @ =0x0200D7E0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl j_TmFillRect
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge _0809400A
	ldr r0, _08093FE0 @ =0x0200F158
	adds r6, r5, #0
	adds r6, #0x2f
	b _08094004
	.align 2, 0
_08093FDC: .4byte 0x0200D7E0
_08093FE0: .4byte 0x0200F158
_08093FE4:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08094040 @ =0x0200D7E0
	bl sub_80945E8
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	bge _0809400A
	ldr r0, _08094044 @ =0x0200F158
_08094004:
	ldrb r0, [r0]
	cmp r4, r0
	blt _08093FE4
_0809400A:
	ldr r4, _08094048 @ =0x0200DFE0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl sub_80944C4
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094040: .4byte 0x0200D7E0
_08094044: .4byte 0x0200F158
_08094048: .4byte 0x0200DFE0

