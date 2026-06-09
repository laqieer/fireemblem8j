	.syntax unified
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80508D8, "ax", %progbits
@ sub_80508D8 @ JP 0x080508D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80508D8
	.thumb_func
sub_80508D8:
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _080508F8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080508FC
	ldr r3, [r2, #0x38]
	cmp r3, #0
	bne _0805091C
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x14]
	b _08050918
	.align 2, 0
_080508F8: .4byte 0x085775CC
_080508FC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805090A
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x18]
	b _08050918
_0805090A:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050928
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x1c]
_08050918:
	cmp r3, #0
	beq _08050928
_0805091C:
	ldr r1, [r2, #0x30]
	adds r0, r2, #0
	bl sub_80D65C8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08050928:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

