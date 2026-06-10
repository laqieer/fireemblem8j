	.syntax unified
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F98, 0x08003F98 + 1
	.section .text.sub_8042D6C, "ax", %progbits
@ sub_8042D6C @ JP 0x08042D6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042D6C
	.thumb_func
sub_8042D6C:
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
	bl sub_8003F98
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

