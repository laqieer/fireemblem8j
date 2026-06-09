	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrDispUP_SetPositionSync, 0x08052854 + 1
	.set EkrGauge_Setxy323A, 0x08051F18 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_805CA64, "ax", %progbits
@ sub_805CA64 @ JP 0x0805CA64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CA64
	.thumb_func
sub_805CA64:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, _0805CAF4 @ =0x02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r4, _0805CAF8 @ =0x02000038
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805CAE2
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl BG_SetPosition
_0805CAE2:
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805CB00
	ldr r4, _0805CAFC @ =0x02000028
	ldrh r0, [r4]
	ldrh r1, [r5]
	subs r0, r0, r1
	b _0805CB08
	.align 2, 0
_0805CAF4: .4byte 0x02017760
_0805CAF8: .4byte 0x02000038
_0805CAFC: .4byte 0x02000028
_0805CB00:
	ldr r4, _0805CC14 @ =0x02000028
	ldrh r0, [r5]
	ldrh r3, [r4]
	adds r0, r0, r3
_0805CB08:
	ldr r3, _0805CC18 @ =0x0201FB0C
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r2, _0805CC1C @ =0x0200002C
	ldrh r0, [r2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	mov sb, r4
	mov sl, r2
	ldr r2, _0805CC20 @ =0x02017760
	ldrh r0, [r2]
	mov r1, sb
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	ldr r3, _0805CC18 @ =0x0201FB0C
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	mov r1, sl
	ldrh r0, [r1, #2]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r0, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_8056984
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8056984
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _0805CC04
	ldr r1, _0805CC24 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0805CC28 @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805CBC2
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0805CBC2:
	ldr r0, _0805CC18 @ =0x0201FB0C
	ldr r1, [r0]
	mov r2, sb
	ldrh r0, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov r3, sl
	movs r0, #0
	ldrsh r6, [r3, r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r1, #2
	ldrsh r4, [r3, r1]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_8056984
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8056984
	mov r2, r8
	ldr r0, [r2, #0x60]
	bl Proc_End
	mov r0, r8
	bl sub_8002DE4
_0805CC04:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CC14: .4byte 0x02000028
_0805CC18: .4byte 0x0201FB0C
_0805CC1C: .4byte 0x0200002C
_0805CC20: .4byte 0x02017760
_0805CC24: .4byte 0x0201774C
_0805CC28: .4byte 0x02000038

