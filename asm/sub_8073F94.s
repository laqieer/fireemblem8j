	.syntax unified
	.set m4aMPlayImmInit, 0x080D50E4 + 1
	.set m4aMPlayPanpotControl, 0x080D5F78 + 1
	.set sub_8014B28, 0x08014B28 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8073F94, "ax", %progbits
@ sub_8073F94 @ JP 0x08073F94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073F94
	.thumb_func
sub_8073F94:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08073FC0 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0807403C
	cmp r2, #0
	beq _0807400C
	cmp r6, #0x77
	bgt _08073FC4
	adds r0, r6, #0
	muls r0, r6, r0
	movs r1, #0x78
	bl sub_80D6374
	adds r5, r0, #0
	subs r5, #0x78
	b _08073FD8
	.align 2, 0
_08073FC0: .4byte 0x0202BCAC
_08073FC4:
	movs r0, #0xf0
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x78
	bl sub_80D6374
	movs r1, #0x78
	subs r5, r1, r0
_08073FD8:
	ldr r2, _08074000 @ =0x082140B4
	ldr r1, _08074004 @ =0x08214120
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _08074008 @ =0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl m4aMPlayPanpotControl
	b _0807403C
	.align 2, 0
_08074000: .4byte 0x082140B4
_08074004: .4byte 0x08214120
_08074008: .4byte 0x0000FFFF
_0807400C:
	ldr r2, _08074044 @ =0x082140B4
	ldr r1, _08074048 @ =0x08214120
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0807404C @ =0x0000FFFF
	adds r0, r6, #0
	bl sub_8014B28
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
_0807403C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074044: .4byte 0x082140B4
_08074048: .4byte 0x08214120
_0807404C: .4byte 0x0000FFFF

