	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8073418, 0x08073418 + 1
	.section .text.sub_80720DC, "ax", %progbits
@ sub_80720DC @ JP 0x080720DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80720DC
	.thumb_func
sub_80720DC:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0807214E
	bl GetBanimDragonStatusType
	cmp r0, #3
	beq _0807214E
	bl GetBanimDragonStatusType
	cmp r0, #2
	bne _08072110
	adds r1, r7, #0
	subs r1, #0x70
	ldr r0, _08072158 @ =0x03004F98
	ldr r0, [r0]
	subs r7, r1, r0
	adds r1, r6, #0
	adds r1, #8
	ldr r0, _0807215C @ =0x03004FA0
	ldr r0, [r0]
	subs r6, r1, r0
_08072110:
	asrs r4, r7, #3
	movs r1, #7
	asrs r5, r6, #3
	ands r6, r1
	movs r0, #3
	ands r1, r7
	adds r2, r6, #0
	bl BG_SetPosition
	lsls r4, r4, #1
	ldr r0, _08072160 @ =0x0201D46A
	adds r4, r4, r0
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r2, _08072164 @ =0x020244A8
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8073418
	movs r0, #8
	bl BG_EnableSyncByMask
_0807214E:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072158: .4byte 0x03004F98
_0807215C: .4byte 0x03004FA0
_08072160: .4byte 0x0201D46A
_08072164: .4byte 0x020244A8

