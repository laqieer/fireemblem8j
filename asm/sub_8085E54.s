	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8085E54, "ax", %progbits
@ sub_8085E54 @ JP 0x08085E54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085E54
	.thumb_func
sub_8085E54:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl sub_80D65C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08085E6C
	movs r0, #0
	b _08085E78
_08085E6C:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_08085E78:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

