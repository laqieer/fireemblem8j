	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80B3198, "ax", %progbits
@ sub_80B3198 @ JP 0x080B3198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3198
	.thumb_func
sub_80B3198:
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _080B31C6
	adds r4, r1, #0
	adds r4, #0x34
	ldrb r0, [r4]
	ldr r1, [r1, #0x3c]
	bl SetBackgroundTileDataOffset
	ldrb r0, [r4]
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl BG_EnableSyncByMask
_080B31C6:
	pop {r4}
	pop {r0}
	bx r0

