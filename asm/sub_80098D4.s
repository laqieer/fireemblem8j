	.syntax unified
	.set sub_8009840, 0x08009840 + 1
	.set sub_80B7610, 0x080B7610 + 1
	.section .text.sub_80098D4, "ax", %progbits
@ sub_80098D4 @ JP 0x080098D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80098D4
	.thumb_func
sub_80098D4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009840
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_80B7610
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

