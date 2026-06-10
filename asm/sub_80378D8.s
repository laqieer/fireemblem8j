	.syntax unified
	.set AddArrowTrap, 0x0802E288 + 1
	.set AddFireTile, 0x0802E24C + 1
	.set AddGasTrap, 0x0802E268 + 1
	.set AddTrap, 0x0802E1F0 + 1
	.set AddTrap8, 0x0802E2C0 + 1
	.set AddTrap9, 0x0802E2D0 + 1
	.set sub_80379C0, 0x080379C0 + 1
	.set sub_8037A9C, 0x08037A9C + 1
	.section .text.sub_80378D8, "ax", %progbits
@ sub_80378D8 @ JP 0x080378D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80378D8
	.thumb_func
sub_80378D8:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	cmp r5, #0
	beq _080379A0
	b _0803799A
_080378E4:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xb
	bhi _08037998
	lsls r0, r1, #2
	ldr r1, _080378F8 @ =_080378FC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080378F8: .4byte _080378FC
_080378FC: @ jump table
	.4byte _0803792C @ case 0
	.4byte _08037998 @ case 1
	.4byte _08037998 @ case 2
	.4byte _08037938 @ case 3
	.4byte _08037946 @ case 4
	.4byte _08037998 @ case 5
	.4byte _0803797A @ case 6
	.4byte _08037958 @ case 7
	.4byte _08037962 @ case 8
	.4byte _08037998 @ case 9
	.4byte _0803796E @ case 10
	.4byte _08037984 @ case 11
_0803792C:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl sub_8037A9C
	b _08037998
_08037938:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl AddFireTile
	b _08037998
_08037946:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGasTrap
	b _08037998
_08037958:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl AddTrap8
	b _08037998
_08037962:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddTrap9
	b _08037998
_0803796E:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl AddTrap
	b _08037998
_0803797A:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #5]
	bl AddArrowTrap
_08037984:
	movs r0, #1
	ldrsb r0, [r5, r0]
	movs r1, #2
	ldrsb r1, [r5, r1]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl sub_80379C0
_08037998:
	adds r5, #6
_0803799A:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080378E4
_080379A0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

