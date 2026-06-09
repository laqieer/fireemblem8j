	.syntax unified
	.set sub_8087238, 0x08087238 + 1
	.section .text.sub_8087374, "ax", %progbits
@ sub_8087374 @ JP 0x08087374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087374
	.thumb_func
sub_8087374:
	push {lr}
	movs r0, #0
	bl sub_8087238
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

