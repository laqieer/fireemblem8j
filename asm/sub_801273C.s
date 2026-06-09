	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.section .text.sub_801273C, "ax", %progbits
@ sub_801273C @ JP 0x0801273C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801273C
	.thumb_func
sub_801273C:
	push {r4, lr}
	ldr r4, _08012744 @ =0x030005F8
	b _08012774
	.align 2, 0
_08012744: .4byte 0x030005F8
_08012748:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldrb r0, [r4, #1]
	strb r0, [r2, #0x10]
	ldrb r0, [r4, #2]
	strb r0, [r2, #0x11]
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _08012768
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	b _08012770
_08012768:
	ldr r0, [r2, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
_08012770:
	str r0, [r2, #0xc]
	adds r4, #4
_08012774:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012748
	pop {r4}
	pop {r0}
	bx r0

