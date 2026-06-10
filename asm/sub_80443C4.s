	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_End, 0x08002CBC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_8043574, 0x08043574 + 1
	.set sub_804E5C8, 0x0804E5C8 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_80443C4, "ax", %progbits
@ sub_80443C4 @ JP 0x080443C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80443C4
	.thumb_func
sub_80443C4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl sub_804E5C8
	ldr r0, _08044468 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080443F6
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne _080443F6
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl sub_8043190
_080443F6:
	ldr r0, _08044468 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq _08044418
	ldrb r0, [r5]
	cmp r0, #0
	bne _08044418
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl sub_8043190
_08044418:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl sub_804F528
	ldr r0, _08044468 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044470
	movs r0, #1
	bl sub_8043190
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0804446C @ =0x02022CC6
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl sub_8002DE4
	b _080444B8
	.align 2, 0
_08044468: .4byte 0x085775CC
_0804446C: .4byte 0x02022CC6
_08044470:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080444B8
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne _08044492
	adds r0, r4, #0
	bl sub_8043574
	movs r0, #2
	bl sub_8043190
	b _08044498
_08044492:
	movs r0, #1
	bl sub_8043190
_08044498:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _080444C0 @ =0x02022CC6
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl j_TmFillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl sub_8002DE4
_080444B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080444C0: .4byte 0x02022CC6

