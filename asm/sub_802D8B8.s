	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_802D520, 0x0802D520 + 1
	.set sub_802D664, 0x0802D664 + 1
	.set sub_802DE40, 0x0802DE40 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.section .text.sub_802D8B8, "ax", %progbits
@ sub_802D8B8 @ JP 0x0802D8B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D8B8
	.thumb_func
sub_802D8B8:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_802DE40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802D91C
	ldr r4, _0802D918 @ =0x085C3FBC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F528
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F5D4
	b _0802D9DA
	.align 2, 0
_0802D918: .4byte 0x085C3FBC
_0802D91C:
	adds r0, r5, #0
	bl sub_802D520
	ldr r4, _0802D994 @ =0x085C3FBC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F528
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F5D4
	ldr r0, _0802D998 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D9A0
	adds r0, r5, #0
	bl sub_802D664
	ldr r0, _0802D99C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D9BA
	movs r0, #0x6a
	b _0802D9B6
	.align 2, 0
_0802D994: .4byte 0x085C3FBC
_0802D998: .4byte 0x085775CC
_0802D99C: .4byte 0x0202BCEC
_0802D9A0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802D9C8
	ldr r0, _0802D9C4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D9BA
	movs r0, #0x6b
_0802D9B6:
	bl m4aSongNumStart
_0802D9BA:
	adds r0, r5, #0
	bl sub_8002DE4
	b _0802D9DA
	.align 2, 0
_0802D9C4: .4byte 0x0202BCEC
_0802D9C8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D9DA
	ldr r0, _0802D9E0 @ =0x085C40B4
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802D9DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D9E0: .4byte 0x085C40B4

