	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8087C9C, "ax", %progbits
@ sub_8087C9C @ JP 0x08087C9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087C9C
	.thumb_func
sub_8087C9C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087CB0 @ =0x08A601A0
	bl sub_8002BCC
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087CB0: .4byte 0x08A601A0

