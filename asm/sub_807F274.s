	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set GetTrapAt, 0x0802E128 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set LoadUnits, 0x080177DC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_807F274, "ax", %progbits
@ sub_807F274 @ JP 0x0807F274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F274
	.thumb_func
sub_807F274:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0x65
	bl sub_80D637C
	ldr r1, [r7, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetTrapAt
	movs r1, #1
	mov ip, r1
	cmp r0, #0
	beq _0807F29E
	ldrb r0, [r0, #7]
	mov ip, r0
_0807F29E:
	ldr r2, _0807F2D0 @ =0x03001C60
	movs r1, #0
	movs r0, #0xba
	strb r0, [r2]
	movs r0, #0x61
	strb r0, [r2, #1]
	strb r1, [r2, #2]
	ldrb r1, [r2, #3]
	movs r0, #1
	adds r3, r1, #0
	orrs r3, r0
	strb r3, [r2, #3]
	ldr r1, [r7, #0x2c]
	movs r4, #0xb
	ldrsb r4, [r1, r4]
	movs r0, #0xc0
	ands r4, r0
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bne _0807F2D4
	subs r0, #0xc7
	ands r3, r0
	b _0807F2F0
	.align 2, 0
_0807F2D0: .4byte 0x03001C60
_0807F2D4:
	cmp r4, #0x80
	bne _0807F2E2
	movs r0, #7
	rsbs r0, r0, #0
	ands r3, r0
	movs r0, #4
	b _0807F2EE
_0807F2E2:
	cmp r4, #0x40
	bne _0807F2F2
	movs r0, #7
	rsbs r0, r0, #0
	ands r3, r0
	movs r0, #2
_0807F2EE:
	orrs r3, r0
_0807F2F0:
	strb r3, [r5, #3]
_0807F2F2:
	mov r0, ip
	lsls r2, r0, #3
	ldrb r1, [r5, #3]
	movs r0, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	movs r0, #0x3f
	ldrb r1, [r6, #0x10]
	ands r1, r0
	ldrb r2, [r5, #4]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r5, #4]
	ldr r0, _0807F3D8 @ =0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #0
	strb r0, [r5, #7]
	str r0, [r5, #8]
	ldrb r1, [r5, #5]
	subs r0, #0x11
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r5, #5]
	movs r2, #0
	adds r3, r5, #0
	adds r3, #0xc
	movs r1, #0
_0807F342:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0807F342
	movs r2, #0
	ldr r4, _0807F3DC @ =0x03001C6C
_0807F354:
	ldr r0, [r7, #0x2c]
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0807F368
	adds r0, r2, r4
	strb r1, [r0]
_0807F368:
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0807F354
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0807F388
	ldrb r0, [r5, #5]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #5]
_0807F388:
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x44
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	strb r0, [r5, #0x12]
	movs r0, #0
	strb r0, [r5, #0x13]
	adds r0, r5, #0
	bl LoadUnits
	movs r0, #0xba
	bl GetUnitFromCharId
	ldr r0, [r7, #0x2c]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	bl sub_801759C
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_807B4B8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F3D8: .4byte 0xFFFFF03F
_0807F3DC: .4byte 0x03001C6C

