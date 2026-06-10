	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80370E8, "ax", %progbits
@ sub_80370E8 @ JP 0x080370E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80370E8
	.thumb_func
sub_80370E8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803710C
	ldr r0, _08037108 @ =0x085C6A20
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _0803710E
	.align 2, 0
_08037108: .4byte 0x085C6A20
_0803710C:
	movs r0, #0
_0803710E:
	lsls r0, r0, #5
	ldr r1, _08037138 @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r4, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08037140
	ldr r0, _0803713C @ =0x085C6A20
	ldr r1, [r4, #0x2c]
	movs r2, #0x1f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	b _08037142
	.align 2, 0
_08037138: .4byte 0x0200300C
_0803713C: .4byte 0x085C6A20
_08037140:
	movs r0, #0
_08037142:
	lsls r0, r0, #5
	ldr r1, _08037158 @ =0x0200300C
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037158: .4byte 0x0200300C

