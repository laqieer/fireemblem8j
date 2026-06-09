	.syntax unified
	.set GetGmPathLength, 0x080C20A8 + 1
	.set GetGmPathNode, 0x080C2098 + 1
	.set GetGmSkirmishUnitAtNode, 0x080C185C + 1
	.set GmMu_IsMoving, 0x080C2F14 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set WorldMap_IsMonsterAtUnclearedNode, 0x080BDA28 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C2C9C, 0x080C2C9C + 1
	.set sub_80C2EF0, 0x080C2EF0 + 1
	.section .text.sub_80BDA6C, "ax", %progbits
@ sub_80BDA6C @ JP 0x080BDA6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDA6C
	.thumb_func
sub_80BDA6C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [r6, #0x54]
	movs r1, #0
	bl GmMu_IsMoving
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BDA86
	b _080BDC18
_080BDA86:
	adds r5, r6, #0
	adds r5, #0x40
	movs r4, #0
	ldrsb r4, [r5, r4]
	bl GetGmPathLength
	subs r0, #1
	mov r8, r5
	cmp r4, r0
	blt _080BDA9C
	b _080BDBB4
_080BDA9C:
	bl GetGmPathLength
	movs r1, #0
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	cmp r0, #2
	beq _080BDAC2
	adds r0, r1, #1
	bl GetGmPathNode
	bl GetGmSkirmishUnitAtNode
	cmp r0, #0
	blt _080BDB08
	adds r0, r6, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080BDC18
_080BDAC2:
	adds r0, r1, #1
	bl GetGmPathNode
	ldr r1, _080BDB80 @ =0x03005270
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BDB08
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, #1
	bl GetGmPathNode
	lsls r0, r0, #5
	ldr r1, _080BDB84 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080BDB08
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, #1
	bl GetGmPathNode
	adds r1, r6, #0
	adds r1, #0x3e
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl Proc_Goto
_080BDB08:
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r2, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #0
	bgt _080BDB88
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl GetGmPathNode
	adds r5, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r0, #1
	bl GetGmPathNode
	adds r4, r0, #0
	ldr r0, [r6, #0x54]
	movs r1, #0
	movs r2, #1
	bl sub_80C2EF0
	mov r0, sp
	movs r2, #0
	strb r2, [r0]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	mov r1, sp
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	strb r0, [r1, #1]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r0, #1
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	movs r0, #4
	strb r0, [r1, #4]
	ldr r0, [r6, #0x54]
	bl sub_80C2C9C
	movs r0, #8
	strb r0, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080BDC18
	.align 2, 0
_080BDB80: .4byte 0x03005270
_080BDB84: .4byte 0x081F5D7C
_080BDB88:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BDBA8
	ldr r0, _080BDBB0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BDBA8
	subs r0, r2, #2
	strb r0, [r7]
_080BDBA8:
	ldrb r0, [r7]
	subs r0, #1
	strb r0, [r7]
	b _080BDC18
	.align 2, 0
_080BDBB0: .4byte 0x085775CC
_080BDBB4:
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetGmPathNode
	ldr r4, _080BDBF0 @ =0x03005270
	strb r0, [r4, #0x11]
	ldr r0, [r6, #0x54]
	movs r1, #0
	movs r2, #0
	bl sub_80C2EF0
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #5
	ldr r1, _080BDBF4 @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080BDBF8
	adds r0, r6, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080BDC18
	.align 2, 0
_080BDBF0: .4byte 0x03005270
_080BDBF4: .4byte 0x081F5D7C
_080BDBF8:
	adds r0, r2, #0
	bl WorldMap_IsMonsterAtUnclearedNode
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BDC0E
	adds r0, r6, #0
	movs r1, #0x10
	bl Proc_Goto
	b _080BDC18
_080BDC0E:
	movs r0, #1
	strb r0, [r4, #1]
	adds r0, r6, #0
	bl sub_8002DE4
_080BDC18:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

