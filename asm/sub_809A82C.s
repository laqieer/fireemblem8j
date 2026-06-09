	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_809A82C, "ax", %progbits
@ sub_809A82C @ JP 0x0809A82C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A82C
	.thumb_func
sub_809A82C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809A844 @ =0x08A946D0
	bl sub_8002BCC
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_0809A844: .4byte 0x08A946D0

