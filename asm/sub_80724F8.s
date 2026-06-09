	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckEkrDragonSkipTransfer, 0x080727E4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetEkrDragonStatusUnk1, 0x08072054 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80724F8, "ax", %progbits
@ sub_80724F8 @ JP 0x080724F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80724F8
	.thumb_func
sub_80724F8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl CheckEkrDragonSkipTransfer
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08072574
	ldr r0, _08072568 @ =0x020244A8
	movs r1, #0xc0
	lsls r1, r1, #7
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, _0807256C @ =0x020228A8
	movs r1, #6
	movs r2, #1
	movs r3, #0x10
	bl sub_80737A4
	bl sub_8001EE4
	movs r0, #0
	bl SetEkrDragonStatusUnk1
	ldr r3, _08072570 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r0, r6, #0
	bl sub_8002DE4
	b _08072664
	.align 2, 0
_08072568: .4byte 0x020244A8
_0807256C: .4byte 0x020228A8
_08072570: .4byte 0x03003020
_08072574:
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r5, r0, #0
	ldr r0, _080725B4 @ =0x087E62B4
	ldr r4, _080725B8 @ =0x02022968
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r7, r4, #0
	subs r7, #0xc0
	adds r0, r7, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl sub_80737A4
	ldr r0, _080725BC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080725C0
	cmp r0, #1
	beq _080725E0
	b _080725F8
	.align 2, 0
_080725B4: .4byte 0x087E62B4
_080725B8: .4byte 0x02022968
_080725BC: .4byte 0x0203E11C
_080725C0:
	ldr r0, _080725DC @ =0x02020068
	adds r1, r4, #0
	subs r1, #0x40
	movs r2, #0x10
	bl sub_80D636C
	adds r0, r7, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl sub_80737A4
	b _080725F8
	.align 2, 0
_080725DC: .4byte 0x02020068
_080725E0:
	ldr r0, _0807266C @ =0x02020068
	adds r1, r4, #0
	subs r1, #0x40
	movs r2, #8
	bl sub_80D636C
	adds r0, r7, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_80737A4
_080725F8:
	bl sub_8001EE4
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08072664
	strh r4, [r6, #0x2c]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08072670 @ =0x0203E100
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, _08072674 @ =0x020244A8
	movs r1, #0xc0
	lsls r1, r1, #7
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #0
	bl SetEkrDragonStatusUnk1
	ldr r3, _08072678 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r0, r6, #0
	bl sub_8002DE4
_08072664:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807266C: .4byte 0x02020068
_08072670: .4byte 0x0203E100
_08072674: .4byte 0x020244A8
_08072678: .4byte 0x03003020

