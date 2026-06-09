	.syntax unified
	.set sub_8087154, 0x08087154 + 1
	.section .text.sub_80871A4, "ax", %progbits
@ sub_80871A4 @ JP 0x080871A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80871A4
	.thumb_func
sub_80871A4:
	push {lr}
	movs r0, #0
	bl sub_8087154
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

