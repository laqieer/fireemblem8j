	.syntax unified
	.set IsUnitMagicSealed, 0x08018A1C + 1
	.set sub_80502F4, 0x080502F4 + 1
	.set sub_80BA2F0, 0x080BA2F0 + 1
	.section .text.sub_8024100, "ax", %progbits
@ sub_8024100 @ JP 0x08024100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024100
	.thumb_func
sub_8024100:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	bne _0802413C
	ldr r0, _08024124 @ =0x03004DF0
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802412C
	ldr r1, _08024128 @ =0x000007D1
	adds r0, r4, #0
	bl sub_80502F4
	b _08024134
	.align 2, 0
_08024124: .4byte 0x03004DF0
_08024128: .4byte 0x000007D1
_0802412C:
	ldr r1, _08024138 @ =0x000007D2
	adds r0, r4, #0
	bl sub_80502F4
_08024134:
	movs r0, #8
	b _08024142
	.align 2, 0
_08024138: .4byte 0x000007D2
_0802413C:
	bl sub_80BA2F0
	movs r0, #0x17
_08024142:
	pop {r4}
	pop {r1}
	bx r1

