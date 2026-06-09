	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8076A58, "ax", %progbits
@ sub_8076A58 @ JP 0x08076A58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076A58
	.thumb_func
sub_8076A58:
	push {lr}
	ldr r0, _08076A6C @ =0x087A9930
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08076A6C: .4byte 0x087A9930

