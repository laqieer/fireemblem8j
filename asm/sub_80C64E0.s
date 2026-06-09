	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.section .text.sub_80C64E0, "ax", %progbits
@ sub_80C64E0 @ JP 0x080C64E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C64E0
	.thumb_func
sub_80C64E0:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r1, r4
	bge _080C64FA
_080C64EE:
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r1, #1
	cmp r1, r4
	blt _080C64EE
_080C64FA:
	cmp r2, #0
	bne _080C6504
	movs r0, #1
	rsbs r0, r0, #0
	b _080C652A
_080C6504:
	adds r0, r2, #0
	bl NextRN_N
	adds r3, r0, #0
	movs r1, #0
	cmp r1, r4
	bge _080C6528
	ldrb r2, [r5]
	cmp r3, r2
	blt _080C6528
_080C6518:
	adds r1, #1
	cmp r1, r4
	bge _080C6528
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	cmp r3, r2
	bge _080C6518
_080C6528:
	adds r0, r1, #0
_080C652A:
	pop {r4, r5}
	pop {r1}
	bx r1

