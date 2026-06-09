	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_8018EE4, 0x08018EE4 + 1
	.set sub_8018F24, 0x08018F24 + 1
	.set sub_8018F64, 0x08018F64 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.set sub_8018FAC, 0x08018FAC + 1
	.section .text.sub_802A4F0, "ax", %progbits
@ sub_802A4F0 @ JP 0x0802A4F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A4F0
	.thumb_func
sub_802A4F0:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	beq _0802A5C6
	movs r2, #0x48
	bl memcpy
	adds r0, r6, #0
	bl sub_8018EA4
	movs r4, #0
	strb r0, [r5, #0x12]
	adds r0, r6, #0
	bl sub_8018EC4
	strb r0, [r5, #0x14]
	adds r0, r6, #0
	bl sub_8018EE4
	strb r0, [r5, #0x15]
	adds r0, r6, #0
	bl sub_8018F24
	strb r0, [r5, #0x16]
	adds r0, r6, #0
	bl sub_8018F64
	strb r0, [r5, #0x17]
	adds r0, r6, #0
	bl sub_8018FAC
	strb r0, [r5, #0x19]
	adds r0, r6, #0
	bl sub_8018F84
	strb r0, [r5, #0x18]
	ldr r2, [r6, #4]
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	ldrb r0, [r2, #0x11]
	adds r1, r1, r0
	ldrb r0, [r6, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	ldrb r0, [r2, #0x12]
	ldrb r6, [r6, #0x1d]
	adds r0, r0, r6
	strb r0, [r5, #0x1d]
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x70
	strb r1, [r0]
	ldrb r0, [r5, #9]
	adds r1, r5, #0
	adds r1, #0x71
	strb r0, [r1]
	ldrb r0, [r5, #0x13]
	adds r1, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x73
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _0802A5CC @ =0x0203A4E8
	adds r0, r2, #0
	adds r0, #0x7b
	strb r4, [r0]
	ldr r1, _0802A5D0 @ =0x0203A568
	adds r0, r1, #0
	adds r0, #0x7b
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #0x28
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x6e
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x6e
	strb r4, [r0]
_0802A5C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5CC: .4byte 0x0203A4E8
_0802A5D0: .4byte 0x0203A568

