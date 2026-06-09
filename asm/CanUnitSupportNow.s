	.syntax unified
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.set GetUnitTotalSupportLevel, 0x080281F8 + 1
	.set HasUnitGainedSupportLevel, 0x08028720 + 1
	.set sub_8028188, 0x08028188 + 1
	.section .text.CanUnitSupportNow, "ax", %progbits
@ CanUnitSupportNow @ JP 0x080282A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitSupportNow
	.thumb_func
CanUnitSupportNow:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08028308 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08028302
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08028302
	adds r0, r5, #0
	adds r1, r6, #0
	bl HasUnitGainedSupportLevel
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028302
	adds r0, r5, #0
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _08028302
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8028188
	bl GetUnitTotalSupportLevel
	cmp r0, #4
	bgt _08028302
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	ldrb r7, [r0]
	ldr r4, _0802830C @ =0x085C3E88
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r7, #0xf1
	bne _08028310
_08028302:
	movs r0, #0
	b _0802831A
	.align 2, 0
_08028308: .4byte 0x0202BCEC
_0802830C: .4byte 0x085C3E88
_08028310:
	movs r1, #0
	cmp r7, r0
	bne _08028318
	movs r1, #1
_08028318:
	adds r0, r1, #0
_0802831A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

