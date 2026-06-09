	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C8C38, "ax", %progbits
@ sub_80C8C38 @ JP 0x080C8C38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8C38
	.thumb_func
sub_80C8C38:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C8C48 @ =0x08AC2898
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080C8C48: .4byte 0x08AC2898

