	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set NextRN_N, 0x08000C58 + 1
	.set sub_803BD70, 0x0803BD70 + 1
	.section .text.sub_807C8DC, "ax", %progbits
@ sub_807C8DC @ JP 0x0807C8DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C8DC
	.thumb_func
sub_807C8DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	adds r3, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0807C9D0
	movs r7, #0
	movs r0, #0
	ldrsh r4, [r6, r0]
	movs r1, #2
	ldrsh r5, [r6, r1]
	adds r0, r3, #0
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	movs r2, #1
	rsbs r2, r2, #0
	ldrb r0, [r6]
	mov r8, r0
	ldrb r1, [r6, #2]
	mov sb, r1
_0807C91C:
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r2, #1
	mov ip, r0
	mov r1, sb
	adds r0, r2, r1
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
_0807C92C:
	mov r1, r8
	adds r0, r4, r1
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r4, #0
	bne _0807C93C
	cmp r2, #0
	beq _0807C990
_0807C93C:
	ldr r0, _0807C9C0 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r3, r5, #2
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807C990
	ldr r0, _0807C9C4 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807C990
	ldr r0, _0807C9C8 @ =0x0202E4E8
	ldr r0, [r0]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807C990
	ldr r0, _0807C9CC @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0807C990
	lsls r0, r7, #2
	add r0, sp
	strh r1, [r0]
	strh r5, [r0, #2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0807C990:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	ble _0807C92C
	mov r2, ip
	lsls r0, r2, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	ble _0807C91C
	cmp r7, #0
	beq _0807C9FC
	adds r0, r7, #0
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	strh r0, [r6]
	ldrh r0, [r1, #2]
	strh r0, [r6, #2]
	b _0807C9FC
	.align 2, 0
_0807C9C0: .4byte 0x0202E4D4
_0807C9C4: .4byte 0x0202E4EC
_0807C9C8: .4byte 0x0202E4E8
_0807C9CC: .4byte 0x0202E4E0
_0807C9D0:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0807C9FC
	movs r4, #0
	ldrsb r4, [r6, r4]
	movs r2, #2
	ldrsb r2, [r6, r2]
	ldr r0, _0807CA0C @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807C9FC
	adds r0, r3, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl sub_803BD70
_0807C9FC:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA0C: .4byte 0x0202E4D8

