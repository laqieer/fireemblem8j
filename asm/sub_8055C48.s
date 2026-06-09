	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003520, 0x08003520 + 1
	.section .text.sub_8055C48, "ax", %progbits
@ sub_8055C48 @ JP 0x08055C48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055C48
	.thumb_func
sub_8055C48:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80034C4
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _08055C5E
	movs r0, #0
	movs r1, #0x1d
	bl sub_8003520
_08055C5E:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _08055C6C
	movs r0, #0
	movs r1, #0x1e
	bl sub_8003520
_08055C6C:
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

