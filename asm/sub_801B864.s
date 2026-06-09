	.syntax unified
	.set CountTotalSoundRoomSongs, 0x080B38B4 + 1
	.set GetCurrentBgmSong, 0x080021A8 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.section .text.sub_801B864, "ax", %progbits
@ sub_801B864 @ JP 0x0801B864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B864
	.thumb_func
sub_801B864:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl CountTotalSoundRoomSongs
	adds r4, r0, #0
	adds r6, r5, #0
	adds r6, #0x3c
	movs r0, #0
	strb r0, [r6]
	bl GetCurrentBgmSong
	movs r1, #0
	cmp r1, r4
	bge _0801B898
	cmp r0, #0
	bne _0801B888
	strb r1, [r6]
	b _0801B898
_0801B888:
	adds r1, #1
	cmp r1, r4
	bge _0801B898
	cmp r0, r1
	bne _0801B888
	adds r0, r5, #0
	adds r0, #0x3c
	strb r1, [r0]
_0801B898:
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r1, _0801B8E0 @ =0x08A9DDDC
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B8E4 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B8E0: .4byte 0x08A9DDDC
_0801B8E4: .4byte 0x02022CA8

