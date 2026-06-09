	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80AD1E0, "ax", %progbits
@ sub_80AD1E0 @ JP 0x080AD1E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD1E0
	.thumb_func
sub_80AD1E0:
	push {lr}
	ldr r0, _080AD1F0 @ =0x08A9CA64
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080AD1F0: .4byte 0x08A9CA64

