	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B9570, "ax", %progbits
@ sub_80B9570 @ JP 0x080B9570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9570
	.thumb_func
sub_80B9570:
	push {lr}
	adds r1, r0, #0
	movs r0, #0x84
	lsls r0, r0, #4
	bl sub_80B8CF0
	pop {r0}
	bx r0

