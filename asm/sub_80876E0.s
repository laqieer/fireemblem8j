	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80876E0, "ax", %progbits
@ sub_80876E0 @ JP 0x080876E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80876E0
	.thumb_func
sub_80876E0:
	push {lr}
	ldr r0, _080876F0 @ =0x08A60110
	movs r1, #4
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080876F0: .4byte 0x08A60110

