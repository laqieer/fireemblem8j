	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_8099FA0, 0x08099FA0 + 1
	.set sub_809F514, 0x0809F514 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1DD8, 0x080B1DD8 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809FF74, "ax", %progbits
@ sub_809FF74 @ JP 0x0809FF74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809FF74
	.thumb_func
sub_809FF74:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809FF86
	b _080A00D4
_0809FF86:
	ldr r1, _0809FFA4 @ =0x085775CC
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _080A0088
	cmp r6, #0
	beq _0809FFA8
	cmp r6, #1
	beq _080A0010
	b _080A018C
	.align 2, 0
_0809FFA4: .4byte 0x085775CC
_0809FFA8:
	bl sub_8099FA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _080A006C
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _080A006C
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80B1474
	ldr r0, _080A0004 @ =sub_809FA24
	bl sub_80B1DD8
	bl Proc_End
	ldr r0, _080A0008 @ =sub_809FA74
	adds r1, r5, #0
	bl sub_80B1D98
	movs r0, #1
	adds r1, r5, #0
	bl sub_809F514
	ldr r0, _080A000C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FFFA
	movs r0, #0x6a
	bl m4aSongNumStart
_0809FFFA:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A018C
	.align 2, 0
_080A0004: .4byte 0x0809FA25  @ sub_809FA24
_080A0008: .4byte 0x0809FA75  @ sub_809FA74
_080A000C: .4byte 0x0202BCEC
_080A0010:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _080A006C
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80B1474
	ldr r0, _080A0060 @ =sub_809FA24
	bl sub_80B1DD8
	bl Proc_End
	ldr r0, _080A0064 @ =sub_809FAAC
	adds r1, r5, #0
	bl sub_80B1D98
	movs r0, #2
	adds r1, r5, #0
	bl sub_809F514
	ldr r0, _080A0068 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0056
	movs r0, #0x6a
	bl m4aSongNumStart
_080A0056:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _080A018C
	.align 2, 0
_080A0060: .4byte 0x0809FA25  @ sub_809FA24
_080A0064: .4byte 0x0809FAAD  @ sub_809FAAC
_080A0068: .4byte 0x0202BCEC
_080A006C:
	ldr r0, _080A0084 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A007A
	b _080A018C
_080A007A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080A018C
	.align 2, 0
_080A0084: .4byte 0x0202BCEC
_080A0088:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A00B0
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _080A00AC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A018C
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A018C
	.align 2, 0
_080A00AC: .4byte 0x0202BCEC
_080A00B0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A00F4
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _080A00D0 @ =0x08A94F48
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _080A018C
	.align 2, 0
_080A00D0: .4byte 0x08A94F48
_080A00D4:
	ldr r2, _080A00F0 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _080A00F4
	bl sub_808B2A4
	movs r0, #0
	strh r0, [r5, #0x38]
	b _080A018C
	.align 2, 0
_080A00F0: .4byte 0x085775CC
_080A00F4:
	mov r0, ip
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _080A0120
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A0112
	subs r0, #1
	b _080A011E
_080A0112:
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0120
	movs r0, #1
_080A011E:
	strb r0, [r4]
_080A0120:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0148
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A013A
	adds r0, #1
	b _080A0146
_080A013A:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0148
	movs r0, #0
_080A0146:
	strb r0, [r4]
_080A0148:
	ldrb r0, [r4]
	cmp r6, r0
	beq _080A018C
	ldr r0, _080A0194 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0160
	movs r0, #0x66
	bl m4aSongNumStart
_080A0160:
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl sub_80B1FBC
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _080A018C
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _080A0198 @ =0x08A94F48
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_080A018C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0194: .4byte 0x0202BCEC
_080A0198: .4byte 0x08A94F48

