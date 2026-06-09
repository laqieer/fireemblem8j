	.syntax unified
	.set sub_8087238, 0x08087238 + 1
	.section .text.sub_80873C4, "ax", %progbits
@ sub_80873C4 @ JP 0x080873C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80873C4
	.thumb_func
sub_80873C4:
	push {lr}
	movs r0, #0
	bl sub_8087238
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

