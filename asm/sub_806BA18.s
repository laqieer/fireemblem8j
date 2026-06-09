	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806BA18, "ax", %progbits
@ sub_806BA18 @ JP 0x0806BA18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BA18
	.thumb_func
sub_806BA18:
	push {lr}
	ldr r0, _0806BA28 @ =0x08602B04
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0806BA28: .4byte 0x08602B04

