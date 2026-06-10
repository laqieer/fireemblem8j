	.syntax unified
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.section .text.sub_801FD94, "ax", %progbits
@ sub_801FD94 @ JP 0x0801FD94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FD94
	.thumb_func
sub_801FD94:
	push {r4, lr}
	ldr r4, _0801FDE4 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #0x15]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r4, #0x15]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FDE4: .4byte 0x03003020

