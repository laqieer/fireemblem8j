	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_80274D4, "ax", %progbits
@ sub_80274D4 @ JP 0x080274D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80274D4
	.thumb_func
sub_80274D4:
	push {r4, r5, lr}
	ldr r4, _08027570 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x8f
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x90
	ldrb r4, [r0]
	bl sub_8000CD8
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08027500
	movs r2, #1
_08027500:
	cmp r5, #0xff
	beq _0802756A
	cmp r2, #0
	beq _0802756A
	ldr r0, _08027574 @ =0x0202E4E4
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802756A
	ldr r0, _08027578 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _0802756A
	lsls r1, r5, #4
	ldr r2, _0802757C @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	lsls r1, r4, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0802756A
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _0802756A
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r3, r1
	subs r1, #5
	ands r0, r1
	ldr r3, _08027580 @ =0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027584 @ =0x085B8CDC
	ldr r3, _08027588 @ =0x00000C51
	bl CallARM_PushToSecondaryOAM
_0802756A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027570: .4byte 0x0202BCEC
_08027574: .4byte 0x0202E4E4
_08027578: .4byte 0x0202E4D8
_0802757C: .4byte 0x0202BCAC
_08027580: .4byte 0x00000107
_08027584: .4byte 0x085B8CDC
_08027588: .4byte 0x00000C51

