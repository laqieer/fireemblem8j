	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80164F8, 0x080164F8 + 1
	.set sub_8025164, 0x08025164 + 1
	.section .text.sub_802495C, "ax", %progbits
@ sub_802495C @ JP 0x0802495C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802495C
	.thumb_func
sub_802495C:
	push {r4, r5, r6, lr}
	ldr r0, _08024978 @ =0x03004DF0
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080249CC
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08024980
	b _080249CC
	.align 2, 0
_08024978: .4byte 0x03004DF0
_0802497C:
	movs r0, #1
	b _080249CE
_08024980:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq _080249CC
_08024988:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080249B6
	ldr r5, _080249D4 @ =0x03004DF0
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_80164F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080249B6
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_8025164
	bl GetSelectTargetCount
	cmp r0, #0
	bne _0802497C
_080249B6:
	adds r6, #1
	cmp r6, #4
	bgt _080249CC
	ldr r0, _080249D4 @ =0x03004DF0
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08024988
_080249CC:
	movs r0, #3
_080249CE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080249D4: .4byte 0x03004DF0

