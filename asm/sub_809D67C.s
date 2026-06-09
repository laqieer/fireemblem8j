	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_809D67C, "ax", %progbits
@ sub_809D67C @ JP 0x0809D67C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D67C
	.thumb_func
sub_809D67C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809D6CC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809D6A0
	ldr r0, _0809D6D0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D6A0
	movs r0, #0x6c
	bl m4aSongNumStart
_0809D6A0:
	ldr r0, _0809D6CC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809D6C6
	ldr r0, _0809D6D0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D6C0
	movs r0, #0x65
	bl m4aSongNumStart
_0809D6C0:
	adds r0, r4, #0
	bl sub_8002DE4
_0809D6C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D6CC: .4byte 0x085775CC
_0809D6D0: .4byte 0x0202BCEC

