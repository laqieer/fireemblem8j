	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_802DDA4, "ax", %progbits
@ sub_802DDA4 @ JP 0x0802DDA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DDA4
	.thumb_func
sub_802DDA4:
	push {lr}
	ldr r0, _0802DDB4 @ =0x085C40D4
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0802DDB4: .4byte 0x085C40D4

