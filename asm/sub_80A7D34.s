	.syntax unified
	.set IsGameSaveNotFirstChapter, 0x080A9CF4 + 1
	.set IsMultiArenaSaveReady, 0x080AB480 + 1
	.set IsSramWorking, 0x080A76F4 + 1
	.section .text.sub_80A7D34, "ax", %progbits
@ sub_80A7D34 @ JP 0x080A7D34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7D34
	.thumb_func
sub_80A7D34:
	push {r4, lr}
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A7D48
	movs r0, #0
	b _080A7D64
_080A7D44:
	movs r0, #1
	b _080A7D64
_080A7D48:
	movs r4, #0
_080A7D4A:
	adds r0, r4, #0
	bl IsGameSaveNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A7D44
	adds r4, #1
	cmp r4, #2
	ble _080A7D4A
	bl IsMultiArenaSaveReady
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080A7D64:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

