	.syntax unified
	.set GetHpBarMidTiles, 0x0808DF38 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_808DF20, 0x0808DF20 + 1
	.set sub_808DF74, 0x0808DF74 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_808DF94, "ax", %progbits
@ sub_808DF94 @ JP 0x0808DF94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DF94
	.thumb_func
sub_808DF94:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl sub_8018E64
	movs r1, #0x32
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_808DF20
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl GetHpBarMidTiles
	adds r5, #0xc
	subs r4, #0x2d
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_808DF74
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

