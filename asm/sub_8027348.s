	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_802758C, 0x0802758C + 1
	.section .text.sub_8027348, "ax", %progbits
@ sub_8027348 @ JP 0x08027348 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027348
	.thumb_func
sub_8027348:
	push {r4, r5, r6, lr}
	ldr r0, _080273C0 @ =0x0203A014
	ldr r6, [r0]
	bl sub_802758C
	cmp r6, #0
	bne _08027358
	b _080274CA
_08027358:
	movs r3, #0
	movs r0, #4
	ldrsh r1, [r6, r0]
	ldr r2, _080273C4 @ =0x0202BCAC
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r5, #6
	ldrsh r1, [r6, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0802737E
	b _080274C2
_0802737E:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bls _08027388
	b _080274C2
_08027388:
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027396
	b _080274C2
_08027396:
	ldrb r1, [r6, #0xb]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080273AA
	bl sub_8000CD8
	adds r3, r0, #0
	movs r0, #2
	ands r3, r0
_080273AA:
	ldrb r0, [r6, #0xb]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #5
	bls _080273B6
	b _080274C2
_080273B6:
	lsls r0, r1, #2
	ldr r1, _080273C8 @ =_080273CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080273C0: .4byte 0x0203A014
_080273C4: .4byte 0x0202BCAC
_080273C8: .4byte _080273CC
_080273CC: @ jump table
	.4byte _080273E4 @ case 0
	.4byte _08027408 @ case 1
	.4byte _0802742C @ case 2
	.4byte _08027454 @ case 3
	.4byte _08027474 @ case 4
	.4byte _0802749C @ case 5
_080273E4:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027404 @ =0x085B8CE4
	ldrh r3, [r6, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	b _08027490
	.align 2, 0
_08027404: .4byte 0x085B8CE4
_08027408:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027428 @ =0x085B8D04
	ldrh r3, [r6, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	b _08027490
	.align 2, 0
_08027428: .4byte 0x085B8D04
_0802742C:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027450 @ =0x085B8CEC
	ldrh r3, [r6, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	b _08027490
	.align 2, 0
_08027450: .4byte 0x085B8CEC
_08027454:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027470 @ =0x085B8CE4
	b _0802748A
	.align 2, 0
_08027470: .4byte 0x085B8CE4
_08027474:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027498 @ =0x085B8D04
_0802748A:
	ldrh r3, [r6, #8]
	movs r4, #0xc0
	lsls r4, r4, #4
_08027490:
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
	b _080274C2
	.align 2, 0
_08027498: .4byte 0x085B8D04
_0802749C:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080274D0 @ =0x085B8CEC
	ldrh r3, [r6, #8]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
_080274C2:
	ldr r6, [r6]
	cmp r6, #0
	beq _080274CA
	b _08027358
_080274CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080274D0: .4byte 0x085B8CEC

