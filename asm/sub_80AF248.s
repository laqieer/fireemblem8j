	.syntax unified
	.set sub_80C086C, 0x080C086C + 1
	.section .text.sub_80AF248, "ax", %progbits
@ sub_80AF248 @ JP 0x080AF248 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF248
	.thumb_func
sub_80AF248:
	push {lr}
	ldr r1, _080AF260 @ =0x0203EF60
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AF25A
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AF264
_080AF25A:
	movs r0, #0
	b _080AF26C
	.align 2, 0
_080AF260: .4byte 0x0203EF60
_080AF264:
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl sub_80C086C
_080AF26C:
	pop {r1}
	bx r1

