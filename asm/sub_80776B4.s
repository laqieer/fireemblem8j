	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80776B4, "ax", %progbits
@ NewEkrTriPegasusKnightBG @ JP 0x080776B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEkrTriPegasusKnightBG
	.thumb_func
NewEkrTriPegasusKnightBG:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080776DC @ =0x087A9B08
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _080776E8
	ldr r0, _080776E0 @ =0x0203E198
	ldr r2, [r0]
	ldr r0, _080776E4 @ =0x080E6B12
	b _080776EE
	.align 2, 0
_080776DC: .4byte 0x087A9B08
_080776E0: .4byte 0x0203E198
_080776E4: .4byte 0x080E6B12
_080776E8:
	ldr r0, _08077724 @ =0x0203E198
	ldr r2, [r0, #4]
	ldr r0, _08077728 @ =0x080E6B20
_080776EE:
	str r0, [r1, #0x48]
	ldr r0, _0807772C @ =0x087A9B20
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r4, _08077730 @ =0x02017790
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08077734 @ =0x080E6BA0
	cmp r6, #0
	beq _08077716
	ldr r0, _08077738 @ =0x080E7F34
	cmp r7, #0
	bne _08077716
	ldr r0, _0807773C @ =0x080E7544
_08077716:
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077724: .4byte 0x0203E198
_08077728: .4byte 0x080E6B20
_0807772C: .4byte 0x087A9B20
_08077730: .4byte 0x02017790
_08077734: .4byte 0x080E6BA0
_08077738: .4byte 0x080E7F34
_0807773C: .4byte 0x080E7544

