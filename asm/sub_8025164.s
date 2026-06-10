	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set InitTargets, 0x08050618 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_8024E5C, 0x08024E5C + 1
	.set sub_802506C, 0x0802506C + 1
	.section .text.sub_8025164, "ax", %progbits
@ sub_8025164 @ JP 0x08025164 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025164
	.thumb_func
sub_8025164:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _080251C0 @ =0x02033F38
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	ldr r0, _080251C4 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_801B674
	ldr r0, _080251C8 @ =sub_802512C
	bl sub_8024E5C
	bl sub_802506C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080251C0: .4byte 0x02033F38
_080251C4: .4byte 0x0202E4E0
_080251C8: .4byte 0x0802512D  @ sub_802512C

