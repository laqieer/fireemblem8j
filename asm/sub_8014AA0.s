	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set Memset16, 0x08014958 + 1
	.section .text.sub_8014AA0, "ax", %progbits
@ sub_8014AA0 @ JP 0x08014AA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014AA0
	.thumb_func
sub_8014AA0:
	push {r4, r5, lr}
	ldr r4, _08014B24 @ =0x03003020
	ldrb r1, [r4, #0xc]
	movs r5, #0x80
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014AC4
	movs r0, #0
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl Memset16
_08014AC4:
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014AE2
	movs r0, #1
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl Memset16
_08014AE2:
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014B00
	movs r0, #2
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl Memset16
_08014B00:
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014B1E
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl Memset16
_08014B1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014B24: .4byte 0x03003020

