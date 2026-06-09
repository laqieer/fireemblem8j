	.syntax unified
	.set GetSupportTalkSong, 0x08086A58 + 1
	.section .text.sub_8085AC8, "ax", %progbits
@ sub_8085AC8 @ JP 0x08085AC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085AC8
	.thumb_func
sub_8085AC8:
	push {lr}
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl GetSupportTalkSong
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

