	.syntax unified
	.set AnimClearAll, 0x08004DC0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805B764, "ax", %progbits
@ sub_805B764 @ JP 0x0805B764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B764
	.thumb_func
sub_805B764:
	push {r4, lr}
	ldr r4, _0805B77C @ =0x0201FB18
	ldr r0, _0805B780 @ =0x085E3FDC
	movs r1, #4
	bl sub_8002BCC
	str r0, [r4]
	bl AnimClearAll
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B77C: .4byte 0x0201FB18
_0805B780: .4byte 0x085E3FDC

