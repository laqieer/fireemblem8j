	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set efxMaohFlash_GetSideXOffset, 0x08069010 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8068EB0, 0x08068EB0 + 1
	.set sub_8069728, 0x08069728 + 1
	.section .text.sub_80695C4, "ax", %progbits
@ sub_80695C4 @ JP 0x080695C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80695C4
	.thumb_func
sub_80695C4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl efxMaohFlash_GetSideXOffset
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080695FA
	cmp r4, #0
	beq _080695F4
	adds r0, r2, #0
	adds r0, #0x38
	b _080696A4
_080695F4:
	adds r0, r2, #0
	adds r0, #0xb8
	b _080696A4
_080695FA:
	cmp r0, #0xa
	bne _0806960E
	cmp r4, #0
	beq _08069608
	adds r0, r2, #0
	adds r0, #0x20
	b _080696C6
_08069608:
	adds r0, r2, #0
	adds r0, #0xd0
	b _080696C6
_0806960E:
	cmp r0, #0xe
	bne _08069622
	cmp r4, #0
	beq _0806961C
	adds r0, r2, #0
	adds r0, #0xe
	b _080696EA
_0806961C:
	adds r0, r2, #0
	adds r0, #0xe2
	b _080696EA
_08069622:
	cmp r0, #0x18
	bne _08069636
	cmp r4, #0
	beq _08069630
	adds r0, r2, #0
	adds r0, #0x62
	b _08069682
_08069630:
	adds r0, r2, #0
	adds r0, #0x8e
	b _08069682
_08069636:
	cmp r0, #0x22
	bne _0806964A
	cmp r4, #0
	beq _08069644
	adds r0, r2, #0
	adds r0, #0x30
	b _080696A4
_08069644:
	adds r0, r2, #0
	adds r0, #0xc0
	b _080696A4
_0806964A:
	cmp r0, #0x2c
	bne _0806965E
	cmp r4, #0
	beq _08069658
	adds r0, r2, #0
	adds r0, #0x18
	b _080696C6
_08069658:
	adds r0, r2, #0
	adds r0, #0xd8
	b _080696C6
_0806965E:
	cmp r0, #0x30
	bne _08069670
	cmp r4, #0
	beq _0806966A
	adds r0, r2, #6
	b _080696EA
_0806966A:
	adds r0, r2, #0
	adds r0, #0xea
	b _080696EA
_08069670:
	cmp r0, #0x34
	bne _08069692
	cmp r4, #0
	beq _0806967E
	adds r0, r2, #0
	adds r0, #0x6a
	b _08069682
_0806967E:
	adds r0, r2, #0
	adds r0, #0x86
_08069682:
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	movs r3, #0x62
	bl sub_8069728
	b _0806971C
_08069692:
	cmp r0, #0x38
	bne _080696B4
	cmp r4, #0
	beq _080696A0
	adds r0, r2, #0
	adds r0, #0x58
	b _080696A4
_080696A0:
	adds r0, r2, #0
	adds r0, #0x98
_080696A4:
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	movs r3, #0x6e
	bl sub_8069728
	b _0806971C
_080696B4:
	cmp r0, #0x3c
	bne _080696D6
	cmp r4, #0
	beq _080696C2
	adds r0, r2, #0
	adds r0, #0x10
	b _080696C6
_080696C2:
	adds r0, r2, #0
	adds r0, #0xe0
_080696C6:
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	movs r3, #0x6c
	bl sub_8069728
	b _0806971C
_080696D6:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	cmp r1, #0x40
	bne _080696FA
	cmp r4, #0
	beq _080696E6
	subs r0, r2, #2
	b _080696EA
_080696E6:
	adds r0, r2, #0
	adds r0, #0xf2
_080696EA:
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	movs r3, #0x68
	bl sub_8069728
	b _0806971C
_080696FA:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0806971C
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x5c]
	movs r1, #0x5a
	movs r2, #0x2d
	bl sub_8068EB0
	ldr r1, _08069724 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
_0806971C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069724: .4byte 0x0201774C

