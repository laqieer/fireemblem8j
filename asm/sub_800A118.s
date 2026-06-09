	.syntax unified
	.set CopyString, 0x08012F78 + 1
	.set sub_8031430, 0x08031430 + 1
	.section .text.sub_800A118, "ax", %progbits
@ sub_800A118 @ JP 0x0800A118 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A118
	.thumb_func
sub_800A118:
	push {r4, r5, lr}
	ldr r5, _0800A130 @ =0x0202B4A8
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _0800A134 @ =0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl CopyString
	b _0800A17C
	.align 2, 0
_0800A130: .4byte 0x0202B4A8
_0800A134: .4byte 0xFFFFF200
_0800A138:
	adds r1, r0, #0
	cmp r1, #0x1f
	bls _0800A156
	cmp r1, #0x80
	beq _0800A148
	strb r0, [r4]
	adds r5, #1
	b _0800A152
_0800A148:
	adds r5, #1
	ldrb r0, [r5]
	cmp r0, #0x20
	beq _0800A15E
	strb r1, [r4]
_0800A152:
	adds r4, #1
	ldrb r0, [r5]
_0800A156:
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	b _0800A17C
_0800A15E:
	bl sub_8031430
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0800A17A
_0800A172:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800A172
_0800A17A:
	adds r5, r1, #0
_0800A17C:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A138
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800A190 @ =0x0202B5A8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800A190: .4byte 0x0202B5A8

