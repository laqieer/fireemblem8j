	.syntax unified
	.set CanUnitSeize, 0x08037BFC + 1
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_8022FA4, "ax", %progbits
@ sub_8022FA4 @ JP 0x08022FA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022FA4
	.thumb_func
sub_8022FA4:
	push {r4, lr}
	ldr r4, _08022FC4 @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022FC0
	adds r0, r2, #0
	bl CanUnitSeize
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022FC8
_08022FC0:
	movs r0, #3
	b _08022FE2
	.align 2, 0
_08022FC4: .4byte 0x03004DF0
_08022FC8:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8086350
	movs r1, #3
	cmp r0, #0x11
	bne _08022FE0
	movs r1, #1
_08022FE0:
	adds r0, r1, #0
_08022FE2:
	pop {r4}
	pop {r1}
	bx r1

