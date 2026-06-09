	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE0F0, "ax", %progbits
@ sub_80CE0F0 @ JP 0x080CE0F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE0F0
	.thumb_func
sub_80CE0F0:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xc
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE124
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE136
_080CE124:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE136:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CE184
	cmp r0, #2
	bgt _080CE14C
	cmp r0, #1
	beq _080CE152
	b _080CE1D4
_080CE14C:
	cmp r0, #3
	beq _080CE1B8
	b _080CE1D4
_080CE152:
	ldr r0, _080CE170 @ =0x08B7B01C
	ldr r1, _080CE174 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE178 @ =0x08B7BA8C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE17C @ =0x08B7B6C8
	ldr r1, _080CE180 @ =0x06010F00
	bl sub_8013008
	b _080CE1D4
	.align 2, 0
_080CE170: .4byte 0x08B7B01C
_080CE174: .4byte 0x06010000
_080CE178: .4byte 0x08B7BA8C
_080CE17C: .4byte 0x08B7B6C8
_080CE180: .4byte 0x06010F00
_080CE184:
	ldr r0, _080CE1A4 @ =0x08B7BAAC
	ldr r1, _080CE1A8 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE1AC @ =0x08B7C5BC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE1B0 @ =0x08B7C1E4
	ldr r1, _080CE1B4 @ =0x06012D00
	bl sub_8013008
	b _080CE1D4
	.align 2, 0
_080CE1A4: .4byte 0x08B7BAAC
_080CE1A8: .4byte 0x06011E00
_080CE1AC: .4byte 0x08B7C5BC
_080CE1B0: .4byte 0x08B7C1E4
_080CE1B4: .4byte 0x06012D00
_080CE1B8:
	ldr r0, _080CE1E8 @ =0x08B7C5DC
	ldr r1, _080CE1EC @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CE1F0 @ =0x08B7D0FC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE1F4 @ =0x08B7CD9C
	ldr r1, _080CE1F8 @ =0x06014B00
	bl sub_8013008
_080CE1D4:
	ldrh r0, [r4, #0x2a]
	cmp r0, #9
	bne _080CE1FC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE200
	.align 2, 0
_080CE1E8: .4byte 0x08B7C5DC
_080CE1EC: .4byte 0x06013C00
_080CE1F0: .4byte 0x08B7D0FC
_080CE1F4: .4byte 0x08B7CD9C
_080CE1F8: .4byte 0x06014B00
_080CE1FC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE200:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

