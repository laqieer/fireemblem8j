	.syntax unified
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_80043B8, "ax", %progbits
@ sub_80043B8 @ JP 0x080043B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80043B8
	.thumb_func
sub_80043B8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_8003D84
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003D90
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8003F28
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

