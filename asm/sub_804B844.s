	.syntax unified
	.set SioSend, 0x08042238 + 1
	.section .text.sub_804B844, "ax", %progbits
@ sub_804B844 @ JP 0x0804B844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B844
	.thumb_func
sub_804B844:
	push {lr}
	ldr r0, _0804B870 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B86C
	ldr r0, _0804B874 @ =0x03004EFC
	movs r2, #0
	movs r1, #0xc4
	strb r1, [r0]
	ldr r1, _0804B878 @ =0x085D31E8
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
_0804B86C:
	pop {r0}
	bx r0
	.align 2, 0
_0804B870: .4byte 0x085775CC
_0804B874: .4byte 0x03004EFC
_0804B878: .4byte 0x085D31E8

