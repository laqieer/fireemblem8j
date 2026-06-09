	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_80C2E68, 0x080C2E68 + 1
	.section .text.sub_80C49B0, "ax", %progbits
@ sub_80C49B0 @ JP 0x080C49B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C49B0
	.thumb_func
sub_80C49B0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080C49F8 @ =0x03005270
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
	ldr r0, _080C49FC @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrb r1, [r5]
	movs r2, #1
	bl sub_80C2E68
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _080C4A00
	cmp r2, #1
	beq _080C4A0C
	adds r0, #1
	b _080C4A12
	.align 2, 0
_080C49F8: .4byte 0x03005270
_080C49FC: .4byte 0x08AC1108
_080C4A00:
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #2
	strb r0, [r1]
	adds r0, r1, #0
	b _080C4A12
_080C4A0C:
	adds r0, r4, #0
	adds r0, #0x2b
	strb r2, [r0]
_080C4A12:
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r2, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

