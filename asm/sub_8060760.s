	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set Proc_End, 0x08002CBC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_8060760, "ax", %progbits
@ sub_8060760 @ JP 0x08060760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060760
	.thumb_func
sub_8060760:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08060784 @ =0x02017750
	ldr r0, [r5]
	cmp r0, #2
	bne _0806078C
	ldr r1, _08060788 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_End
	b _080607E6
	.align 2, 0
_08060784: .4byte 0x02017750
_08060788: .4byte 0x0201774C
_0806078C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble _080607A4
	strh r1, [r4, #0x2c]
_080607A4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne _080607E6
	ldr r0, [r5]
	cmp r0, #1
	bne _080607E6
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, _080607EC @ =0x080E2268
	str r0, [r4, #0x48]
	ldr r0, _080607F0 @ =0x085FFEA4
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _080607F4 @ =0x085FFDD8
	str r0, [r4, #0x54]
	ldr r0, _080607F8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080607E0
	bl EfxGetCamMovDuration
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_080607E0:
	adds r0, r4, #0
	bl sub_8002DE4
_080607E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080607EC: .4byte 0x080E2268
_080607F0: .4byte 0x085FFEA4
_080607F4: .4byte 0x085FFDD8
_080607F8: .4byte 0x0203E11C

