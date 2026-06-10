	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_8033B20, "ax", %progbits
@ sub_8033B20 @ JP 0x08033B20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033B20
	.thumb_func
sub_8033B20:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08033B8C @ =0x085C93C0
	movs r1, #0
	bl AP_Create
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl AP_SwitchAnimation
	str r4, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08033B90 @ =0x0202BCAC
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x3c]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x40]
	movs r0, #0xfe
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8035610
	ldr r0, _08033B94 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_8015E18
	ldr r0, _08033B98 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033B86
	movs r0, #0x69
	bl m4aSongNumStart
_08033B86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033B8C: .4byte 0x085C93C0
_08033B90: .4byte 0x0202BCAC
_08033B94: .4byte 0x03004DF0
_08033B98: .4byte 0x0202BCEC

