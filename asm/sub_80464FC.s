	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8018FEC, 0x08018FEC + 1
	.set sub_8042678, 0x08042678 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_80463F4, 0x080463F4 + 1
	.set sub_80AA1AC, 0x080AA1AC + 1
	.section .text.sub_80464FC, "ax", %progbits
@ sub_80464FC @ JP 0x080464FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80464FC
	.thumb_func
sub_80464FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r0, r8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804652C
	ldr r0, _08046668 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804652C
	movs r0, #0x7c
	bl m4aSongNumStart
_0804652C:
	mov r1, r8
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _08046542
	movs r0, #0
	strh r0, [r1]
_08046542:
	mov r4, r8
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bgt _08046582
	ldr r2, _0804666C @ =0x085D378C
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl sub_8042678
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, _08046670 @ =0x0203DA20
	ldr r0, _08046674 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
_08046582:
	bl sub_8000CD8
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _08046656
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046612
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, _08046670 @ =0x0203DA20
	mov sb, r1
	mov r7, sb
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r4, r0
	bl GetUnit
	adds r5, r0, #0
	bl sub_801759C
	mov r0, sp
	adds r1, r5, #0
	bl sub_80AA1AC
	adds r0, r5, #0
	bl sub_80463F4
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	strb r0, [r5, #0xb]
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _080465F4
	adds r0, r5, #0
	bl sub_8018FEC
	ldr r2, _08046678 @ =0x0203DD8C
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r2, #0x24
	adds r1, r1, r2
	strh r0, [r1]
_080465F4:
	mov r0, sb
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08046608
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08046608:
	ldrb r1, [r6]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08046612:
	movs r4, #0
	ldr r5, _0804667C @ =0x0203DABC
_08046616:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046636
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08046636
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08046636:
	adds r4, #1
	cmp r4, #3
	ble _08046616
	mov r0, sl
	cmp r0, #0
	bne _08046656
	ldr r0, _08046674 @ =0x085D31E8
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, r8
	bl sub_8002DE4
_08046656:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046668: .4byte 0x0202BCEC
_0804666C: .4byte 0x085D378C
_08046670: .4byte 0x0203DA20
_08046674: .4byte 0x085D31E8
_08046678: .4byte 0x0203DD8C
_0804667C: .4byte 0x0203DABC

