	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8035580, "ax", %progbits
@ sub_8035580 @ JP 0x08035580 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035580
	.thumb_func
sub_8035580:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x58
	movs r1, #0x1f
	strh r1, [r2]
	adds r0, #0x5a
	movs r1, #6
	strh r1, [r0]
	ldr r0, _0803559C @ =0x085C6668
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0803559C: .4byte 0x085C6668

