	.syntax unified
	.set sub_80C21F4, 0x080C21F4 + 1
	.section .text.sub_80C2B7C, "ax", %progbits
@ sub_80C2B7C @ JP 0x080C2B7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2B7C
	.thumb_func
sub_80C2B7C:
	push {r4, r5, lr}
	adds r2, r0, #0
	cmp r1, #0
	blt _080C2B94
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_80C21F4
	b _080C2BA6
_080C2B94:
	adds r5, r2, #0
	adds r5, #0x2c
	movs r4, #6
_080C2B9A:
	ldm r5!, {r0}
	bl sub_80C21F4
	subs r4, #1
	cmp r4, #0
	bge _080C2B9A
_080C2BA6:
	pop {r4, r5}
	pop {r0}
	bx r0

