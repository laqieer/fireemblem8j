	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_800309C, "ax", %progbits
@ sub_800309C @ JP 0x0800309C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800309C
	.thumb_func
sub_800309C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, #8
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_80D65C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080030BA
	movs r0, #1
	b _080030C2
_080030BA:
	ldr r0, [r4, #4]
	subs r0, #8
	str r0, [r4, #4]
	movs r0, #0
_080030C2:
	pop {r4}
	pop {r1}
	bx r1

