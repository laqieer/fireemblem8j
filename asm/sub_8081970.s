	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_8081970, "ax", %progbits
@ sub_8081970 @ JP 0x08081970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081970
	.thumb_func
sub_8081970:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl sub_80D637C
	adds r4, r0, #0
	subs r4, #4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl sub_80D637C
	adds r2, r0, #0
	subs r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl BG_SetPosition
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl sub_80D637C
	adds r4, r0, #0
	subs r4, #4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl sub_80D637C
	adds r2, r0, #0
	subs r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl BG_SetPosition
	adds r2, r5, #0
	adds r2, #0x64
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _080819F8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	bl sub_8002DE4
_080819F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

