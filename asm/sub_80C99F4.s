	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C96D0, 0x080C96D0 + 1
	.section .text.sub_80C99F4, "ax", %progbits
@ sub_80C99F4 @ JP 0x080C99F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C99F4
	.thumb_func
sub_80C99F4:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	subs r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C9A0A
	adds r0, r4, #0
	bl sub_8002DE4
_080C9A0A:
	adds r0, r4, #0
	bl sub_80C96D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

