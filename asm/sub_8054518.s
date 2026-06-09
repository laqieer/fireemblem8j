	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set Proc_End, 0x08002CBC + 1
	.set SetEkrBg2QuakeVec, 0x08052F0C + 1
	.set sub_8056984, 0x08056984 + 1
	.section .text.sub_8054518, "ax", %progbits
@ sub_8054518 @ JP 0x08054518 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8054518
	.thumb_func
sub_8054518:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, [r7, #0x44]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, _08054598 @ =0x00007FFF
	cmp r1, r0
	bne _080545AC
	ldr r3, _0805459C @ =0x02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _080545A0 @ =0x0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _080545A4 @ =0x0200002C
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl sub_8056984
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl sub_8056984
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805458A
	ldrh r1, [r7, #0x34]
	ldrh r2, [r7, #0x3c]
	movs r0, #3
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl SetEkrBg2QuakeVec
_0805458A:
	ldr r1, _080545A8 @ =0x0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _080546BE
	.align 2, 0
_08054598: .4byte 0x00007FFF
_0805459C: .4byte 0x02000028
_080545A0: .4byte 0x0201FB0C
_080545A4: .4byte 0x0200002C
_080545A8: .4byte 0x0201773C
_080545AC:
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl SetEkrBg2QuakeVec
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r5, _08054604 @ =0x02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _080545EC
	ldrh r1, [r5]
	ldrh r4, [r7, #0x34]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r5, #2]
	ldrh r0, [r7, #0x3c]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
_080545EC:
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805460C
	ldr r4, _08054608 @ =0x02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b _08054618
	.align 2, 0
_08054604: .4byte 0x02017760
_08054608: .4byte 0x02000028
_0805460C:
	ldr r4, _08054678 @ =0x02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
_08054618:
	ldr r3, _0805467C @ =0x0201FB0C
	ldr r0, [r3]
	subs r6, r1, r0
	ldr r2, _08054680 @ =0x0200002C
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _08054684 @ =0x02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _08054688 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805468C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_8056984
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_8056984
	b _080546BE
	.align 2, 0
_08054678: .4byte 0x02000028
_0805467C: .4byte 0x0201FB0C
_08054680: .4byte 0x0200002C
_08054684: .4byte 0x02017760
_08054688: .4byte 0x0203E11C
_0805468C:
	cmp r0, #0
	blt _080546BE
	cmp r0, #2
	bgt _080546BE
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080546B0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_8056984
	b _080546BE
_080546B0:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_8056984
_080546BE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

