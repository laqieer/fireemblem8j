	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8098968, "ax", %progbits
@ sub_8098968 @ JP 0x08098968 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098968
	.thumb_func
sub_8098968:
	push {lr}
	ldr r0, _08098978 @ =0x08A94238
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08098978: .4byte 0x08A94238

