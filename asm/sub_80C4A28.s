	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C2E68, 0x080C2E68 + 1
	.section .text.sub_80C4A28, "ax", %progbits
@ sub_80C4A28 @ JP 0x080C4A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4A28
	.thumb_func
sub_80C4A28:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080C4AA0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C4A4E
	cmp r0, #1
	beq _080C4A58
	adds r1, #1
	b _080C4A62
_080C4A4E:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	b _080C4A60
_080C4A58:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #2
_080C4A60:
	strb r0, [r1]
_080C4A62:
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _080C4A86
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080C4AA0
_080C4A86:
	ldr r0, _080C4AA8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	movs r2, #0
	bl sub_80C2E68
	adds r0, r4, #0
	bl sub_8002DE4
_080C4AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4AA8: .4byte 0x08AC1108

