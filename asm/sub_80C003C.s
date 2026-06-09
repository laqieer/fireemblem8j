	.syntax unified
	.set MapUnitC_SetFaction, 0x080BFE68 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80BFDD4, 0x080BFDD4 + 1
	.section .text.sub_80C003C, "ax", %progbits
@ sub_80C003C @ JP 0x080C003C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C003C
	.thumb_func
sub_80C003C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	b _080C0080
_080C0044:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x30
	cmp r0, #0
	bge _080C0068
	ldr r0, _080C0090 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, #0
	bl sub_80BFDD4
_080C0068:
	ldr r0, _080C0090 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	bl MapUnitC_SetFaction
	adds r6, #1
	adds r0, r5, #0
_080C0080:
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C0044
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C0090: .4byte 0x08AC1108

