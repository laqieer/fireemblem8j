	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.TornOutUnitSprite, "ax", %progbits
@ TornOutUnitSprite @ JP 0x08026BC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TornOutUnitSprite
	.thumb_func
TornOutUnitSprite:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	bl sub_80176AC
	str r0, [sp, #4]
	bl sub_80267A0
	lsls r7, r0, #5
	ldr r1, _08026C28 @ =0x085C3C1C
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r4, #0
	bl sub_8000CD8
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x43
	ble _08026BF8
	movs r4, #1
_08026BF8:
	cmp r1, #0x23
	ble _08026BFE
	movs r4, #2
_08026BFE:
	cmp r1, #0x1f
	ble _08026C04
	movs r4, #1
_08026C04:
	cmp r1, #0
	blt _08026C0A
	movs r4, #0
_08026C0A:
	ldr r1, _08026C2C @ =0x08903E0C
	movs r0, #0x7f
	ldr r2, [sp, #4]
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026CBC
	cmp r0, #1
	bgt _08026C30
	cmp r0, #0
	beq _08026C38
	b _08026E96
	.align 2, 0
_08026C28: .4byte 0x085C3C1C
_08026C2C: .4byte 0x08903E0C
_08026C30:
	cmp r0, #2
	bne _08026C36
	b _08026DB4
_08026C36:
	b _08026E96
_08026C38:
	movs r1, #0
	lsls r4, r4, #0xd
	str r4, [sp, #8]
	ldr r0, _08026CB0 @ =0x0203400C
	mov r8, r0
	lsrs r5, r6, #1
	movs r0, #1
	bics r0, r6
	lsls r0, r0, #2
	movs r4, #0xf
	lsls r4, r0
_08026C4E:
	movs r6, #0
	lsls r2, r1, #0xd
	adds r1, #1
	mov sb, r1
	adds r0, r7, r5
	adds r0, r0, r2
	mov r1, r8
	adds r3, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r5, r1
	adds r0, r7, r0
	adds r0, r0, r2
	mov r1, r8
	adds r2, r0, r1
_08026C6C:
	ldrb r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	adds r3, #0x20
	adds r2, #0x20
	adds r6, #1
	cmp r6, #1
	ble _08026C6C
	mov r1, sb
	cmp r1, #2
	ble _08026C4E
	ldr r2, _08026CB0 @ =0x0203400C
	adds r0, r7, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldr r2, _08026CB4 @ =0x06011000
	adds r1, r7, r2
	movs r2, #0x10
	bl sub_80D636C
	ldr r1, _08026CB0 @ =0x0203400C
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026CB8 @ =0x06011400
	b _08026D96
	.align 2, 0
_08026CB0: .4byte 0x0203400C
_08026CB4: .4byte 0x06011000
_08026CB8: .4byte 0x06011400
_08026CBC:
	movs r1, #0
	lsls r4, r4, #0xd
	str r4, [sp, #8]
	ldr r2, _08026DA0 @ =0x0203400C
	mov sl, r2
	lsrs r2, r6, #1
	mov ip, r2
	bics r0, r6
	lsls r0, r0, #2
	movs r2, #0xf
	mov r8, r2
	lsls r2, r0
	mov r8, r2
_08026CD6:
	movs r6, #0
	lsls r2, r1, #0xd
	adds r1, #1
	mov sb, r1
	adds r5, r2, #0
	mov r1, ip
	adds r0, r7, r1
	adds r0, r0, r5
	mov r2, sl
	adds r4, r0, r2
_08026CEA:
	lsls r2, r6, #5
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	strb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r7, r2
	add r2, ip
	adds r2, r2, r5
	add r2, sl
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r4, #0x20
	adds r6, #1
	cmp r6, #1
	ble _08026CEA
	mov r1, sb
	cmp r1, #2
	ble _08026CD6
	ldr r1, _08026DA0 @ =0x0203400C
	adds r0, r7, r1
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldr r2, _08026DA4 @ =0x06011000
	adds r1, r7, r2
	movs r2, #0x10
	bl sub_80D636C
	ldr r1, _08026DA0 @ =0x0203400C
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026DA8 @ =0x06011400
	adds r1, r7, r2
	movs r2, #0x10
	bl sub_80D636C
	ldr r1, _08026DA0 @ =0x0203400C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026DAC @ =0x06011800
	adds r1, r7, r2
	movs r2, #0x10
	bl sub_80D636C
	ldr r1, _08026DA0 @ =0x0203400C
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026DB0 @ =0x06011C00
_08026D96:
	adds r1, r7, r2
	movs r2, #0x10
	bl sub_80D636C
	b _08026E96
	.align 2, 0
_08026DA0: .4byte 0x0203400C
_08026DA4: .4byte 0x06011000
_08026DA8: .4byte 0x06011400
_08026DAC: .4byte 0x06011800
_08026DB0: .4byte 0x06011C00
_08026DB4:
	movs r1, #0
	lsls r4, r4, #0xd
	str r4, [sp, #8]
	ldr r0, _08026EB8 @ =0x0203400C
	mov sl, r0
	lsrs r2, r6, #1
	mov ip, r2
	movs r0, #1
	bics r0, r6
	lsls r0, r0, #2
	movs r2, #0xf
	mov r8, r2
	lsls r2, r0
	mov r8, r2
_08026DD0:
	movs r6, #0
	adds r0, r1, #1
	mov sb, r0
	lsls r5, r1, #0xd
	mov r1, ip
	adds r0, r7, r1
	adds r0, r0, r5
	mov r2, sl
	adds r4, r0, r2
_08026DE2:
	lsls r2, r6, #5
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	strb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r7, r2
	add r2, ip
	adds r2, r2, r5
	add r2, sl
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r4, #0x20
	adds r6, #1
	cmp r6, #3
	ble _08026DE2
	mov r1, sb
	cmp r1, #2
	ble _08026DD0
	ldr r1, _08026EB8 @ =0x0203400C
	adds r0, r7, r1
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldr r2, _08026EBC @ =0x06011000
	adds r1, r7, r2
	movs r2, #0x20
	bl sub_80D636C
	ldr r1, _08026EB8 @ =0x0203400C
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026EC0 @ =0x06011400
	adds r1, r7, r2
	movs r2, #0x20
	bl sub_80D636C
	ldr r1, _08026EB8 @ =0x0203400C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026EC4 @ =0x06011800
	adds r1, r7, r2
	movs r2, #0x20
	bl sub_80D636C
	ldr r1, _08026EB8 @ =0x0203400C
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026EC8 @ =0x06011C00
	adds r1, r7, r2
	movs r2, #0x20
	bl sub_80D636C
_08026E96:
	ldr r0, [sp]
	cmp r0, #0x3f
	bne _08026EA6
	ldr r0, _08026ECC @ =0x02033F3C
	ldr r1, [sp, #4]
	adds r0, r1, r0
	movs r1, #0xff
	strb r1, [r0]
_08026EA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026EB8: .4byte 0x0203400C
_08026EBC: .4byte 0x06011000
_08026EC0: .4byte 0x06011400
_08026EC4: .4byte 0x06011800
_08026EC8: .4byte 0x06011C00
_08026ECC: .4byte 0x02033F3C

