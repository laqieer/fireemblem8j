	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8089E7C, "ax", %progbits
@ sub_8089E7C @ JP 0x08089E7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089E7C
	.thumb_func
sub_8089E7C:
	push {lr}
	ldr r0, _08089E8C @ =0x08A728FC
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08089E8C: .4byte 0x08A728FC

