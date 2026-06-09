	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B4E8, 0x0801B4E8 + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.section .text.sub_801C91C, "ax", %progbits
@ sub_801C91C @ JP 0x0801C91C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C91C
	.thumb_func
sub_801C91C:
	push {r4, r5, r6, lr}
	ldr r4, _0801C96C @ =0x0202BCAC
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	bl sub_801B4E8
	ldr r0, _0801C970 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _0801C974 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C94E
	movs r0, #0x68
	bl m4aSongNumStart
_0801C94E:
	ldrb r1, [r4, #4]
	movs r0, #8
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #4]
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801C978
	movs r0, #5
	bl sub_801D6FC
	b _0801C97E
	.align 2, 0
_0801C96C: .4byte 0x0202BCAC
_0801C970: .4byte 0x0202E4DC
_0801C974: .4byte 0x0202BCEC
_0801C978:
	movs r0, #3
	bl sub_801D6FC
_0801C97E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

