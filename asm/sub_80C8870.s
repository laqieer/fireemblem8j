	.syntax unified
	.set GetWMCursorScreenQuadrant, 0x080C5668 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C8844, 0x080C8844 + 1
	.section .text.sub_80C8870, "ax", %progbits
@ sub_80C8870 @ JP 0x080C8870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8870
	.thumb_func
sub_80C8870:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080C88F0 @ =0x03005270
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C88EA
	movs r0, #0
	str r0, [r5, #0x34]
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #0x30
	bl GetWMCursorScreenQuadrant
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldr r3, _080C88F4 @ =0x081F683C
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldrb r4, [r6]
	lsls r1, r4, #0x1a
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r0, [r2]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x31
	rsbs r0, r0, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6]
	adds r0, r5, #0
	bl sub_80C8844
	adds r1, r5, #0
	adds r1, #0x2d
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	strb r0, [r1]
	adds r2, r5, #0
	adds r2, #0x2e
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	ldrb r1, [r2]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8002DE4
_080C88EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C88F0: .4byte 0x03005270
_080C88F4: .4byte 0x081F683C

