	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8018144, 0x08018144 + 1
	.set sub_8018DC8, 0x08018DC8 + 1
	.set sub_8019040, 0x08019040 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807B9B0, 0x0807B9B0 + 1
	.section .text.sub_80103F4, "ax", %progbits
@ sub_80103F4 @ JP 0x080103F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80103F4
	.thumb_func
sub_80103F4:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08010428 @ =0x080DC56C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r1, [r6, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl sub_800BF3C
	adds r5, r0, #0
	cmp r4, #0xa
	blt _0801042C
	cmp r4, #0xc
	ble _08010434
	cmp r4, #0xf
	bgt _0801042C
	cmp r5, #0
	bne _08010434
	b _08010602
	.align 2, 0
_08010428: .4byte 0x080DC56C
_0801042C:
	cmp r5, #0
	bne _08010434
	movs r0, #6
	b _08010604
_08010434:
	cmp r4, #0xf
	bls _0801043A
	b _080105F6
_0801043A:
	lsls r0, r4, #2
	ldr r1, _08010444 @ =_08010448
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010444: .4byte _08010448
_08010448: @ jump table
	.4byte _08010488 @ case 0
	.4byte _08010494 @ case 1
	.4byte _080104A0 @ case 2
	.4byte _080104A0 @ case 3
	.4byte _080104A0 @ case 4
	.4byte _080104AE @ case 5
	.4byte _080104CC @ case 6
	.4byte _080104D2 @ case 7
	.4byte _080104D8 @ case 8
	.4byte _080105F6 @ case 9
	.4byte _08010528 @ case 10
	.4byte _0801055C @ case 11
	.4byte _08010582 @ case 12
	.4byte _080105A8 @ case 13
	.4byte _080105D8 @ case 14
	.4byte _080105F0 @ case 15
_08010488:
	ldr r0, [r5, #0xc]
	ldr r1, _08010490 @ =0x04010001
	b _08010504
	.align 2, 0
_08010490: .4byte 0x04010001
_08010494:
	ldr r0, [r5, #0xc]
	ldr r1, _0801049C @ =0xFBFEFFFE
	b _080104FA
	.align 2, 0
_0801049C: .4byte 0xFBFEFFFE
_080104A0:
	subs r0, r4, #2
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_8018144
	b _080105F6
_080104AE:
	ldr r4, _080104C8 @ =0x030004B0
	ldr r1, [r4, #4]
	adds r0, r5, #0
	bl sub_8019040
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080104C0
	b _080105F6
_080104C0:
	ldr r0, [r5, #0xc]
	movs r1, #4
	b _08010504
	.align 2, 0
_080104C8: .4byte 0x030004B0
_080104CC:
	ldr r0, [r5, #0xc]
	movs r1, #2
	b _08010504
_080104D2:
	ldr r0, [r5, #0xc]
	movs r1, #0x40
	b _08010504
_080104D8:
	ldr r0, _080104F0 @ =0x030004B0
	ldr r1, [r0, #4]
	cmp r1, #1
	beq _080104F4
	cmp r1, #1
	blo _08010500
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801050A
	b _080105F6
	.align 2, 0
_080104F0: .4byte 0x030004B0
_080104F4:
	ldr r0, [r5, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
_080104FA:
	ands r0, r1
	str r0, [r5, #0xc]
	b _080105F6
_08010500:
	ldr r0, [r5, #0xc]
	movs r1, #8
_08010504:
	orrs r0, r1
	str r0, [r5, #0xc]
	b _080105F6
_0801050A:
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _0801051E
	movs r0, #8
	orrs r1, r0
	str r1, [r5, #0xc]
	b _080105F6
_0801051E:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0xc]
	b _080105F6
_08010528:
	bl sub_807B4B8
	movs r4, #1
_0801052E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08010550
	ldr r0, [r2]
	cmp r0, #0
	beq _08010550
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #0x2e
	ands r0, r1
	str r0, [r2, #0xc]
_08010550:
	adds r4, #1
	cmp r4, #0x3f
	ble _0801052E
	bl sub_8018DC8
	b _080105F6
_0801055C:
	bl sub_807B4B8
	movs r4, #0x41
_08010562:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0801057A
	ldr r0, [r1]
	cmp r0, #0
	beq _0801057A
	adds r0, r1, #0
	bl sub_801759C
_0801057A:
	adds r4, #1
	cmp r4, #0x7f
	ble _08010562
	b _080105F6
_08010582:
	bl sub_807B4B8
	movs r4, #0x81
_08010588:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080105A0
	ldr r0, [r1]
	cmp r0, #0
	beq _080105A0
	adds r0, r1, #0
	bl sub_801759C
_080105A0:
	adds r4, #1
	cmp r4, #0xbf
	ble _08010588
	b _080105F6
_080105A8:
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010602
	adds r0, r5, #0
	bl sub_80280A0
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl sub_807A888
	adds r4, r0, #0
	bl sub_807AB0C
	adds r0, r4, #0
	bl sub_807B9B0
	movs r0, #2
	b _08010604
_080105D8:
	ldr r0, _080105EC @ =0x08A13308
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	bge _080105F0
	movs r0, #3
	b _08010604
	.align 2, 0
_080105EC: .4byte 0x08A13308
_080105F0:
	adds r0, r5, #0
	bl sub_801759C
_080105F6:
	bl RefreshEntityBmMaps
	bl sub_8027144
	bl sub_8019914
_08010602:
	movs r0, #0
_08010604:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

