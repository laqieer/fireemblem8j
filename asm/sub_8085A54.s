	.syntax unified
	.set CallMapSupportEvent, 0x0800D5C8 + 1
	.set GetSupportTalkEntry, 0x08086A14 + 1
	.set GetSupportTalkSong, 0x08086A58 + 1
	.set sub_80A8168, 0x080A8168 + 1
	.section .text.sub_8085A54, "ax", %progbits
@ sub_8085A54 @ JP 0x08085A54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085A54
	.thumb_func
sub_8085A54:
	push {r4, r5, r6, r7, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportTalkEntry
	adds r7, r0, #0
	cmp r7, #0
	beq _08085A96
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetSupportTalkSong
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r2, r6, #1
	lsls r2, r2, #1
	adds r1, r7, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CallMapSupportEvent
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80A8168
_08085A96:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

