	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8033530, "ax", %progbits
@ sub_8033530 @ JP 0x08033530 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033530
	.thumb_func
sub_8033530:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08033540 @ =0x085C6084
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08033540: .4byte 0x085C6084

