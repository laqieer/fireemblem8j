	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_80059D8, "ax", %progbits
@ sub_80059D8 @ JP 0x080059D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80059D8
	.thumb_func
sub_80059D8:
	push {r4, lr}
	sub sp, #4
	movs r2, #0x34
	ldrsh r1, [r0, r2]
	ldr r3, _08005A04 @ =0x03003020
	ldrh r2, [r3, #0x1c]
	subs r1, r1, r2
	movs r4, #0x36
	ldrsh r2, [r0, r4]
	ldrh r3, [r3, #0x1e]
	subs r2, r2, r3
	ldr r3, [r0, #0x38]
	ldrh r0, [r0, #0x3c]
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005A04: .4byte 0x03003020

