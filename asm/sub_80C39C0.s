	.syntax unified
	.set GetWMCursorScreenQuadrant, 0x080C5668 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C3380, 0x080C3380 + 1
	.set sub_80C3918, 0x080C3918 + 1
	.section .text.sub_80C39C0, "ax", %progbits
@ sub_80C39C0 @ JP 0x080C39C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C39C0
	.thumb_func
sub_80C39C0:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl GetWMCursorScreenQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _080C3A3C @ =0x08AC1E08
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80C3380
	adds r1, r4, #0
	adds r1, #0x57
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80C3918
	adds r3, r4, #0
	adds r3, #0x4e
	ldr r1, _080C3A40 @ =0x03005270
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4f
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strb r0, [r2]
	ldrb r1, [r3]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3A3C: .4byte 0x08AC1E08
_080C3A40: .4byte 0x03005270

