	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetUnit, 0x08019108 + 1
	.set InitTargets, 0x08050618 + 1
	.section .text.sub_8035AB4, "ax", %progbits
@ sub_8035AB4 @ JP 0x08035AB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035AB4
	.thumb_func
sub_8035AB4:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	movs r4, #0x81
_08035AC2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08035AF2
	ldr r0, [r2]
	cmp r0, #0
	beq _08035AF2
	ldr r0, [r2, #0xc]
	ldr r1, _08035B08 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08035AF2
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0xb]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0
	bl AddTarget
_08035AF2:
	adds r4, #1
	cmp r4, #0xbf
	ble _08035AC2
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035B08: .4byte 0x0001000C

