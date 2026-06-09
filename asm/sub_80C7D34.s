	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C7C08, 0x080C7C08 + 1
	.set sub_80C7CA8, 0x080C7CA8 + 1
	.section .text.sub_80C7D34, "ax", %progbits
@ sub_80C7D34 @ JP 0x080C7D34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7D34
	.thumb_func
sub_80C7D34:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C7CA8
	bl sub_80C7C08
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C7D4C
	adds r0, r4, #0
	bl sub_8002DE4
_080C7D4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

