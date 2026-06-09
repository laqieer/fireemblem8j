	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C6C10, "ax", %progbits
@ sub_80C6C10 @ JP 0x080C6C10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6C10
	.thumb_func
sub_80C6C10:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x32]
	subs r0, #1
	strh r0, [r1, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C6C26
	adds r0, r1, #0
	bl sub_8002DE4
_080C6C26:
	pop {r0}
	bx r0
	.align 2, 0

