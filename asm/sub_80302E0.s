	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set AllocWeatherParticles, 0x08030144 + 1
	.section .text.sub_80302E0, "ax", %progbits
@ sub_80302E0 @ JP 0x080302E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80302E0
	.thumb_func
sub_80302E0:
	push {r4, r5, r6, r7, lr}
	ldr r0, _08030338 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r6, #0
	ldr r7, _0803033C @ =0x080DCC20
	ldr r5, _08030340 @ =0x020027DC
_080302F0:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl AdvanceGetLCGRNValue
	strh r0, [r5]
	bl AdvanceGetLCGRNValue
	strh r0, [r5, #2]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _080302F0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030338: .4byte 0x0202BCEC
_0803033C: .4byte 0x080DCC20
_08030340: .4byte 0x020027DC

