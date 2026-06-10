	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_804E5C8, 0x0804E5C8 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_80450A8, "ax", %progbits
@ sub_80450A8 @ JP 0x080450A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80450A8
	.thumb_func
sub_80450A8:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl sub_804E5C8
	ldr r0, _08045138 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080450D6
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne _080450D6
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl sub_8043190
_080450D6:
	ldr r0, _08045138 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq _080450F8
	ldrb r0, [r4]
	cmp r0, #0
	bne _080450F8
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl sub_8043190
_080450F8:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl sub_804F528
	ldr r0, _08045138 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08045140
	movs r0, #1
	bl sub_8043190
	ldr r0, _0804513C @ =0x02022FBE
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_8002DE4
	b _08045186
	.align 2, 0
_08045138: .4byte 0x085775CC
_0804513C: .4byte 0x02022FBE
_08045140:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045186
	ldrb r0, [r4]
	cmp r0, #0
	bne _08045168
	movs r0, #2
	bl sub_8043190
	ldr r1, _08045164 @ =0x0203DD20
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0804516E
	.align 2, 0
_08045164: .4byte 0x0203DD20
_08045168:
	movs r0, #1
	bl sub_8043190
_0804516E:
	ldr r0, _0804518C @ =0x02022FBE
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_8002DE4
_08045186:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804518C: .4byte 0x02022FBE

