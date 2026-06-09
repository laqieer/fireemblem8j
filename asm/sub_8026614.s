	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8026614, "ax", %progbits
@ sub_8026614 @ JP 0x08026614 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026614
	.thumb_func
sub_8026614:
	push {lr}
	ldr r0, _08026628 @ =0x085C7400
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_08026628: .4byte 0x085C7400

