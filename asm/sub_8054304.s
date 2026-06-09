	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_8073418, 0x08073418 + 1
	.section .text.sub_8054304, "ax", %progbits
@ sub_8054304 @ JP 0x08054304 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8054304
	.thumb_func
sub_8054304:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl GetBanimDragonStatusType
	cmp r0, #2
	beq _08054354
	bl sub_805BDCC
	cmp r0, #0
	bne _08054354
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #1
	ldr r0, _0805435C @ =0x0201C912
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, _08054360 @ =0x02023CA8
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8073418
	movs r0, #4
	bl BG_EnableSyncByMask
_08054354:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805435C: .4byte 0x0201C912
_08054360: .4byte 0x02023CA8

