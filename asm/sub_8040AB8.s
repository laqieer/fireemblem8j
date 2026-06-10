	.syntax unified
	.set sub_803AEB4, 0x0803AEB4 + 1
	.set sub_8040E18, 0x08040E18 + 1
	.set sub_8040F3C, 0x08040F3C + 1
	.section .text.sub_8040AB8, "ax", %progbits
@ sub_8040AB8 @ JP 0x08040AB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040AB8
	.thumb_func
sub_8040AB8:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8040F3C
	ldr r0, _08040AFC @ =0x085D31E4
	movs r1, #0
	adds r2, r4, #0
	bl sub_803AEB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040B04
	adds r0, r5, #0
	bl sub_8040E18
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08040B00 @ =0x0202E4E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08040B04
	movs r0, #1
	b _08040B06
	.align 2, 0
_08040AFC: .4byte 0x085D31E4
_08040B00: .4byte 0x0202E4E0
_08040B04:
	movs r0, #0
_08040B06:
	pop {r4, r5}
	pop {r1}
	bx r1

