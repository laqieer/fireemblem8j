	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrDispUP_SetPositionSync, 0x08052854 + 1
	.set EkrGauge_Setxy323A, 0x08051F18 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_8077D0C, "ax", %progbits
@ EfxTriangleQUAKEMain @ JP 0x08077D0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxTriangleQUAKEMain
	.thumb_func
EfxTriangleQUAKEMain:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r4, _08077E6C @ =0x02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08077E70 @ =0x02000038
	ldrh r1, [r6]
	ldrh r0, [r4]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r3, [r4, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	ldrh r1, [r4]
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	ldrh r3, [r4]
	adds r0, r0, r3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldr r3, _08077E74 @ =0x02000028
	mov sb, r3
	ldrh r5, [r4]
	ldrh r0, [r3]
	adds r1, r5, r0
	ldr r2, _08077E78 @ =0x0201FB0C
	mov sl, r2
	ldr r3, [r2]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08077E7C @ =0x0200002C
	mov r8, r0
	ldrh r2, [r0]
	ldrh r0, [r4, #2]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	mov r2, sb
	ldrh r2, [r2, #2]
	adds r5, r5, r2
	subs r5, r5, r3
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r3, r8
	ldrh r4, [r3, #2]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0
	mov r2, ip
	bl sub_8056984
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8056984
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x2e
	ldrsh r1, [r7, r4]
	cmp r0, r1
	ble _08077E5C
	ldr r1, _08077E80 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	mov r1, sl
	ldr r0, [r1]
	mov r2, sb
	ldrh r1, [r2]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	mov r3, sb
	ldrh r4, [r3, #2]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	movs r3, #2
	ldrsh r5, [r0, r3]
	movs r0, #0
	bl sub_8056984
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8056984
	ldr r0, [r7, #0x60]
	bl Proc_End
	adds r0, r7, #0
	bl sub_8002DE4
_08077E5C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077E6C: .4byte 0x02017760
_08077E70: .4byte 0x02000038
_08077E74: .4byte 0x02000028
_08077E78: .4byte 0x0201FB0C
_08077E7C: .4byte 0x0200002C
_08077E80: .4byte 0x0201774C

