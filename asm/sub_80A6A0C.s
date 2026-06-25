	.syntax unified
	.section .text.sub_80A6A0C, "ax", %progbits
@ sub_80A6A0C @ JP 0x080A6A0C - region-different, gbadisasm descriptive asm
@ split from sub_80A69F8 (gbadisasm folded these trailing leaves as data)
	.thumb
	.global sub_80A6A0C
	.thumb_func
sub_80A6A0C:
	ldr r2, [r0, #8]
	strb r2, [r1]
	ldr r0, [r0, #4]
	strb r0, [r1, #1]
	asrs r0, r0, #0x10
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
	.global sub_80A6A1C
	.thumb_func
sub_80A6A1C:
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xd
	muls r0, r1
	adds r0, #1
	movs r1, #0xff
	ands r0, r1
	str r0, [r2, #0xc]
	bx lr
	.align 2, 0
