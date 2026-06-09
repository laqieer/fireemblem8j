	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80913FC, 0x080913FC + 1
	.section .text.sub_800E4E8, "ax", %progbits
@ sub_800E4E8 @ JP 0x0800E4E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E4E8
	.thumb_func
sub_800E4E8:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r4, r1
	ldrh r1, [r0, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800E506
	movs r0, #0x40
	orrs r4, r0
_0800E506:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E512
	ldr r0, _0800E568 @ =0x00002820
	orrs r4, r0
_0800E512:
	ldr r2, _0800E56C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bl sub_801569C
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl sub_8006710
	movs r0, #1
	bl BG_EnableSyncByMask
	str r5, [sp]
	ldr r0, _0800E570 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl sub_80913FC
	adds r0, r4, #0
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E568: .4byte 0x00002820
_0800E56C: .4byte 0x03003020
_0800E570: .4byte 0x06011000

