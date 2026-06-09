	.syntax unified
	.set CanUnitSupportNow, 0x080282A4 + 1
	.set GetUnitSupporterCount, 0x0802815C + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_802A38C, 0x0802A38C + 1
	.section .text.sub_8092E20, "ax", %progbits
@ sub_8092E20 @ JP 0x08092E20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8092E20
	.thumb_func
sub_8092E20:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08092E3E
	mov r1, r8
	adds r1, #0x3b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08092E3E:
	ldr r5, _08092F20 @ =0x0200D3E0
	ldr r4, _08092F24 @ =0x0200F158
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r7, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl sub_802A38C
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, _08092F28 @ =0x0203A4E8
	adds r0, r3, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r0, #1
	movs r2, #0xff
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #4]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #8]
	adds r0, r7, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	cmp r6, r5
	bge _08092ECA
_08092EB4:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092EC4
	adds r6, #1
_08092EC4:
	adds r4, #1
	cmp r4, r5
	blt _08092EB4
_08092ECA:
	cmp r6, #3
	ble _08092EE4
	mov r5, r8
	adds r5, #0x2e
	ldrb r4, [r5]
	subs r0, r6, #1
	movs r1, #3
	bl __divsi3
	adds r0, #6
	cmp r4, r0
	bge _08092EE4
	strb r0, [r5]
_08092EE4:
	ldr r4, _08092F20 @ =0x0200D3E0
	ldr r3, _08092F24 @ =0x0200F158
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r6, [r0, #0xa]
	ldr r0, _08092F2C @ =0x0200D6E0
	ldrb r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r0, r7, #0
	bl sub_80176AC
	bl sub_80267A0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092F20: .4byte 0x0200D3E0
_08092F24: .4byte 0x0200F158
_08092F28: .4byte 0x0203A4E8
_08092F2C: .4byte 0x0200D6E0

