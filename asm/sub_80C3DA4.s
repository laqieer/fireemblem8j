	.syntax unified
	.set GetNodeAtPosition, 0x080C0458 + 1
	.set InitText, 0x08003C8C + 1
	.set RedrawGMapPIForNode, 0x080C3D0C + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.section .text.sub_80C3DA4, "ax", %progbits
@ sub_80C3DA4 @ JP 0x080C3DA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3DA4
	.thumb_func
sub_80C3DA4:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	str r0, [r7, #0x58]
	adds r0, r7, #0
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r6, r7, #0
	adds r6, #0x5c
	ldr r0, _080C3E2C @ =0x0000FFFF
	strh r0, [r6]
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r4, r7, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r4, #0
	bl sub_8003CF8
	add r2, sp, #4
	ldr r1, _080C3E30 @ =0x03005270
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r2]
	adds r2, #2
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strh r0, [r2]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x48]
	add r1, sp, #4
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #0
	str r3, [sp]
	bl GetNodeAtPosition
	adds r1, r0, #0
	cmp r1, #0
	blt _080C3E24
	strh r1, [r6]
	adds r0, r7, #0
	bl RedrawGMapPIForNode
_080C3E24:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E2C: .4byte 0x0000FFFF
_080C3E30: .4byte 0x03005270

