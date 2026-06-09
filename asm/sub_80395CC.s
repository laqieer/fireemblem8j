	.syntax unified
	.set GetRecordDungeonValueByUiLabel, 0x08039314 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8039278, 0x08039278 + 1
	.section .text.sub_80395CC, "ax", %progbits
@ sub_80395CC @ JP 0x080395CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80395CC
	.thumb_func
sub_80395CC:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetRecordDungeonValueByUiLabel
	str r0, [r4, #0x30]
	movs r0, #0
	bl sub_8039278
	ldr r1, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	movs r0, #2
	str r0, [r4, #0x3c]
	ldr r0, _08039600 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080395FA
	movs r0, #0x74
	bl m4aSongNumStart
_080395FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039600: .4byte 0x0202BCEC

