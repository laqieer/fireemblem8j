	.syntax unified
	.set sub_803AD58, 0x0803AD58 + 1
	.set sub_8040E18, 0x08040E18 + 1
	.section .text.AiFindClosestChestPosition, "ax", %progbits
@ AiFindClosestChestPosition @ JP 0x08040B0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiFindClosestChestPosition
	.thumb_func
AiFindClosestChestPosition:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_8040E18
	ldr r0, _08040B28 @ =0x085D31E6
	movs r1, #0
	adds r2, r4, #0
	bl sub_803AD58
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040B2C
	movs r0, #1
	b _08040B2E
	.align 2, 0
_08040B28: .4byte 0x085D31E6
_08040B2C:
	movs r0, #0
_08040B2E:
	pop {r4}
	pop {r1}
	bx r1

