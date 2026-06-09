	.syntax unified
	.set ClearIconGfx, 0x08003658 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_8092638, "ax", %progbits
@ sub_8092638 @ JP 0x08092638 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8092638
	.thumb_func
sub_8092638:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, _080926EC @ =0x0200F158
	movs r2, #0xff
	add r1, sp, #0x1c
_0809264A:
	str r2, [r1]
	subs r1, #4
	cmp r1, sp
	bge _0809264A
	cmp r0, #0
	ble _08092658
	subs r0, #1
_08092658:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge _0809269E
	ldr r1, _080926F0 @ =0x0200D6E0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
_0809266A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0809268A
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	str r0, [r7]
_0809268A:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt _0809269E
	ldr r0, _080926EC @ =0x0200F158
	ldrb r0, [r0]
	cmp r5, r0
	blt _0809266A
_0809269E:
	movs r6, #0
	ldr r7, _080926F4 @ =0x0200F15C
	mov r8, r7
_080926A4:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq _080926DC
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
_080926BC:
	ldr r0, [r2]
	cmp r0, r1
	bne _080926C4
	movs r5, #1
_080926C4:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080926BC
	cmp r5, #0
	bne _080926DC
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIconGfx
	movs r0, #0xff
	str r0, [r4]
_080926DC:
	cmp r6, #7
	ble _080926A4
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080926EC: .4byte 0x0200F158
_080926F0: .4byte 0x0200D6E0
_080926F4: .4byte 0x0200F15C

