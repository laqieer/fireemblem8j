	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_800BC00, "ax", %progbits
@ sub_800BC00 @ JP 0x0800BC00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BC00
	.thumb_func
sub_800BC00:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetBackgroundTileDataOffset
	adds r5, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r8, r0
	add r5, r8
	adds r0, r6, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	add r1, r8
	lsls r4, r4, #9
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_80D636C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

