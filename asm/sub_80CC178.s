	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_80CC0F0, 0x080CC0F0 + 1
	.section .text.sub_80CC178, "ax", %progbits
@ sub_80CC178 @ JP 0x080CC178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC178
	.thumb_func
sub_80CC178:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	asrs r1, r1, #3
	adds r4, r1, #0
	adds r4, #0x15
	asrs r0, r6, #3
	adds r0, #0x15
	cmp r4, r0
	bge _080CC19A
	adds r5, r0, #0
_080CC18C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_80CC0F0
	adds r4, #1
	cmp r4, r5
	blt _080CC18C
_080CC19A:
	movs r2, #0x60
	subs r2, r2, r6
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0

