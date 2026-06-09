	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE208, "ax", %progbits
@ sub_80CE208 @ JP 0x080CE208 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE208
	.thumb_func
sub_80CE208:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xa
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE23C
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE24E
_080CE23C:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE24E:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CE29C
	cmp r0, #2
	bgt _080CE264
	cmp r0, #1
	beq _080CE26A
	b _080CE2EC
_080CE264:
	cmp r0, #3
	beq _080CE2D0
	b _080CE2EC
_080CE26A:
	ldr r0, _080CE288 @ =0x08B7D11C
	ldr r1, _080CE28C @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE290 @ =0x08B7DBAC
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE294 @ =0x08B7D81C
	ldr r1, _080CE298 @ =0x06010F00
	bl sub_8013008
	b _080CE2EC
	.align 2, 0
_080CE288: .4byte 0x08B7D11C
_080CE28C: .4byte 0x06010000
_080CE290: .4byte 0x08B7DBAC
_080CE294: .4byte 0x08B7D81C
_080CE298: .4byte 0x06010F00
_080CE29C:
	ldr r0, _080CE2BC @ =0x08B7DBCC
	ldr r1, _080CE2C0 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE2C4 @ =0x08B7E6B0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE2C8 @ =0x08B7E308
	ldr r1, _080CE2CC @ =0x06012D00
	bl sub_8013008
	b _080CE2EC
	.align 2, 0
_080CE2BC: .4byte 0x08B7DBCC
_080CE2C0: .4byte 0x06011E00
_080CE2C4: .4byte 0x08B7E6B0
_080CE2C8: .4byte 0x08B7E308
_080CE2CC: .4byte 0x06012D00
_080CE2D0:
	ldr r0, _080CE300 @ =0x08B7E6D0
	ldr r1, _080CE304 @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CE308 @ =0x08B7F0F8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE30C @ =0x08B7ED90
	ldr r1, _080CE310 @ =0x06014B00
	bl sub_8013008
_080CE2EC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xa
	bne _080CE314
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE318
	.align 2, 0
_080CE300: .4byte 0x08B7E6D0
_080CE304: .4byte 0x06013C00
_080CE308: .4byte 0x08B7F0F8
_080CE30C: .4byte 0x08B7ED90
_080CE310: .4byte 0x06014B00
_080CE314:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE318:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

