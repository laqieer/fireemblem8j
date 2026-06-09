	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE9A8, "ax", %progbits
@ sub_80CE9A8 @ JP 0x080CE9A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE9A8
	.thumb_func
sub_80CE9A8:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #3
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE9DC
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE9EE
_080CE9DC:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE9EE:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080CEA00
	cmp r0, #2
	beq _080CEA34
	b _080CEA50
_080CEA00:
	ldr r0, _080CEA20 @ =0x08B89B18
	ldr r1, _080CEA24 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CEA28 @ =0x08B8A7B0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CEA2C @ =0x08B8A3AC
	ldr r1, _080CEA30 @ =0x06010F00
	bl sub_8013008
	b _080CEA50
	.align 2, 0
_080CEA20: .4byte 0x08B89B18
_080CEA24: .4byte 0x06010000
_080CEA28: .4byte 0x08B8A7B0
_080CEA2C: .4byte 0x08B8A3AC
_080CEA30: .4byte 0x06010F00
_080CEA34:
	ldr r0, _080CEA64 @ =0x08B8A7D0
	ldr r1, _080CEA68 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CEA6C @ =0x08B8B490
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CEA70 @ =0x08B8B094
	ldr r1, _080CEA74 @ =0x06012D00
	bl sub_8013008
_080CEA50:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x12
	bne _080CEA78
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CEA7C
	.align 2, 0
_080CEA64: .4byte 0x08B8A7D0
_080CEA68: .4byte 0x06011E00
_080CEA6C: .4byte 0x08B8B490
_080CEA70: .4byte 0x08B8B094
_080CEA74: .4byte 0x06012D00
_080CEA78:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CEA7C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

