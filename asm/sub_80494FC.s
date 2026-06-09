	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set PutSprite, 0x080052F0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042678, 0x08042678 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_80494FC, "ax", %progbits
@ sub_80494FC @ JP 0x080494FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80494FC
	.thumb_func
sub_80494FC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x54]
	ldr r4, _08049554 @ =0x085D3FF4
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x50
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x60
	adds r3, r4, #0
	bl PutSprite
	adds r4, r5, #0
	adds r4, #0x68
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, #0x28
	movs r1, #0x60
	bl sub_804F528
	ldr r0, _08049558 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804955C
	movs r0, #1
	bl sub_8043190
	str r6, [r7, #0x50]
	b _080495C2
	.align 2, 0
_08049554: .4byte 0x085D3FF4
_08049558: .4byte 0x085775CC
_0804955C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08049578
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bne _08049578
	subs r0, r1, #1
	strh r0, [r4]
	movs r0, #3
	bl sub_8043190
_08049578:
	ldr r0, _080495DC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0804959E
	adds r1, r5, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0804959E
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #3
	bl sub_8043190
_0804959E:
	ldr r0, _080495DC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049622
	adds r0, r5, #0
	adds r0, #0x68
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080495E4
	movs r0, #1
	bl sub_8043190
	movs r0, #2
	str r0, [r7, #0x50]
_080495C2:
	ldr r0, _080495E0 @ =0x020236EC
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_8002DE4
	b _08049622
	.align 2, 0
_080495DC: .4byte 0x085775CC
_080495E0: .4byte 0x020236EC
_080495E4:
	movs r0, #2
	bl sub_8043190
	ldr r0, _0804962C @ =0x02000C00
	ldr r1, [r7, #0x44]
	strb r1, [r0]
	movs r1, #4
	bl sub_8042678
	ldr r0, _08049630 @ =0x020236EC
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _08049634 @ =0x06016800
	movs r1, #0xd
	bl sub_808BB14
	movs r0, #0x40
	movs r1, #0x48
	movs r2, #0x67
	bl sub_808B1F4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08049622:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804962C: .4byte 0x02000C00
_08049630: .4byte 0x020236EC
_08049634: .4byte 0x06016800

