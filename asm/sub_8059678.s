	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemType, 0x080172F0 + 1
	.set sub_80598BC, 0x080598BC + 1
	.section .text.sub_8059678, "ax", %progbits
@ sub_8059678 @ JP 0x08059678 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8059678
	.thumb_func
sub_8059678:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r1, #0
	mov sb, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _080596AC
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _080596B4
	mov r0, r8
	bl sub_80598BC
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080596B4
_080596AC:
	ldr r0, _080596B0 @ =0x0000FFFF
	b _08059738
	.align 2, 0
_080596B0: .4byte 0x0000FFFF
_080596B4:
	mov r1, r8
	cmp r1, #0
	bne _080596BE
	movs r2, #9
	b _080596C8
_080596BE:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080596C8:
	str r4, [sp]
	movs r0, #0
	mov r3, sb
	str r0, [r3]
	movs r7, #0
	movs r1, #0
_080596D4:
	ldr r5, [sp]
	movs r6, #0
	b _08059720
_080596DA:
	cmp r7, #0
	bne _080596E2
	cmp r0, #0xff
	bhi _0805971C
_080596E2:
	cmp r7, #1
	bne _080596EC
	ldrh r0, [r5]
	cmp r0, #0xff
	bls _0805971C
_080596EC:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	cmp r4, r0
	beq _0805970A
	ldrh r0, [r5]
	ldr r3, _08059718 @ =0xFFFFFF00
	adds r0, r0, r3
	cmp r0, r2
	bne _0805971C
_0805970A:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, sb
	str r6, [r0]
	movs r1, #1
	b _08059726
	.align 2, 0
_08059718: .4byte 0xFFFFFF00
_0805971C:
	adds r5, #4
	adds r6, #1
_08059720:
	ldrh r0, [r5]
	cmp r0, #0
	bne _080596DA
_08059726:
	cmp r1, #1
	beq _08059730
	adds r7, #1
	cmp r7, #1
	ble _080596D4
_08059730:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08059738:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

