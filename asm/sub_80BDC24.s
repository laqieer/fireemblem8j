	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set InitMus, 0x0807A830 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.section .text.sub_80BDC24, "ax", %progbits
@ sub_80BDC24 @ JP 0x080BDC24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDC24
	.thumb_func
sub_80BDC24:
	push {r4, lr}
	movs r0, #0
	bl sub_8001ACC
	ldr r4, _080BDCC0 @ =0x03003020
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	ldr r0, _080BDCC4 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BDCC8 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BDCCC @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BDCD0 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #6
	bl GetSaveWriteAddr
	bl sub_804F8E0
	bl ResetText
	bl ResetFaces
	ldr r0, _080BDCD4 @ =0x08AC10E8
	bl SetupFaceGfxData
	bl ResetUnitSprites
	bl InitMus
	bl sub_80265CC
	ldr r1, _080BDCD8 @ =0x0202BCAC
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BDCC0: .4byte 0x03003020
_080BDCC4: .4byte 0x02022CA8
_080BDCC8: .4byte 0x020234A8
_080BDCCC: .4byte 0x02023CA8
_080BDCD0: .4byte 0x020244A8
_080BDCD4: .4byte 0x08AC10E8
_080BDCD8: .4byte 0x0202BCAC

