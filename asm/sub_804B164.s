	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8037474, 0x08037474 + 1
	.section .text.sub_804B164, "ax", %progbits
@ sub_804B164 @ JP 0x0804B164 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B164
	.thumb_func
sub_804B164:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B194 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B19C
	ldr r0, _0804B198 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804B188
	movs r0, #0x6a
	bl m4aSongNumStart
_0804B188:
	bl sub_8037474
	adds r0, r4, #0
	bl sub_8002DE4
	b _0804B1C2
	.align 2, 0
_0804B194: .4byte 0x085775CC
_0804B198: .4byte 0x0202BCEC
_0804B19C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B1C2
	ldr r0, _0804B1C8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804B1B6
	movs r0, #0x6b
	bl m4aSongNumStart
_0804B1B6:
	bl sub_8037474
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0804B1C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1C8: .4byte 0x0202BCEC

