	.syntax unified
	.set sub_80C7240, 0x080C7240 + 1
	.section .text.sub_80C6C2C, "ax", %progbits
@ sub_80C6C2C @ JP 0x080C6C2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6C2C
	.thumb_func
sub_80C6C2C:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	bl sub_80C7240
	movs r0, #0
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

