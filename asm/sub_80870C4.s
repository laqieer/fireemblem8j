	.syntax unified
	.set sub_8086F78, 0x08086F78 + 1
	.section .text.sub_80870C4, "ax", %progbits
@ sub_80870C4 @ JP 0x080870C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80870C4
	.thumb_func
sub_80870C4:
	push {lr}
	movs r0, #0
	bl sub_8086F78
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

