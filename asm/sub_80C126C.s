	.syntax unified
	.set sub_8003D84, 0x08003D84 + 1
	.section .text.sub_80C126C, "ax", %progbits
@ sub_80C126C @ JP 0x080C126C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C126C
	.thumb_func
sub_80C126C:
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x60
	ldrb r2, [r1]
	cmp r4, r2
	bge _080C1292
	adds r6, r0, #0
	adds r6, #0x34
	adds r5, r1, #0
_080C1280:
	ldm r6!, {r0}
	adds r0, #0x34
	movs r1, #0
	bl sub_8003D84
	adds r4, #1
	ldrb r0, [r5]
	cmp r4, r0
	blt _080C1280
_080C1292:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

