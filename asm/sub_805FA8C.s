	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805FA8C, "ax", %progbits
@ sub_805FA8C @ JP 0x0805FA8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805FA8C
	.thumb_func
sub_805FA8C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FAA8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FAAC @ =0x085FFAB8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAA8: .4byte 0x0201774C
_0805FAAC: .4byte 0x085FFAB8

