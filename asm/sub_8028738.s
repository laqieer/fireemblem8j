	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.set GetUnitSupporterNum, 0x0802833C + 1
	.section .text.sub_8028738, "ax", %progbits
@ sub_8028738 @ JP 0x08028738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8028738
	.thumb_func
sub_8028738:
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	bl GetUnitSupporterNum
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetUnitSupportLevel
	cmp r0, #2
	bgt _08028760
	movs r0, #0
	b _08028762
_08028760:
	movs r0, #1
_08028762:
	pop {r4, r5}
	pop {r1}
	bx r1

