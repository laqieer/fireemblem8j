	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80225F4, "ax", %progbits
@ sub_80225F4 @ JP 0x080225F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80225F4
	.thumb_func
sub_80225F4:
	push {lr}
	ldr r0, _08022604 @ =0x08AAFA44
	movs r1, #3
	bl sub_8002BCC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022604: .4byte 0x08AAFA44

