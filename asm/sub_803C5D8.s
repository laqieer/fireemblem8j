	.syntax unified
	.set AiCompare, 0x0803A794 + 1
	.section .text.sub_803C5D8, "ax", %progbits
@ sub_803C5D8 @ JP 0x0803C5D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C5D8
	.thumb_func
sub_803C5D8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0803C608 @ =0x030017C8
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl AiCompare
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C664
	ldr r0, _0803C60C @ =0x030017C4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C618
	ldr r1, _0803C610 @ =0x085D30EC
	ldr r0, _0803C614 @ =0x03004DF0
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C620
	.align 2, 0
_0803C608: .4byte 0x030017C8
_0803C60C: .4byte 0x030017C4
_0803C610: .4byte 0x085D30EC
_0803C614: .4byte 0x03004DF0
_0803C618:
	ldr r1, _0803C638 @ =0x085D30E0
	ldr r0, _0803C63C @ =0x03004DF0
	ldr r0, [r0]
	adds r0, #0x44
_0803C620:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #0
	beq _0803C660
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r3, _0803C640 @ =0x030017C0
	b _0803C650
	.align 2, 0
_0803C638: .4byte 0x085D30E0
_0803C63C: .4byte 0x03004DF0
_0803C640: .4byte 0x030017C0
_0803C644:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
_0803C650:
	cmp r0, #0x1c
	bne _0803C644
	ldrb r0, [r1, #3]
	cmp r0, r5
	bne _0803C644
	adds r0, r4, #1
	strb r0, [r6]
	b _0803C66C
_0803C660:
	strb r5, [r6]
	b _0803C66A
_0803C664:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_0803C66A:
	ldr r3, _0803C678 @ =0x030017C0
_0803C66C:
	movs r0, #0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C678: .4byte 0x030017C0

