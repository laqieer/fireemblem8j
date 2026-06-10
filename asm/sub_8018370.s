	.syntax unified
	.set ClearBmbattleStruct0, 0x0802C27C + 1
	.section .text.sub_8018370, "ax", %progbits
@ sub_8018370 @ JP 0x08018370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018370
	.thumb_func
sub_8018370:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080183D0 @ =0x03004DF0
	str r4, [r6]
	ldr r0, _080183D4 @ =0x0202BE40
	ldrb r2, [r4, #0xb]
	strb r2, [r0]
	ldr r1, _080183D8 @ =0x0202BE44
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _080183DC @ =0x0203A954
	strb r2, [r0, #0xc]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x10]
	ldr r0, _080183E0 @ =0x0202BCAC
	adds r1, r0, #0
	adds r1, #0x3d
	strb r5, [r1]
	adds r0, #0x3f
	movs r1, #0xff
	strb r1, [r0]
	bl ClearBmbattleStruct0
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _080183E4 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080183D0: .4byte 0x03004DF0
_080183D4: .4byte 0x0202BE40
_080183D8: .4byte 0x0202BE44
_080183DC: .4byte 0x0203A954
_080183E0: .4byte 0x0202BCAC
_080183E4: .4byte 0x0202E4D4

