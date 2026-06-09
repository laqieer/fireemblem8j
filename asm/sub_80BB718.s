	.syntax unified
	.set sub_80BBA1C, 0x080BBA1C + 1
	.set sub_80BBD60, 0x080BBD60 + 1
	.section .text.sub_80BB718, "ax", %progbits
@ sub_80BB718 @ JP 0x080BB718 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB718
	.thumb_func
sub_80BB718:
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldrb r1, [r0]
	cmp r1, #1
	beq _080BB72A
	cmp r1, #2
	beq _080BB734
	b _080BB73C
_080BB72A:
	ldr r1, [r3, #0x38]
	adds r2, r3, #0
	bl sub_80BBA1C
	b _080BB73C
_080BB734:
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl sub_80BBD60
_080BB73C:
	pop {r0}
	bx r0

