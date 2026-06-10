	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set FillWarpRangeMap, 0x0801DFA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_8029590, "ax", %progbits
@ sub_8029590 @ JP 0x08029590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029590
	.thumb_func
sub_8029590:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r0, _08029630 @ =0x000007EF
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8035610
	ldr r5, _08029634 @ =0x0203A954
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8015E18
	bl sub_801D730
	ldr r0, _08029638 @ =0x03004DF0
	ldr r4, [r0]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl FillWarpRangeMap
	ldr r2, _0802963C @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0xfd
	ands r0, r1
	movs r1, #0
	mov r8, r1
	strb r0, [r2, #4]
	movs r0, #1
	bl sub_801D6FC
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xd]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl SetCursorMapPosition
	ldr r0, _08029640 @ =0x085C93C0
	movs r1, #0
	bl AP_Create
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl AP_SwitchAnimation
	str r4, [r6, #0x54]
	adds r6, #0x4a
	movs r0, #2
	strh r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029630: .4byte 0x000007EF
_08029634: .4byte 0x0203A954
_08029638: .4byte 0x03004DF0
_0802963C: .4byte 0x0202BCAC
_08029640: .4byte 0x085C93C0

