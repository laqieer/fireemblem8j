	.syntax unified
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8018110, 0x08018110 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_801907C, 0x0801907C + 1
	.set sub_80325C0, 0x080325C0 + 1
	.section .text.sub_80358A8, "ax", %progbits
@ sub_80358A8 @ JP 0x080358A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80358A8
	.thumb_func
sub_80358A8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	blt _080358BC
	adds r0, r4, #0
	bl SetUnitStatus
_080358BC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_801907C
	adds r0, r4, #0
	bl sub_8018E64
	cmp r0, #0
	bgt _080358D4
	adds r0, r4, #0
	bl sub_8018110
_080358D4:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80325C0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

