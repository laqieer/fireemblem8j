	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C5F68, 0x080C5F68 + 1
	.section .text.sub_80C60E8, "ax", %progbits
@ sub_80C60E8 @ JP 0x080C60E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C60E8
	.thumb_func
sub_80C60E8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C6130 @ =0x08AC23C0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _080C60FE
	adds r0, r5, #0
	bl sub_8002DE4
_080C60FE:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C6114
	adds r0, r5, #0
	bl sub_8002DE4
_080C6114:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C6128
	adds r0, r5, #0
	bl sub_80C5F68
_080C6128:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C6130: .4byte 0x08AC23C0

