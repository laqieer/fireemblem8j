	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set InitTargets, 0x08050618 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_8024E5C, 0x08024E5C + 1
	.set sub_802506C, 0x0802506C + 1
	.set sub_8037A6C, 0x08037A6C + 1
	.section .text.sub_80256D8, "ax", %progbits
@ sub_80256D8 @ JP 0x080256D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80256D8
	.thumb_func
sub_80256D8:
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08025738 @ =0x02033F38
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8037A6C
	adds r7, r0, #0
	cmp r7, #0
	beq _08025732
	ldr r0, _0802573C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_801B674
	ldr r0, _08025740 @ =sub_80256A0
	bl sub_8024E5C
	bl sub_802506C
_08025732:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025738: .4byte 0x02033F38
_0802573C: .4byte 0x0202E4E0
_08025740: .4byte 0x080256A1  @ sub_80256A0

