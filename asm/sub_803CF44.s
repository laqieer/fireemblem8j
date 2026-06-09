	.syntax unified
	.set AiGetAttackPositionScore, 0x0803CEF0 + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMight, 0x08017384 + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_801B674, 0x0801B674 + 1
	.section .text.sub_803CF44, "ax", %progbits
@ sub_803CF44 @ JP 0x0803CF44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CF44
	.thumb_func
sub_803CF44:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, _0803D088 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_801A05C
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq _0803D06E
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
_0803CF82:
	ldr r0, _0803D088 @ =0x03004DF0
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov sb, r1
	cmp r0, #0
	beq _0803D054
	ldr r0, _0803D08C @ =0x0202E4E0
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
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl sub_801B674
	ldr r0, _0803D090 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803D054
_0803CFD4:
	ldr r0, _0803D090 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _0803D04E
	lsls r7, r6, #2
_0803CFE6:
	ldr r0, _0803D094 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D048
	ldr r0, _0803D08C @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803D048
	ldr r0, _0803D098 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803D022
	ldr r0, _0803D09C @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803D048
_0803D022:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl AiGetAttackPositionScore
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls _0803D048
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_0803D048:
	subs r5, #1
	cmp r5, #0
	bge _0803CFE6
_0803D04E:
	mov r6, sl
	cmp r6, #0
	bge _0803CFD4
_0803D054:
	mov r1, sb
	str r1, [sp, #8]
	cmp r1, #4
	bgt _0803D06E
	ldr r0, _0803D088 @ =0x03004DF0
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _0803CF82
_0803D06E:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _0803D0A0
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b _0803D0A2
	.align 2, 0
_0803D088: .4byte 0x03004DF0
_0803D08C: .4byte 0x0202E4E0
_0803D090: .4byte 0x0202E4D0
_0803D094: .4byte 0x0202E4DC
_0803D098: .4byte 0x0202E4D4
_0803D09C: .4byte 0x0202BE40
_0803D0A0:
	movs r0, #0
_0803D0A2:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

