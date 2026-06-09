	.syntax unified
	.set nullsub_15, 0x08009F38 + 1
	.set sub_801C2B8, 0x0801C2B8 + 1
	.set sub_803113C, 0x0803113C + 1
	.set sub_8031160, 0x08031160 + 1
	.section .text.sub_801B820, "ax", %progbits
@ sub_801B820 @ JP 0x0801B820 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B820
	.thumb_func
sub_801B820:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_803113C
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_801C2B8
	ldr r4, _0801B85C @ =0x0202BCEC
	strb r0, [r4, #0xe]
	ldr r0, _0801B860 @ =0x03001778
	ldrb r0, [r0]
	strb r0, [r4, #0x1b]
	bl sub_8031160
	bl nullsub_15
	adds r4, #0x4a
	ldrb r1, [r4]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B85C: .4byte 0x0202BCEC
_0801B860: .4byte 0x03001778

