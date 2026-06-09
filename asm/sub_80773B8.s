	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemType, 0x080172F0 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80775BC, 0x080775BC + 1
	.set sub_807785C, 0x0807785C + 1
	.section .text.sub_80773B8, "ax", %progbits
@ sub_80773B8 @ JP 0x080773B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80773B8
	.thumb_func
sub_80773B8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	mov sl, r0
	mov r8, r0
	movs r7, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080773E4
	ldr r0, _080773E0 @ =0x0203E184
	b _080773E6
	.align 2, 0
_080773E0: .4byte 0x0203E184
_080773E4:
	ldr r0, _08077434 @ =0x0203E188
_080773E6:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r5, [r0, #4]
	cmp r5, #9
	bge _080773F2
	b _080774F4
_080773F2:
	cmp r5, #0xc
	ble _080773F8
	b _080774F4
_080773F8:
	ldr r0, _08077438 @ =0x0203E190
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #9
	bne _08077408
	movs r2, #0
	mov sb, r2
_08077408:
	cmp r0, #0xa
	bne _08077410
	movs r2, #0
	mov sb, r2
_08077410:
	cmp r0, #0xb
	bne _08077418
	movs r2, #1
	mov sb, r2
_08077418:
	cmp r0, #0xc
	bne _08077420
	movs r0, #1
	mov sb, r0
_08077420:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807743C
	movs r0, #1
	b _08077442
	.align 2, 0
_08077434: .4byte 0x0203E188
_08077438: .4byte 0x0203E190
_0807743C:
	adds r0, r4, #0
	bl GetItemType
_08077442:
	cmp r0, #1
	beq _0807744C
	cmp r0, #2
	beq _08077452
	b _08077464
_0807744C:
	movs r1, #0
	mov r8, r1
	b _08077464
_08077452:
	adds r0, r4, #0
	bl GetItemIndex
	movs r2, #1
	mov r8, r2
	cmp r0, #0x28
	bne _08077464
	movs r0, #2
	mov r8, r0
_08077464:
	ldr r0, _080774A0 @ =0x0203E190
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #9
	bne _08077474
	movs r2, #0
	mov sl, r2
_08077474:
	cmp r0, #0xa
	bne _0807747C
	movs r2, #0
	mov sl, r2
_0807747C:
	cmp r0, #0xb
	bne _08077484
	movs r2, #1
	mov sl, r2
_08077484:
	cmp r0, #0xc
	bne _0807748C
	movs r0, #1
	mov sl, r0
_0807748C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080774A4
	movs r0, #1
	b _080774AA
	.align 2, 0
_080774A0: .4byte 0x0203E190
_080774A4:
	adds r0, r4, #0
	bl GetItemType
_080774AA:
	cmp r0, #1
	beq _080774B4
	cmp r0, #2
	beq _080774B8
	b _080774C6
_080774B4:
	movs r7, #0
	b _080774C6
_080774B8:
	adds r0, r4, #0
	bl GetItemIndex
	movs r7, #1
	cmp r0, #0x28
	bne _080774C6
	movs r7, #2
_080774C6:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_807785C
	ldr r0, _080774EC @ =0x0203E188
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x28
	bne _0807759C
	ldr r1, _080774F0 @ =0x0202013C
	movs r0, #0
	b _080775A0
	.align 2, 0
_080774EC: .4byte 0x0203E188
_080774F0: .4byte 0x0202013C
_080774F4:
	ldr r0, _08077520 @ =0x0203E190
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x48
	bne _08077504
	movs r2, #0
	mov sb, r2
_08077504:
	cmp r0, #0x49
	bne _0807750C
	movs r0, #1
	mov sb, r0
_0807750C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08077524
	movs r0, #1
	b _0807752E
	.align 2, 0
_08077520: .4byte 0x0203E190
_08077524:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _08077538
_0807752E:
	cmp r0, #1
	bne _0807753C
	movs r1, #0
	mov r8, r1
	b _0807753C
_08077538:
	movs r2, #1
	mov r8, r2
_0807753C:
	ldr r0, _08077568 @ =0x0203E190
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x48
	bne _0807754C
	movs r2, #0
	mov sl, r2
_0807754C:
	cmp r0, #0x49
	bne _08077554
	movs r0, #1
	mov sl, r0
_08077554:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807756C
	movs r0, #1
	b _08077576
	.align 2, 0
_08077568: .4byte 0x0203E190
_0807756C:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0807757E
_08077576:
	cmp r0, #1
	bne _08077580
	movs r7, #0
	b _08077580
_0807757E:
	movs r7, #1
_08077580:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, sb
	mov r2, sl
	mov r3, r8
	bl sub_80775BC
	cmp r5, #0x48
	bne _0807759C
	ldr r1, _08077598 @ =0x0202013C
	movs r0, #0
	b _080775A0
	.align 2, 0
_08077598: .4byte 0x0202013C
_0807759C:
	ldr r1, _080775B8 @ =0x0202013C
	movs r0, #1
_080775A0:
	str r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080775B8: .4byte 0x0202013C

