	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80ACF80, "ax", %progbits
@ sub_80ACF80 @ JP 0x080ACF80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACF80
	.thumb_func
sub_80ACF80:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080ACFF0 @ =0x0202E4D0
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r5, r0, #1
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r1, r0, #2
	movs r0, #0xa0
	subs r0, r0, r1
	asrs r4, r0, #1
	cmp r1, #0x90
	ble _080ACFC6
	adds r4, r1, #0
	subs r4, #0x90
	ldr r1, _080ACFF4 @ =0x0202BCAC
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	lsls r0, r0, #0x10
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	bl __divsi3
	muls r0, r4, r0
	cmp r0, #0
	bge _080ACFC0
	ldr r1, _080ACFF8 @ =0x0000FFFF
	adds r0, r0, r1
_080ACFC0:
	asrs r4, r0, #0x10
	movs r0, #8
	subs r4, r0, r4
_080ACFC6:
	str r5, [r6, #0x3c]
	str r4, [r6, #0x40]
	rsbs r5, r5, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl BG_SetPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ACFF0: .4byte 0x0202E4D0
_080ACFF4: .4byte 0x0202BCAC
_080ACFF8: .4byte 0x0000FFFF

