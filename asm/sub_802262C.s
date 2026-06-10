	.syntax unified
	.set sub_80D2C48, 0x080D2C48 + 1
	.section .text.sub_802262C, "ax", %progbits
@ sub_802262C @ JP 0x0802262C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802262C
	.thumb_func
sub_802262C:
	push {lr}
	bl sub_80D2C48
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802263C
	movs r0, #1
	b _0802263E
_0802263C:
	movs r0, #3
_0802263E:
	pop {r1}
	bx r1
	.align 2, 0

