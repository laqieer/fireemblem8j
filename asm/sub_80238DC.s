	.syntax unified
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_80238DC, "ax", %progbits
@ sub_80238DC @ JP 0x080238DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80238DC
	.thumb_func
sub_80238DC:
	push {lr}
	ldr r0, _080238F0 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080238F4
	movs r0, #3
	b _08023910
	.align 2, 0
_080238F0: .4byte 0x03004DF0
_080238F4:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_8037A24
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne _0802390E
	movs r0, #2
	b _08023910
_0802390E:
	movs r0, #1
_08023910:
	pop {r1}
	bx r1

