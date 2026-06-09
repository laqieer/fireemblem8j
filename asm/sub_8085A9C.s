	.syntax unified
	.set CallSupportViewerEvent, 0x0800D5F4 + 1
	.set GetSupportTalkEntry, 0x08086A14 + 1
	.section .text.sub_8085A9C, "ax", %progbits
@ sub_8085A9C @ JP 0x08085A9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085A9C
	.thumb_func
sub_8085A9C:
	push {r4, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl GetSupportTalkEntry
	adds r1, r0, #0
	cmp r1, #0
	beq _08085AC0
	subs r0, r4, #1
	lsls r0, r0, #1
	adds r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	bl CallSupportViewerEvent
_08085AC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

