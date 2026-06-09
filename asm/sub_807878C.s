	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807878C, "ax", %progbits
@ sub_807878C @ JP 0x0807878C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807878C
	.thumb_func
sub_807878C:
	push {lr}
	ldr r0, _0807879C @ =0x087E1B48
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0807879C: .4byte 0x087E1B48

