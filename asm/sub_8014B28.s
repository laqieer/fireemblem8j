	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8014B28, "ax", %progbits
@ sub_8014B28 @ JP 0x08014B28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014B28
	.thumb_func
sub_8014B28:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _08014B36
	movs r0, #0x60
	rsbs r0, r0, #0
	b _08014B4C
_08014B36:
	cmp r1, #0xef
	bgt _08014B4A
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl sub_80D6374
	subs r0, #0x60
	b _08014B4C
_08014B4A:
	movs r0, #0x5f
_08014B4C:
	pop {r1}
	bx r1

