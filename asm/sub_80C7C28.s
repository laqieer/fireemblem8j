	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set sub_80C6190, 0x080C6190 + 1
	.set sub_80C7BE0, 0x080C7BE0 + 1
	.section .text.sub_80C7C28, "ax", %progbits
@ sub_80C7C28 @ JP 0x080C7C28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7C28
	.thumb_func
sub_80C7C28:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C7C58 @ =0x08AC26D8
	bl CountProcs
	cmp r0, #1
	bne _080C7C3A
	bl sub_80C7BE0
_080C7C3A:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C7C52
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080C7C52
	bl sub_80C6190
_080C7C52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7C58: .4byte 0x08AC26D8

