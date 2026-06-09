	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003520, 0x08003520 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8073820, 0x08073820 + 1
	.section .text.sub_8055BE0, "ax", %progbits
@ sub_8055BE0 @ JP 0x08055BE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055BE0
	.thumb_func
sub_8055BE0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #1
	beq _08055C3E
	bl sub_80034C4
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08055C06
	str r0, [r4, #0x4c]
_08055C06:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _08055C20
	movs r0, #0
	movs r1, #0x1d
	bl sub_8003520
	ldr r0, _08055C44 @ =0x020228A8
	ldr r3, [r4, #0x4c]
	movs r1, #0x1d
	movs r2, #1
	bl sub_8073820
_08055C20:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _08055C3A
	movs r0, #0
	movs r1, #0x1e
	bl sub_8003520
	ldr r0, _08055C44 @ =0x020228A8
	ldr r3, [r4, #0x4c]
	movs r1, #0x1e
	movs r2, #1
	bl sub_8073820
_08055C3A:
	bl sub_8001EE4
_08055C3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055C44: .4byte 0x020228A8

