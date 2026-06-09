	.syntax unified
	.set sub_8086F78, 0x08086F78 + 1
	.section .text.sub_8087084, "ax", %progbits
@ sub_8087084 @ JP 0x08087084 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087084
	.thumb_func
sub_8087084:
	push {lr}
	movs r0, #0
	bl sub_8086F78
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

