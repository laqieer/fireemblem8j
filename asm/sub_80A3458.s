	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.section .text.sub_80A3458, "ax", %progbits
@ sub_80A3458 @ JP 0x080A3458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3458
	.thumb_func
sub_80A3458:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x14
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	movs r2, #0
	ldr r6, _080A34DC @ =0x08A9A39C
	adds r3, r4, #0
	adds r3, #0x34
	movs r5, #0xff
_080A3484:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r2, #1
	cmp r2, #4
	ble _080A3484
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r1, _080A34E0 @ =0x06017000
	adds r0, r6, #0
	bl sub_8013008
	ldr r0, _080A34E4 @ =0x08A9A4E4
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r2, _080A34E8 @ =0x0202BCEC
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080A34EC @ =sub_80A3300
	adds r1, r4, #0
	bl sub_80B1D98
	adds r0, r4, #0
	bl sub_80048B4
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A34DC: .4byte 0x08A9A39C
_080A34E0: .4byte 0x06017000
_080A34E4: .4byte 0x08A9A4E4
_080A34E8: .4byte 0x0202BCEC
_080A34EC: .4byte 0x080A3301  @ sub_80A3300

