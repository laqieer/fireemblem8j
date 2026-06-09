	.syntax unified
	.set sub_80C7240, 0x080C7240 + 1
	.section .text.sub_80C6BFC, "ax", %progbits
@ sub_80C6BFC @ JP 0x080C6BFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6BFC
	.thumb_func
sub_80C6BFC:
	push {lr}
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_80C7240
	pop {r0}
	bx r0

