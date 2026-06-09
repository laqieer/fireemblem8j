	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8027AA0, "ax", %progbits
@ sub_8027AA0 @ JP 0x08027AA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027AA0
	.thumb_func
sub_8027AA0:
	push {lr}
	ldr r2, _08027AE8 @ =0x0202E4D4
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08027AEC
	ldr r0, [r2, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08027AEC
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08027AEC
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _08027AEC
	cmp r1, #2
	beq _08027AEC
	movs r0, #1
	b _08027AEE
	.align 2, 0
_08027AE8: .4byte 0x0202E4D4
_08027AEC:
	movs r0, #0
_08027AEE:
	pop {r1}
	bx r1
	.align 2, 0

