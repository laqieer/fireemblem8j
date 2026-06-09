	.syntax unified
	.set EfxCheckRetaliation, 0x08074A24 + 1
	.set EkrCheckAttackRound, 0x08059954 + 1
	.set GetBanimBossBGM, 0x08074DAC + 1
	.set GetSelectTargetCount, 0x08050AC8 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set Sound_SetDefaultMaxNumChannels, 0x08002820 + 1
	.set sub_8059938, 0x08059938 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_8073F38, 0x08073F38 + 1
	.set sub_8074A4C, 0x08074A4C + 1
	.set sub_80868F4, 0x080868F4 + 1
	.set sub_8086900, 0x08086900 + 1
	.section .text.sub_8074B88, "ax", %progbits
@ sub_8074B88 @ JP 0x08074B88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074B88
	.thumb_func
sub_8074B88:
	push {r4, r5, r6, r7, lr}
	ldr r0, _08074BCC @ =0x0203E184
	ldr r1, _08074BD0 @ =0x0203E188
	ldr r5, [r0]
	ldr r7, [r1]
	ldr r0, _08074BD4 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08074BA0
	b _08074D68
_08074BA0:
	ldr r1, _08074BD8 @ =0x020200A8
	movs r0, #1
	str r0, [r1]
	ldr r1, _08074BDC @ =0x0203E110
	ldr r0, _08074BE0 @ =0x0203E0FC
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r6, #0x1a
	cmp r0, #1
	beq _08074BBE
	movs r6, #0x19
_08074BBE:
	bl sub_805BDCC
	cmp r0, #1
	bne _08074BE4
	bl Sound_SetDefaultMaxNumChannels
	b _08074BEC
	.align 2, 0
_08074BCC: .4byte 0x0203E184
_08074BD0: .4byte 0x0203E188
_08074BD4: .4byte 0x0202BCAC
_08074BD8: .4byte 0x020200A8
_08074BDC: .4byte 0x0203E110
_08074BE0: .4byte 0x0203E0FC
_08074BE4:
	bl GetSelectTargetCount
	cmp r0, #1
	bne _08074BF8
_08074BEC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x39
	bl sub_8073F38
	b _08074D6E
_08074BF8:
	ldr r0, _08074C10 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bne _08074C14
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x23
	bl sub_8073F38
	b _08074D6E
	.align 2, 0
_08074C10: .4byte 0x0203E11C
_08074C14:
	movs r4, #0
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8059938
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08074C2A
	movs r4, #1
_08074C2A:
	movs r0, #1
	bl EkrCheckAttackRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08074C38
	movs r4, #0
_08074C38:
	ldr r0, _08074C6C @ =0x0203E100
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08074C44
	movs r4, #0
_08074C44:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _08074C4E
	movs r4, #0
_08074C4E:
	cmp r0, #0x6c
	bne _08074C54
	movs r4, #0
_08074C54:
	cmp r0, #0xbe
	bne _08074C5A
	movs r4, #0
_08074C5A:
	cmp r4, #1
	bne _08074C70
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1f
	bl sub_8073F38
	b _08074D6E
	.align 2, 0
_08074C6C: .4byte 0x0203E100
_08074C70:
	cmp r0, #0xbe
	bne _08074C90
	bl sub_8086900
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08074C8C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x55
	bl sub_8073F38
	b _08074D6E
_08074C8C:
	bl sub_80868F4
_08074C90:
	adds r0, r5, #0
	bl GetBanimBossBGM
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08074CB2
	movs r4, #1
	rsbs r4, r4, #0
_08074CB2:
	ldr r0, _08074CD4 @ =0x0203E100
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08074CC0
	movs r4, #1
	rsbs r4, r4, #0
_08074CC0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08074CD8
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8073F38
	b _08074D6E
	.align 2, 0
_08074CD4: .4byte 0x0203E100
_08074CD8:
	movs r4, #0
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _08074CFE
	ldr r0, _08074D10 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08074CFE
	movs r4, #1
_08074CFE:
	cmp r4, #1
	bne _08074D14
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x20
	bl sub_8073F38
	b _08074D6E
	.align 2, 0
_08074D10: .4byte 0x0203A4D0
_08074D14:
	movs r0, #0
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _08074D28
	ldr r0, _08074D24 @ =0x0203A4E8
	b _08074D34
	.align 2, 0
_08074D24: .4byte 0x0203A4E8
_08074D28:
	movs r0, #1
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _08074D44
	ldr r0, _08074D40 @ =0x0203A568
_08074D34:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8074A4C
	b _08074D46
	.align 2, 0
_08074D40: .4byte 0x0203A568
_08074D44:
	movs r0, #0
_08074D46:
	cmp r0, #1
	beq _08074D52
	cmp r0, #2
	bne _08074D54
	movs r6, #0x22
	b _08074D54
_08074D52:
	movs r6, #0x21
_08074D54:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	beq _08074D68
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, #0
	bl sub_8073F38
	b _08074D6E
_08074D68:
	ldr r1, _08074D74 @ =0x020200A8
	movs r0, #0
	str r0, [r1]
_08074D6E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D74: .4byte 0x020200A8

