	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_802DDB8, "ax", %progbits
@ sub_802DDB8 @ JP 0x0802DDB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DDB8
	.thumb_func
sub_802DDB8:
	push {lr}
	ldr r0, _0802DDC8 @ =0x085C40EC
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0802DDC8: .4byte 0x085C40EC

