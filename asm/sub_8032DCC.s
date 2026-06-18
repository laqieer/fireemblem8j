	.syntax unified
	.set GenerateMovementMapForActiveUnit, 0x08032C4C + 1
	.set ResetPathArrow, 0x08032C90 + 1
	.set SetLastCoords, 0x08032924 + 1
	.set sub_801A304, 0x0801A304 + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_801B6B0, 0x0801B6B0 + 1
	.set sub_8032938, 0x08032938 + 1
	.set sub_80329D8, 0x080329D8 + 1
	.set sub_8032A54, 0x08032A54 + 1
	.set sub_8032AB8, 0x08032AB8 + 1
	.set sub_8032CBC, 0x08032CBC + 1
	.section .text.sub_8032DCC, "ax", %progbits
@ UpdatePathArrowWithCursor @ JP 0x08032DCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UpdatePathArrowWithCursor
	.thumb_func
UpdatePathArrowWithCursor:
	push {r4, r5, r6, r7, lr}
	ldr r7, _08032E4C @ =0x085C6080
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x29
	ldr r5, _08032E50 @ =0x0202BCAC
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08032DF6
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08032DF6
	b _08032F74
_08032DF6:
	ldrh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	bl SetLastCoords
	ldr r0, _08032E54 @ =0x0202E4DC
	ldr r0, [r0]
	bl sub_801B668
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _08032E58 @ =0x03004940
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08032E2A
	b _08032F74
_08032E2A:
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	bl sub_8032A54
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08032E5C
	adds r0, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_8032938
	b _08032F74
	.align 2, 0
_08032E4C: .4byte 0x085C6080
_08032E50: .4byte 0x0202BCAC
_08032E54: .4byte 0x0202E4DC
_08032E58: .4byte 0x03004940
_08032E5C:
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, #0x55
	adds r4, r4, r0
	bl sub_801B6B0
	movs r3, #0x16
	ldrsh r6, [r5, r3]
	ldr r1, _08032ECC @ =0x0202E4D8
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r3, [r5, r2]
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _08032EF0
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r3
	cmp r2, #0
	bge _08032EB2
	subs r2, r3, r0
_08032EB2:
	adds r0, r4, #0
	adds r0, #0x41
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, r6
	cmp r0, #0
	blt _08032ED0
	adds r0, r2, r0
	cmp r0, #1
	beq _08032ED8
	b _08032EF0
	.align 2, 0
_08032ECC: .4byte 0x0202E4D8
_08032ED0:
	subs r0, r6, r1
	adds r0, r2, r0
	cmp r0, #1
	bne _08032EF0
_08032ED8:
	ldr r1, _08032EEC @ =0x0202BCAC
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80329D8
	b _08032F74
	.align 2, 0
_08032EEC: .4byte 0x0202BCAC
_08032EF0:
	ldr r0, _08032F48 @ =0x085C6080
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x55
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08032F12
	movs r0, #1
	bl sub_8032938
_08032F12:
	ldr r0, _08032F4C @ =0x0202E4EC
	ldr r0, [r0]
	bl sub_801B668
	bl GenerateMovementMapForActiveUnit
	ldr r2, _08032F50 @ =0x0202BCAC
	movs r3, #0x16
	ldrsh r4, [r2, r3]
	ldr r0, _08032F54 @ =0x03004940
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08032F58
	bl ResetPathArrow
	b _08032F74
	.align 2, 0
_08032F48: .4byte 0x085C6080
_08032F4C: .4byte 0x0202E4EC
_08032F50: .4byte 0x0202BCAC
_08032F54: .4byte 0x03004940
_08032F58:
	ldr r2, _08032F7C @ =0x02033EF8
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_801A304
	bl sub_8032AB8
	bl sub_8032CBC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08032F74
	bl ResetPathArrow
_08032F74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032F7C: .4byte 0x02033EF8

